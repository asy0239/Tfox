<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/webFront/header.jsp" %>
	<h2 align="center">회원 가입</h2>
	
	<form>
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