<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>주문/결제</title>
<style>
	#cart {
		margin-top:1 auto;
		border-bottom:1px solid lightgray;
	}
	#cartPro {
		width:1000px;
		height:500px;
		margin:0 auto;

	}
	
	#item-table {
		width:1000px;
		margin:0 auto;
		margin-bottom: 80px;
		border-top:1px solid black;
		border-bottom:1px solid black;		
		
	}
	
 	#itemArea {
        font-size: small;
		width:1000px;
		height:50px;
 }
 
 #proinfo {
	width:1000px;
		margin:0 auto;
		margin-bottom: 80px;
		border-top:1px solid black;
		border-bottom:1px solid black;
}
#sum {
	    width: 200px;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: white;
    	padding: 11px 70px 11px 0;
    	color: #blue;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
}

#order {
    min-width: 190px;
    height: 55px;
    padding: 0 20px 0 20px;
    color: #ffffff;
    font-size: 14px;
    border: 1px solid black;
    background: black;
    cursor: pointer;
    font-weight: bold;
    float:right;
}
 #infoSelect {
 	border-bottom:1px solid lightgray;
 	margin-bottom:20px;
 }

 
 #getInfo {
 	display:block;	
 	
 }
 #newInfo{
		
 		display:none;
 	
 }
.input {
	    width: 200px;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	}
	#phone {
		width: 200px;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	}
 
 
 #homeSearch {
 	cursor:pointer;
 	backgrond-color:red;
 }
 #userAddress {
		width: 270px;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	
	}
	#AddressNum, #AddressDetail {
		width: 80%;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	}
	
	#pay {
		margin: 0 auto;
    	padding:100px;
	}

</style>
</head>
<body>

<div id="wrap">
<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
<h2 align="center" id="cart">C A R T</h2>

<h2>주문/결제</h2>
<div id="cartPro">
<div id="item-table">
<!-- 상품정보 테이블 -->
		<c:if test="${ !empty sessionScope.loginUser }">
	<form name="proInfo" method="post" action="confirm" name="form">
	<table id="proT1">	
		<tr id="itemArea">
			<th><input type=hidden></th>
			<th><input type="checkbox" id="allCheck" ></th>
			<th width="600px">상품정보</th>
			<th width="50px">수량</th>
			<th width="120px">상품금액</th>
			<th width="120px">합계금액</th>		
			<th width="120px">배송비</th>		
		</tr>
		
		<c:forEach var="CartVo"  items="${cartInfo}">
		<!-- 상품정보 데이터 -->
		<tr id="proInfo" align="center">
			<%-- <td name="item_name"><c:out value="${CartVo.pro_name}"/>
				<a>+</a>
				<c:out value="${CartVo.pro_color}"/>
				<a>+</a>
				<c:out value="${CartVo.pro_size}"/>
			</td> --%>
			<td><input type="hidden" name="pro_id" <c:out value='${CartVo.pro_id }'/>"></td>
			<td><input type="checkbox" id="proCheck" name="total_amount" value="${CartVo.pro_price}"></td>
			<td><input type="text" id="product" name="item_name" value="${CartVo.pro_name}"> +
				<input type="text" id="product" name="pro_color" value="${CartVo.pro_color}"> +
				<input type="text" id="product" name="pro_size" value="${CartVo.pro_size}">			
			</td>
			<td><input type="number" id="proEa" width="20px" min="1" max="5" value="${CartVo.pro_ea}" name="quantity"></td>
			<td id="price"><input type="text" name="total_amount"  value="${CartVo.pro_price}"/>원</td>	
			
			<td id="price" ><fmt:formatNumber type="currency" pattern="###,###,###" value="${map.sumMoney}"/>원</td>
			<td> ${map.fee}</td>
		</tr>
		</c:forEach>
	</table>
	<div>
		합계 금액 <fmt:formatNumber value="${map.sum}" pattern="#,###,###" />
	</div>
	<div>
		 <input type="text" value="Kakopay" name="pay_type">
		 <button type="submit" id="order" name="pay_type" value="KakaoPay" >주문하기</button>
	</div>
	</form>

</c:if>

</div>
</div>
</div>
<!-- 주문자 정보 -->
<h2>주문자 정보</h2>
<div id="userInfo">
	<form name="userinfo" method="get" action="getInfo">
	<table id="userT1">
		<tr>
			<input type="hidden" ${user[0].user_id }">
			<th>이름 :</th>				
			<td>${user[0].user_name}</td>
		</tr>
		<tr>
			<th>연락처 :</th>													
			<td>${user[0].user_phone}</td>
		</tr>
		<tr>
			<th>주소 :</th>	
			<td>${user[0].user_addr}</td>
		</tr>

	</table>
				</form>
