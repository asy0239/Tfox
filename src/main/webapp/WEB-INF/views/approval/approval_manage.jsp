<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approval_main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/card_hover.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approval_manage.css">

<title>전자결재 문서관리</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>




		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->

				<div class="conWrap">
					<div id="app_title">전자결재</div>
					<div id="app_subTitle">
						<span id="subMain"> 문서 관리 </span> 
						<span id="app_subsub"> 전체 문서 내역 및 양식을 관리할 수 있습니다. </span> 
						<button id="approval_btn" onclick="editTemplate();"> 양식 추가하기 </button>
					</div>
				<div id="doc_box_area">
					<c:forEach var="template" items="${templateList }">
						<div id="doc_box">
						<c:choose>
							<c:when test="${template.temp_id eq 'TMP001'}">
									<img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg">
							</c:when>
							<c:when test="${template.temp_id eq 'TMP002'}">
								
								<img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">
							</c:when>
							<c:when test="${template.temp_id eq 'TMP003'}">
								<img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg">
							</c:when>
						</c:choose>
						<div id="doc_name">${template.temp_title }</div>
						</div>
					</c:forEach>
				</div>
					<table id="manage_table">
						<tr>
							<th>번호</th>
							<th>문서 제목</th>
							<th>수정 날짜</th>
						</tr>
						<tr>
							<td>1</td>
							<td>제목이다!!!!!!!!!!!!!!!!</td>
							<td>2020-10-10</td>
						</tr>
					</table>
				</div>
			</article>
		</section>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		function editTemplate() {
			location.href = "approval_edit_template";
		}
	</script>
</body>
</html>