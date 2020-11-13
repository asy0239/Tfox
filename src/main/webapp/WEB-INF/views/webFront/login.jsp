<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%@ include file="/WEB-INF/views/webFront/header.jsp" %>
		<form name='login.web' method="get" action="login.web">
			<h1 align="center">로그인</h1>
			<table align="center">
					<tr>
						<td width="50" height="50"><b>ID</b> </td> 
						<td width="170"><input type="text"></td>
						<td rowspan="2"><button class="button"><span><b>Login</b></span></button></td>
					</tr>
					<tr>
						<td width="50" height="50"> <b>PW</b> </td>
						<td><input type="text"></td>
					</tr>
				</table>		
		</form>
		
		
	
	</div>
	

	
	


</body>
</html>