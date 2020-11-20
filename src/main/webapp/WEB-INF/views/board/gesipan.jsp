<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<div id="gesimul_wrap">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->
				<div class="conWrap">
					<div class="gesipan_top">
						<img
							src="${pageContext.request.contextPath }/resources/img/common/G4.png">
						<span>게시판 관리 > 게시판 설정</span>
					</div>
				</div>
			</article>
		</section>
	</div>
</body>
</html>