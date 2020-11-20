<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background:lightgray;
}
	#wrap {
		background:white;
		width:1500px;
		heigth:1500px;
		margin:0 auto;
		padding:0 auto;
		
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
	#join {
		border:inset;
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
	<h2 align="center">회원 가입</h2>
	
	<form id="join">
		<table align="center">
			<tr>
			<td width="200px">* 이름</td>
			<td><input type="text" maxlength="13" name="userName"></td>
			</tr>
				<tr>
					<td width="200px">* 아이디 </td>
					<td><input type="text" maxlength="13" name="userId" id="userId"></td>
					<td width="200px"><div id="idCheck">중복확인</div></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" maxlength="13" name="userPwd"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" maxlength="13" name="userPwd2"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" maxlength="14" name="userBirth"></td>
				</tr>
				<tr>
					<td width="200px">* 이메일</td>
					<td><input type="text" maxlength="20" name="userEmail"></td>
				</tr>
				<tr>
				<td>연락처 </td>
					<td>
						<input type="text" maxlength="3" name="tel1" size="2">-
						<input type="text" maxlength="4" name="tel2" size="2">-
						<input type="text" maxlength="4" name="tel3" size="2">
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="zipCode"></td>
					<td><div id="ckZip">검색</div></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address1"></td>
					<td></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" name="address2"></td>
					<td></td>
				</tr>
				</table>
				
				<br>
				
				<div class="btns" align="center">
				<div id="" onclick="">취소</div>
				<div id="joinBtn" onclick="insertUser();">가입하기</div>
			</div>
	</form>
	
	</div>
	
	<script>
	
	function insertMember() {
		$("").submit();
	}
	
	$("#idCheck").click(function(){
		var userId = $("#userId").val();
		
		console.log(userId);
		
		$.ajax({
			url: "${applicationScope.contextPath}/idCheck.me",
			type: "post",
			data: {userId: userId},
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