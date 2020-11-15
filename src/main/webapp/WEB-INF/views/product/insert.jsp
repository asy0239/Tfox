<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 메인</title>
<style>
	#top > div:nth-child(n)  {
	float: left;
	
	}
	#top > div:nth-child(1){
		
	}
	#top > span{
		position: relative;
		bottom: 8px;
	 	margin-left: 30px; 
		font-size:25px;
	}
	#mid{
		width: 100%;
		height: 300px;
		border:1px soild black;
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
						<img src="${pageContext.request.contextPath }/resources/img/common/G6.png">	
						
						<span>상품관리 > 상품등록</span>
					</div>
					<div id="mid">
					
					
					</div>
					<div id="buttom">
					
					
					</div>
				
				
				</div>
				
			</article>
		</section>
	</div>
</body>
</html>