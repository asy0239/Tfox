<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
	<div class="loginWeb_wrap">
		<form name='login.web' method="post" action="login.web">
			<div id="tt">
				<h1 align="center">Login</h1>
				<div align="center">
					<div>
						<label><b>ID</b> </label> <input type="text" name="user_loginid">
					</div>
					<div>
						<label> <b>PW</b>
						</label> <input type="password" name="user_loginpwd">
					</div>
					<div class="remember">
						<label> <input type="checkbox" />아이디 기억
						</label>
					</div>
				</div>
				<div align="center">
					<button type="submit">로그인</button>
				</div>
			</div>
		</form>
	</div>





</body>
</html>