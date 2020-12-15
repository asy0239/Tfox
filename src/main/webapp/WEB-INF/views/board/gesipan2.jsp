<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.gesipan_top span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
	
}


table, tr, td, th{
		border-collapse:collapse;
		border: 1px solid black;
	}
 
 #t2{ 
		width:100%;
		margin-top: 10px;
		
	}
	
.gesimulList span {
	margin-left: 30px;
	font-size: 20px;
	font-weight: bold;
	
}

</style>
</head>
<body>
	<div id="gesimul_wrap">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->
				<div class="conWrap">
					<form>
						<input type="hidden" value="<c:out value='' />"/>
						<input type="radio" value="N" name="f"/>게시판 표시안함 <br>
						<input type="radio"value="Y" name="f"/>게시판 표시함
						<button>수정</button>
					</form>
				</div>
		</article>
	</div>
</body>
</html>