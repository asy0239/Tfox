<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

	.main_wrap{
		width: 1200px;
		margin: 0 auto;
	}
	
	.thumb-list {
		width:380px;
		border:1px solid white;
		display:inline-block;
		margin:5px;
		align:center;
	}


</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/webFront/slide.jsp"%>
	<div class="main_wrap">
		<br>
		<h2 align="center">BEST</h2>
		
		 <c:forEach var="proL" items="${productList }"> 
		 <div class="thumb-list" align="center">
				<div>
					<a href="${pageContext.request.contextPath }/webFront/detail?pro_name=${proL.pro_name}&pro_id=${proL.pro_id }">
						<img src="/fileList?pro_id=${proL.pro_id }"
										width="350px" height="400px">
					</a>
				</div>
				<p>
				 <c:out value="${ proL.pro_name }"/><br> 
				 <c:out value="${proL.pro_price }"/>
				</p>
			</div>
			</c:forEach> 
	</div>
</body>
</html>