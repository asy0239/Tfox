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

#wrap { 
	width:1500px;
	background:white;
	margin:0 auto;
	padding:0 auto;
}
.btn {
		width: 100px;
    	height: 30px;
    	font-size: large;
    	border-radius: 10px/10px;
    	background: white;
    	font-weight: bold;
	}

	.header{
		width:1200px;
	}
	.header_top_wrap{
		width: 1200px;
		height: 45px;
		margin:0 auto;
		border-bottom: 1px solid;
		border-bottom-color: #a0a0a0;
	}
	.header_top_left{
		width: 50%;
		height: 45px;
		float: left;
	}
	.header_top_right{
		width:50%;
		height: 45px;
		float: right;
	}
	.header_top_rightbar{
		margin-left: 150px;
	}
	.header_top_leftbar li{
		list-style-type: none;
		float: left; 
		margin-right: 20px;
	}

	.header_top_rightbar li{
		list-style-type: none;
		float: left;
		margin-left: 20px;
	} 
	
	.header_mid{
		width: 1200px;
		margin:0 auto;
	}
	.mid_img{
		margin:0 auto;
		width: 340px;
		height: 340px;
	}
	#cart {
		margin-top:1 auto;
		border-bottom:1px solid lightgray;
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
		height:30px;
 }
 
 #proinfo {
	width:1000px;
		margin:0 auto;
		margin-bottom: 80px;
		border-top:1px solid black;
		border-bottom:1px solid black;
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
<div class="proInfo">
<h2>주문/결제</h2>
<div id="item-table">
<!-- 상품정보 테이블 -->
		<c:if test="${ !empty sessionScope.loginUser }">
		<c:choose>
		<c:when test="list.count == 0">
			장바구니가 비어 있습니다.
		</c:when>
		<c:otherwise>
	<form name="proInfo" method="get" action="proInfo" name="form">
	<table id="proT1">
		
		<tr id="itemArea">
			<th width="600px">상품정보</th>
			<th width="50px">수량</th>
			<th width="120px">상품금액</th>
			<th width="120px">배송비</th>
			
		</tr>
		<c:set var="sum" value="0"/>
		<c:forEach var="proVo"  items="${proInfo}">
		<!-- 상품정보 데이터 -->
		<tr id="proInfo" align="center">
			<input type="hidden" "<c:out value='${proVo.pro_id }'/>">
			<td><c:out value="${proVo.pro_name}"/>
			<a>+</a>
				<c:out value="${proVo.pro_color}"/>
				<a>+</a>
				<c:out value="${proVo.pro_size}"/>
			</td>
			<td><input type="number" width="50px" min="1" max="5" value="1"></td>
			<td id="price"><fmt:formatNumber type="currency" pattern="###,###,###" value="${proVo.pro_price}"/>원</td>
			<td><c:out value="2500"/></td>
		</tr>
		</c:forEach>
		<c:set var="sum" value="${sum+(proVo.pro_price * proVo.order_ea) }"/>
	</table>
	</form>
		<div class="proTotal">
 			<div class="sum">
 		총 합계 : <fmt:formatNumber  type="currency" pattern="###,###,###" value="${sum}" />원
 		</div>
 			</div>
	</c:otherwise>
</c:choose>
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
</c:if>
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
</body>
</html>




