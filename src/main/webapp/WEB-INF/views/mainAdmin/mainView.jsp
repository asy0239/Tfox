<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<style>
	#top{
		width: 100%;
		height: 100px;
		border: 1px solid black;
		
	}
	table {
	
		width: 1000px;
		heigth: 500px;
		
		
	}
		table,tr, td {
		border-collapse:collapse;
		border: 1px solid black;
		text-align:center;
		margin: auto;
		
	}

	
	
	#top >span{
		font-size: 40px;
	}
	
	#mid {
		width: 100%;
		height: 500px;
		border: 1px solid black;
		margin: auto;
		text-align:center;
	}

	font {
		font-size: 20px;
	} 
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>




		<section class="contents">
			<article>
		

				<div class="conWrap" >
					<div id="top">
						<img src="resources/img/login/home.png">
						<span>Home</span>
					</div>
					<div id="mid" >
						<div></div>
					
						<table style="margin-left: auto; margin-right: auto;" >
							<tr>
								<td>오늘 결제 확인(건)</td>
								<td>오늘 가입 회원(명)</td>
								<td>오늘 주문 접수(건)</td>
							</tr>	
							<tr>
								<td><img src="resources/img/login/m1.png"></td>
								<td><img src="resources/img/login/m2.png"></td>
								<td><img src="resources/img/login/m3.png"></td>
							</tr>
							<tr>
								<td><font>3</font></td>
								<td><font>5</font></td>
								<td><font>6</font></td>
							</tr>
						</table>
						
					</div>
					<div id="but">
					
					</div>
				
				</div>

			</article>
		</section>
	</div>

</body>
</html>