</div>
<!-- 배송지 정보 테이블 -->
<h2>배송지정보</h2>

	<div id="infoSelect">배송지 확인
	<input type="radio" name="info" id="Ui" checked>회원정보 배송지
	<input type="radio" name="info" id="Ni">신규 배송지
	</div>

<div class="homeInfo">
	<form id="getInfo" name="User" method="get" action="getInfo">
	<table>
		<tr>
			<input type="hidden" ${user[0].user_id }">
			<th>이름 :</th>				
			<td>${user[0].user_name}</td>
		</tr>
		<tr>
			<th>연락처 :</th>													
			<td>${user[0].user_phone}</td>
		</tr>
		<tr>
			<th>주소 :</th>	
			<td>${user[0].user_addr}</td>
		</tr>

	</table>
				</form>
</div>
<!-- 신규배송지 -->
<div class="homeInfo">
	<form id="newInfo">
		<div>
			<h3>
				<label>이름</label>
			</h3>
				<span><input type="text" class="input"></span>
			<h3>
				<label>번호</label>
			</h3>
				<span><input type="text"  id="phone"></span>-
				<span><input type="text"  id="phone"></span>-
				<span><input type="text"  id="phone"></span>
			<h3>	
			<label>주소</label>
			</h3>
				<span><input type="text" class="address" id="userAddress" name="userAddress"  placeholder="우편번호"></span>
				<span><input type="button" class="btn" onclick="execPostCode();" value="우편검색"></span>
				<br>
				<span><input type="text" class="address" id="AddressNum" name="AddressNum"  placeholder="도로명 주소"></span>
				<br>
				<span><input type="text" class="address" id="AddressDetail" placeholder="상세주소" name="AddressDetail"></span>
				
		</div>
	</form>
</div>
</div>
<!-- 결제 정보 -->
<h2>결제 정보</h2>
<div class="orderList">
	<form id="orderList" action="orderInfo" method="post">
	<table>
		<tr>
			<th>상품 합계 금액 :</th> 
			<td><input name="totalPrice" type="text" size="20" readonly></td>
		</tr>
		<%-- <fmt:formatNumber type="currency" name="totalPrice" value="${proVo.pro_price * proVo.order_ea}" /> --%>
	    <tr>
	    	<th>배송비 (5만원 이상 구매시 무료) :</th>
	    	<td><fmt:formatNumber type="currency" value="${totalPrice >50000 ? 0 :2500 }" /></td>
	    </tr>
	    <tr>
	     	<th>최종 결제 금액 :</th>
	     	<td id="totalPrice"><fmt:formatNumber value="${totalPrice > 50000 ?  totalPrice: totalPrice+2500 }" type="currency"  /></td>
	    </tr>
	</table>
	</form>
</div>

<div id="pay" align="center">
	<label>카카오 페이</label>
	<span><input type="submit" value="결제하기" class="btn"></span>
</div>
</div>
<script>
$("#Ui").on("click", function(){
    $("#newInfo").css({"display":"none"});
    $("#getInfo").css("display","block");
})
$("#Ni").on("click", function(){
    $("#getInfo").css("display","none");
    $("#newInfo").css("display","block");

});

//주소 API
function execPostCode() {
		new daum.Postcode({ 
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다. 
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
				var fullRoadAddr = data.roadAddress; 
				// 도로명 주소 변수
				var extraRoadAddr = ''; 
				// 도로명 조합형 주소 변수 
				// 법정동명이 있을 경우 추가한다. (법정리는 제외) 
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다. 
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) { 
					extraRoadAddr += data.bname; } 
				// 건물명이 있고, 공동주택일 경우 추가한다. 
				if(data.buildingName !== '' && data.apartment === 'Y') { 
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
					} 
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다. 
				if(extraRoadAddr !== ''){ extraRoadAddr = ' (' + extraRoadAddr + ')'; } 
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다. 
				if(fullRoadAddr !== ''){ fullRoadAddr += extraRoadAddr; } 
				// 우편번호와 주소 정보를 해당 필드에 넣는다. 
				console.log(data.zonecode); 
				console.log(fullRoadAddr); 
				/* var a = console.log(data.zonecode); 
				var b = console.log(fullRoadAddr); 
				if(a == null || b = null){ alert("주소를 확인하세요."); 
				return false; 
				} */ 
				$("[name=userAddress]").val(data.zonecode); 
				$("[name=AddressNum]").val(fullRoadAddr); 
				document.getElementById('userAddress').value = data.zonecode;
				//5자리 새우편번호 사용 
				document.getElementById('AddressNum').value = fullRoadAddr; 
				
				} 
		}).open();
		}
	
</script>
</html>




