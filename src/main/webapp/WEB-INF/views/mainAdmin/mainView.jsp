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
		
		
	}
	table {
	
		width: 1000px;
		heigth: 500px;
		

		
		
	}
	tr{
     width:100%;
     
}
		table,tr, td {
		border-collapse:collapse;
		
		text-align:center;
		margin: auto;
		height: 90px;
		
		
	}
	
	
	
	
	#top >span{
		font-size: 40px;
	}
	
	#mid {
		width: 100%;
		height: 300px;
		border: 1px solid black;
		border-radius:15px;
	
	}

	font {
		font-size: 20px;
	}

	#but > div:nth-child(odd){
		
		height: 500px;
		width: 47%;
	}
	#but >div:nth-child(even){
		width: 5%;
		height:500px;
	
	}

	#but{
	
		height: 600px;
		width: 100%;
		
		text-align: center;
		margin: auto;
	}
	.t{
		margin: auto;
		text-align:center;
		float:left;
	}

	#i {
	margin: auto;
		
	}
	#i > div:nth-child(even){
		
		border: 1px solid black;
		height: 170px;
		width: 100%;
		border-radius:15px;
	
	}
	#i > div:nth-child(odd){
	
		height: 50px;
		width: 100px;
	
	}
	pre {
		font-size: 20px;
		font-weight: bold;
		
	}
	.d1{
		height: 30px;
	}
	
	
	#d div:nth-child(n+2){
		float: left;
		height:50px;
		width: 24.2%;

	
	}
	#d2 div:nth-child(n+2){
		float: left;
		height:50px;
		width: 31%;
		
		
	
	}
	.c{
		padding-left: 9px;
	}
	 #graph{
		border: 1px solid black;
	}
	#ss{
		height:100px;
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
								<td><pre>오늘 결제 확인(건)</pre></td>
								<td><pre>오늘 가입 회원(명)</pre></td>
								<td><pre>오늘 주문 접수(건)</pre></td>
							</tr>	
							<tr>
								<td><img src="resources/img/login/m1.png"></td>
								<td><img src="resources/img/login/m2.png"></td>
								<td><img src="resources/img/login/m3.png"></td>
							</tr>
							<tr>
								<td><pre>3</pre></td>
								<td><pre>5</pre></td>
								<td><pre>6</pre></td>
							</tr>
						</table>
						
						
					</div>
					<div id="ss"></div>
					<div id="but">
						<div class="t" id="graph"></div>
						<div class="t" id="e">
						
						</div>
						<div class="t" id="i">
							<div><pre>배송현황</pre></div>
								<div style="text-align:center; margin:0 auto;" id="d">
									<div>
										<div class="d1"></div>
										<div ><pre style="color:#11729C">출고 준비</pre></div>
										<div ><pre style="color:#11729C">출고 완료</pre></div>
										<div ><pre style="color:#C83E4F">배송중</pre></div>
										<div ><pre style="color:#C83E4F">배송완료</pre></div>
									
										<div ><pre>1</pre></div>
										<div ><pre>4</pre></div>
										<div ><pre>7</pre></div>
										<div ><pre>12</pre></div>
									</div>
								</div>
							<div><pre>주문현황</pre></div>
							<div style="text-align:center; margin:0 auto;" id="d2">
								<div>
										<div class="d1"></div>
										<div class="c"><pre style="color:#43AA7F">출고 준비</pre></div>
										<div ><pre style="color:#43AA7F">출고 완료</pre></div>
										<div ><pre style="color:#43AA7F">배송중</pre></div>
										
									
										<div class="c"><pre >1</pre></div>
										<div ><pre>4</pre></div>
										<div ><pre>7</pre></div>
							
									</div>
							</div>
						</div>
				
					</div>
				
				</div>

			</article>
		</section>
	</div>

</body>
</html>