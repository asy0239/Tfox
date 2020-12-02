<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<style>

	.header_mid{
		width: 1200px;
		margin:0 auto;
	}
	.mid_img{
		margin:0 auto;
		width: 340px;
		height: 340px;
	}
	#join {
		margin:0 auto;
		padding:0 auto;
	}
	#joinForm {
		position: relative;
    	max-width: 580px;
    	min-height: 520px;
    	margin: 0 auto;
    	padding: 58px 69px 139px;
    	border: 1px solid lightgray;
    	
	}
	label {
		color:gray;
	}
	.input {
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
	.birth {
	 	width: 170px;
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
	.address {
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
	.btn {
		width: 100px;
    	height: 30px;
    	font-size: large;
    	border-radius: 10px/10px;
    	background: white;
    	
    	font-weight: bold;
	}
	
	.subjoin {		
    	margin: 0 auto;
    	padding:100px;
	}
	#phone {
		width: 170px;
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

</style>
</head>
<body>
	<div id="wrap">
		<!-- 로고 이미지  -->
		<div class="header_mid">
			<div class="mid_img">
				<a>
					<img src="${pageContext.request.contextPath }/resources/img/webFront/webLogo.png"/>
				</a>
			</div>
		</div>
		</div>
	<div id="join">
	<form id="joinForm" action="insert" method="POST">
	<h2><label>가입정보를 입력해주세요.</label></h2>
	<br>
		<div>
			<h3>
			<label>이름</label>
			</h3>
				<span><input type="text" class="input"></span>
				<h3>
			<label id="userId">아이디</label>
			</h3>
				<span><input type="text" class="input"></span>
				<span><button class="btn" id="idCheck">중복확인</button></span>
				<h3>
			<label>비밀번호</label>
			</h3>
				<span><input type="password" class="input" placeholder="비밀번호"></span>
				<br>
				<span><input type="password" class="input" placeholder="비밀번호 재입력"></span>
				<h3>
				<label>번호</label>
			</h3>
				<span><input type="text"  id="phone"></span>-
				<span><input type="text"  id="phone"></span>-
				<span><input type="text"  id="phone"></span>
				<h3>
			<label>생년월일</label>
			</h3>
				<span><input type="text" class="birth" placeholder="년도"></span>
				<span><select class="birth">
					<option>월</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
					<option>11</option>
					<option>12</option>
				</select></span>
				<span><input type="text" class="birth" placeholder="일"></span>
				<h3>
			<label>이메일</label>
			</h3>
				<span><input type="text" class="input"></span>
				<h3>
			<label>주소</label>
			</h3>
				<span><input type="text" class="address"></span>
				<span><button class="btn">우편검색</button></span>
				<br>
				<span><input type="text" class="address"></span>
				<span><input type="text" class="address" placeholder="상세주소"></span>
				
				
		</div>
				<div class="subjoin" align="center">
				<span><button value="" class="btn">취소</button></span>
				<span><button value="" class="btn">가입하기</button></span>
			</div>
				
	</form>
	</div>
	
	
	<script>
	
	function insertUser() {
		$("").submit();
	}
	
	$("#idCheck").on("click", function(){
		var userId = "개새끼!";
		
		console.log("씨발!!");
		
		$.ajax({
			url: "idCheck",
			type: "post",
			data: "국윤창",
			success: function(data) {
				console.log(data);
				if(data === "possible") {
					alert("사용 가능한 아이디 입니다");
				} else {
					alert("사용 불가능한 아이디 입니다");
				}
			},
			error: function(err) {
				console.log("실패!");
			}
		});
	});
	</script>
</body>
</html>