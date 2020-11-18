  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.hood-item-wrap{
		width: 1200px;
		margin: 0 auto;
	}
	
	.hood_item_img{
		width: 50%;
		float: left;
		height: 700px;
		
	}
	.hood_item_img a img{
		margin-top: 50px;
		margin-left: 30px;
		width: 540px;
		height: 600px;
	}
	 
	.hood_item_info{
		width: 50%;
		float: right;
		height: 700px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
	<div class="hood-item-wrap">
		<div class="hood_item_img">
			<a><img src="${pageContext.request.contextPath }/resources/img/webFront/item1.PNG"/></a>
		</div>
		<div class="hood_item_info">
			<form>
				
				
			</form>
			
		</div>
	</div>

</body>
</html>