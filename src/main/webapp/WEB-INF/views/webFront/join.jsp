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
	.btn, #idCheck {
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
	<form id="joinForm" action="${pageContext.request.contextPath }/userinsert" method="POST">
	<h2><label>가입정보를 입력해주세요.</label></h2>
	<br>
		<div>
			<h3>
			<label>이름</label>
			</h3>
				<span><input type="text" class="input" name="user_name"></span>
				<h3>
			<label id="userId">아이디</label>
			</h3>
				<div>
				<span><input type="text" class="input" id="checkId" name="user_loginid"></span>
				<div class="eheck_font" id="idCheck"></div>
				<span><input type="button" class="btn" id="idCheck" value="중복확인"></span>
				</div>
				<h3>
			<label>비밀번호</label>
			</h3>
				<span><input type="password" class="input" placeholder="비밀번호" name="user_pwd1"></span>
				<br>
				<span><input type="password" class="input" placeholder="비밀번호 재입력" name="user_pwd2"></span>
				<h3>
				<label>번호</label>
			</h3>
				<span><input type="text"  id="phone" name="phone1"></span>-
				<span><input type="text"  id="phone" name="phone2"></span>-
				<span><input type="text"  id="phone" name="phone3"></span>
				<h3>
			<label>생년월일</label>
			</h3>
				<span><input type="date" class="birth" placeholder="년도" name="user_number"></span>
				<h3>
			<label>이메일</label>
			</h3>
				<span><input type="email" class="input" name="user_email"></span>
				<h3>
			<label>주소</label>
			</h3>
				<span><input type="text" class="address"  name="user_addr1"></span>
				<span><button class="btn">우편검색</button></span>
				<br>
				<span><input type="text" class="address"  name="user_addr2"></span>
				<span><input type="text" class="address" placeholder="상세주소" name="user_addr3"></span>
				
				
		</div>
				<div class="subjoin" align="center">
				<span><button value="" class="btn">취소</button></span>
				<span><button type="submit" class="btn" id="insertUser">가입하기</button></span>
			</div>
				
	</form>
	</div>
	
	
	<script>
	//모든 공백 체크 정규식
	var empJ = /\s/g; 
	//아이디 정규식 
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	
	$("#idCheck").on("click", function(){
	
		var checkId = $("#checkId").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/idCheck",
			type: "post",
			dataType:"json",
			data: {
				"checkId" : checkId,
			},
			success: function(data) {
				console.log(data);
				if(data == "0") {
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
	$(document).ready(function() {
		
	
	$("#checkId").blur(function() {
		if($('#checkId').val() == '') {
			$('#idCheck').text('아이디를 입력하세요.');
			$('#idCheck').css('color', 'red');
			
		} else if(idJ.test($('#checkId').val())!=true) {
			$('#idCheck').text('4~12자의 영문, 숫자만 사용 가능합니다.');
			$('#idCheck').css('color', 'red');
		} 		
		
	});
	});
	
	
	</script>
</body>
</html>