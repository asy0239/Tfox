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

 
 #userInfo {
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
 .address {
		width: 250px;
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
<h2>주문/결제</h2>
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
<h2>배송지정보</h2>

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
				<span><input type="text" class="address"></span>
				<span><button class="btn">우편검색</button></span>
				<br>
				<span><input type="text" class="address"></span>
				<span><input type="text" class="address" placeholder="상세주소"></span>
				
		</div>
	</form>
</div>
</div>
<!-- 결제 수단 -->
	<h3><label>결제 구분</label></h3>
<div id="pay" align="center">
	<label>카카오 페이</label>
	<span><input type="submit" value="결제하기" class="btn"></span>
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




