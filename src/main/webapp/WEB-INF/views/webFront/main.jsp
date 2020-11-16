<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.main_wrap{
		width: 1200px;
		margin: 0 auto;
	}

	.item-list{
		width:400px;
		float: left;
		 
		
	}
	.item-img a img {
		width: 380px;
		height: 450px;
	}
	.info {
		 margin-left: 0px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/webFront/slide.jsp"%>
	<div class="main_wrap">
		<br>
		<h2 align="center">BEST</h2>
		<div class="item-cont">
			<dl class="item-list">
				<dt class="item-img">
					<a><img src="${pageContext.request.contextPath }/resources/img/webFront/item1.PNG"/></a>
				</dt>
				<dd class="info">
					<ul>
						<li class="info-color"></li>
						<li class="info-name"></li>
						<li class="info-price"></li>
					</ul>
				</dd>
			</dl>
			<dl class="item-list">
				<dt class="item-img">
					<a><img src="${pageContext.request.contextPath }/resources/img/webFront/item2.PNG"/></a>
				</dt>
				<dd class="info">
					<ul>
						<li class="info-color"></li>
						<li class="info-name"></li>
						<li class="info-price"></li>
					</ul>
				</dd>
			</dl>
			<dl class="item-list">
				<dt class="item-img">
					<a><img src="${pageContext.request.contextPath }/resources/img/webFront/item3.PNG"/></a>
				</dt>
				<dd class="info">
					<ul>
						<li class="info-color"></li>
						<li class="info-name"></li>
						<li class="info-price"></li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>


</body>
</html>