<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>주문/결제</title>
<style>

#wrap { 
	width:1500px;
	background:white;
	margin:0 auto;
	padding:0 auto;
}
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
		border-top:1px solid lightgray;
	}
	#item-table {
		width:1200px;
		margin:0 auto;
		margin-bottom: 80px;
		border-top:1px solid black;
		border-bottom:1px solid black;
		
	}
	.address {
		width:1200px;
	}

 	#itemArea {
		text-align:center;
        font-size: small;
		width:1200px;
		height:30px;
 }
 #infoSelect {
 	border-bottom:1px solid lightgray;
 	margin-bottom:20px;
 }
 #userInfo, #newInfo {
 	width:1200px;
 	height:600px;
 	border:1px outset lightgray;
 	border-radius:100px/50px;
 	border-spacing: 100px;
  	border-collapse: separate;
 }
 
 #userInfo {
 	display:block;	
 	
 }
 #newInfo{
		
 		display:none;
 	
 }
 #newInfo td:nth-child(1){
		height: 30px;
		width: 100px;
		background:lightgray;
		color:black;
		border-radius: 50px / 10px;
 
 }
 
 
 #homeSearch {
 	cursor:pointer;
 	backgrond-color:red;
 }

 

</style>
</head>
<body>

<div id="wrap">
<!-- 상단바  -->
	<div id="header">
		<!-- 상단바 _ top 메뉴 -->
		<div class="header_top_wrap">
			<div class="header_top_left">
				<ul class="header_top_leftbar">
					<li><a href="center">CENTER</a></li>
					<li><a href="">REVIEW</a></li>
				</ul>
			</div>
			<div class="header_top_right">
				<ul class="header_top_rightbar">
					<li><a href="login">LOGIN</a></li>
					<li><a href="${pageContext.request.contextPath }/join">JOIN</a></li>
					<li><a href="">MY PAGE</a></li>
					<li><a href="">ORDER</a></li>
					<li><a href=""><img src="${pageContext.request.contextPath }/resources/img/webFront/bb.PNG" alt="장바구니"/></a></li>
				</ul>
			</div>
	
		</div>
		<!-- 로고 이미지  -->
		<div class="header_mid">
			<div class="mid_img">
				<a>
					<img src="${pageContext.request.contextPath }/resources/img/webFront/webLogo.png"/>
				</a>
			</div>
		</div>
		</div>
<h2 align="center" id="cart">C A R T</h2>
<div class="confirm">
<h2 id="cart">주문/결제</h2>
<div id="item-table">
<!-- 상품정보 테이블 -->
	<form>
	<table>
		<tr id="itemArea">
			<th width="500px">상품정보</th>
			<th width="100px">판매처</th>
			<th width="100px">배송비</th>
			<th width="100px">수량</th>
			<th width="200px">주문금액</th>
		</tr>
		<!-- 상품정보 데이터 -->
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	</form>
</div>
<!-- 배송지 정보 테이블 -->
<h2 id="cart">배송지정보</h2>

	<div id="infoSelect">배송지 선택
	<input type="radio" name="info" id="Ui" checked>회원정보 배송지
	<input type="radio" name="info" id="Ni">신규 배송지
	</div>

<div id="userInfo">
	<form>
	<table>
		<tr>
			<td id="userName">이름 </td>
		</tr>
		
		<tr>
			<td id="phone">번호 </td>
		</tr>
		
		<tr>
			<td id="address">주소</td>
		</tr>
	</table>
				</form>
</div>
<!-- 신규배송지 -->
<div class="homeInfo">
<form>
	<table id="newInfo">
		<tr>
			<td>이름 </td>
			<td><input type="text" maxlength="13" name="userId" id="userId"></td>
		</tr>
		<tr>
			<td>연락처 </td>
					<td>
						<select>
							<option value="010" selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
						</select>-
						<input type="text" maxlength="4" name="tel2" size="2">-
						<input type="text" maxlength="4" name="tel3" size="2">
					</td>
		</tr>
		<tr>
					<td>우편번호</td>
					<td><input type="text" name="zipCode"></td>
					<td><div id="homeSearch">검색</div></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address1"></td>
					<td><input type="text" name="address2"></td>
					<td></td>
				</tr>
	</table>
				</form>
</div>
</div>
<!-- 결제 수단 -->
<div id="pay">카카오페이
	<input type="submit" value="결제하기">
</div>
</div>
<script>
$("#Ui").on("click", function(){
    $("#newInfo").css({"display":"none"});
    $("#userInfo").css("display","block");
})
$("#Ni").on("click", function(){
    $("#userInfo").css("display","none");
    $("#newInfo").css("display","block");

});
	
</script>
</body>
</html>




