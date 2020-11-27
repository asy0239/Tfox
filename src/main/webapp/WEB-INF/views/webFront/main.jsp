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
		
		<%--  <c:forEach var="pi" items="${ requestScope.list }">  --%>
		 <div class="thumb-list" align="center">
				<div>
					<input type="hidden" value="<c:out value="${pi.dl}"/>">
					<img src="${ applicationScope.contextPath }/resources/thumbnail_uploadFiles/<c:out value="${ hmap.changeName }"/>"
						width="350px" height="400px">
				</div>
				<p>
				상품이름: <c:out value="${ hmap.bno }"/><br> 
				사이즈: <c:out value="${ hmap.bCount }"/><br>
				가격: <c:out value=""/><c:out value=""/>
				</p>
			</div>
			<%-- </c:forEach> --%>

</body>
</html>