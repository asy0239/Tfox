<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/modal.css">

<title>상품관리 메인</title>

<style>

#top>div:nth-child(n) {
	float: left;
}


#top>span {
	color: #5E5E5E ;
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;

}


</style>
</head>
<body>


	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<section class="contents">
			<article>

				<div class="conWrap">
				<div id="top">
							<img
								src="${pageContext.request.contextPath }/resources/img/common/G6.png">

							<span>상품관리 > 상품목록</span>
				</div>
				<div>
					<table>
						<tr>
						    <td>검색분류</td>
						    <td><input type="text"></td>
						</tr>
						<tr>
						    <td>상품분류</td>
						    <td><input type="text"></td>
						</tr>
						<tr>
						    <td>상품등록일</td>
						    <td>
						    </td>
						</tr>
						<tr>
						    <td>판매상태</td>
						    <td></td>
						</tr>
						
					
					</table>
				
				</div>
				
				</div>
			</article>
		</section>
	</div>





</body>
</html>