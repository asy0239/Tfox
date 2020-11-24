<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#tt div:nth-child(1){
	 height: 100px;
	 width: 100%;
}



h1 {
font-size: 50px;
}
button{
	height: 50px;
	width: 130px;
	background-color: white;
	
	
}

input{
	height: 30px;
	width: 150px;
}

#bt{
	height: 30px;
	width: 100%;

}
</style>

</head>
<body>
	<div>
		<%@ include file="/WEB-INF/views/webFront/header.jsp" %>
		<form name='login.web' method="post" action="login.web">
		<div id="tt">
			<div></div>
			<h1 align="center">Login</h1>
			<div></div>
			<table align="center">
					<tr>
						<td width="50" height="50"><b>ID</b> </td> 
						<td width="170"><input type="text"></td>
						
					</tr>
					<tr>
						<td width="50" height="50"> <b>PW</b> </td>
						<td><input type="password"></td>
					</tr>
					<div class="remember">
               			<label>
                   			<form:checkbox path="rememberId"/>아이디 기억
                		</label>
            		</div>
				</table>
				<div id="bt"></div>
				<div  align="center"><button>로그인</button></div>	
		</div>			
		</form>
		
		
	
	</div>
	

	
	


</body>
</html>