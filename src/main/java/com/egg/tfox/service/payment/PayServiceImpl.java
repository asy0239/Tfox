package com.egg.tfox.service.payment;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.egg.tfox.entity.Payment;
import com.egg.tfox.entity.User;
import com.egg.tfox.vo.cart.CartVo;
import com.egg.tfox.vo.payment.PayApproveReady;
import com.egg.tfox.vo.payment.PayApproveResult;
import com.egg.tfox.vo.payment.PayRequestReady;
import com.egg.tfox.vo.payment.PayRequestResult;

@Service
public class PayServiceImpl implements PayService{
@Autowired
private SqlSession sqlSession;
	@Override
	public PayRequestResult request(PayRequestReady ready, String userId) throws URISyntaxException {
		//번호 생성
				int no = sqlSession.selectOne("payment.seq");
				String pay_id = sqlSession.selectOne("payment.sequen");
				
				//1.전송도구 생성
				RestTemplate template = new RestTemplate();
				
				//2. 요청 헤더 준비(편지봉투)
				HttpHeaders headers = new HttpHeaders();
				headers.add("Authorization", "KakaoAK 365a58b82f5aa763e642022cb8c7be54");
				headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				
				//3. 요청 바디 준비(편지지)
				// - MultiValueMap은 key 한 개에 value 여러 개가 연결될 수 있는 형태의 저장소
				// - 즉, Map<K, List<K>> 형태와 같다
				MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
				//List<CartVo> UP_id = sqlSession.selectList("payment.UP_id", userId);
				
				body.add("cid", "TC0ONETIME");//가맹점번호
				body.add("partner_order_id", ready.getPartner_order_id());//주문번호
				body.add("partner_user_id", ready.getPartner_user_id());//사용자번호
				body.add("item_name", ready.getItem_name());//상품이름(사용자에게 표시)
				body.add("quantity", String.valueOf(ready.getQuantity()));//수량
				body.add("total_amount", String.valueOf(ready.getTotal_amount()));//총 결제금액
				body.add("tax_free_amount", "0");//총 비과세액
				body.add("approval_url", "http://localhost:8089/tfox/payment/success?no="+no);//성공시 수신할 주소
				body.add("fail_url", "http://localhost:8089/spring17/pay/fail?no="+no);//실패시 수신할 주소
				body.add("cancel_url", "http://localhost:8089/spring17/pay/cancel?no="+no);//취소시 수신할 주소
				
				//4. 요청헤더와 바디를 합성(2+3)
				HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
				
				//5. 주소 설정
				URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
				
				//6. 요청 전송
				//- postForLocation은 전송만 하는 명령
				//- postForObject는 전송 후 응답을 수신하는 명령
				
				//map으로 받는 방법
				//Map<String, String> map = template.postForObject(uri, entity, Map.class);
				//log.info("result = {}", result);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("pay_id", ready.getPay_id());
				
				//클래스 객체로 받는 방법
				PayRequestResult result = 
						template.postForObject(uri, entity, PayRequestResult.class);
				
				//실제 결제 요청정보를 등록
				Payment payment = Payment.builder()
							.no(no)
							.tid(result.getTid())
							.partner_order_id(ready.getPartner_order_id())
							.partner_user_id(ready.getPartner_user_id())
							.total_amount(ready.getTotal_amount())
							//db에 추가된 항목들을 등록할 수 있도록 전달
							.quantity(ready.getQuantity())
							.item_name(ready.getItem_name())
							.pay_status("결제대기")
						.build();
				sqlSession.insert("payment.request", payment);
				System.out.println("pay : " + payment);
				
				return result;
	}
	
	@Override
	public PayApproveResult approve(PayApproveReady ready) throws URISyntaxException {
		RestTemplate template = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authoization", "KakaoAk 365a58b82f5aa763e642022cb8c7be54");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TC0ONETIME");
		body.add("tid", ready.getTid());
		body.add("partner_order_id", ready.getPartner_order_id());
		body.add("partner_user_id", ready.getPartner_user_id());
		body.add("pg_token", ready.getPg_token());
		
		HttpEntity<MultiValueMap<String, String>> entity = 
				new HttpEntity<>(body, headers);
		
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");
		
		PayApproveResult result = 
			template.postForObject(uri, entity, PayApproveResult.class);
		
		return result;
	}
	@Override
	public PayApproveResult approve(int no, String pg_token) throws URISyntaxException {
		//no를 이용해서 결제 요청 데이터를 불러온 뒤 승인작업을 진행
				Payment payment = this.get(no);
				
				//payment의 데이터를 KakaoPayApproveReady 형태로 복사
				PayApproveReady ready = PayApproveReady.builder()
							.tid(payment.getTid())
							.partner_order_id(payment.getPartner_order_id())
							.partner_user_id(payment.getPartner_user_id())
							.pg_token(pg_token)
						.build();
				
				//서비스를 호출하여 승인요청을 수행 후 결과를 받는다
				PayApproveResult result = this.approve(ready);
				
				//승인되었으므로 승인과 관련된 데이터베이스 수정 작업을 지시
				this.approveDatabase(payment.getNo());
				
				return result;
	}
	@Override
	public Payment get(int no) {
		return sqlSession.selectOne("payment.get", no);
	}

	@Override
	public void approveDatabase(int no) {
		sqlSession.update("payment.approve", no);
		
	}

	@Override
	public Payment get(String pay_id) {		
		return sqlSession.selectOne("payment.get", pay_id);
	}

	@Override
	public List<User> userlist() {
		
		return sqlSession.selectOne("payment.user");
	}

//	@Override
//	public List<CartVo> uplist(Map<String, Object> maplist) {
//		
//		System.out.println("시바ㅏㅂㅈㄷ"  + maplist);
//		return sqlSession.selectList("payment.uplist", maplist);
//	}
	

}
