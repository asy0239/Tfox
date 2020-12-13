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
						<span id="subMain"> 문서 양식 관리 </span> 
						<span id="app_subsub"> 전체 문서 양식을 관리할 수 있습니다. </span> 
						<button id="approval_btn" onclick="editTemplate();"> 양식 추가하기 </button>
					</div>
				<div id="doc_box_area">
					<c:forEach var="userTempList" items="${userTemplateList}">
							<c:forEach var="tempList" items="${templateList}">
								<c:if test="${tempList.temp_id == userTempList.get('TEMP_ID')}">
									<c:choose>
										<c:when test="${tempList.temp_id eq 'TMP001'}">
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:when>
										<c:when test="${tempList.temp_id eq 'TMP002'}">
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:when>
										<c:when test="${tempList.temp_id eq 'TMP003'}">
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:when>
										<c:otherwise>
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</c:forEach>
				</div>
					<table id="manage_table">
						<caption style="text-align: left; font-size: 20px;">모든 사용자의 문서양식입니다.</caption>
						<tr>
							<th>번호</th>
							<th>문서 제목</th>
							<th>수정 날짜</th>
						</tr>
						<c:forEach var="userTempList" items="${allTempList}">
							<tr>
								<td>${userTempList.temp_id }</td>
								<td>${userTempList.temp_title }</td>
								<td>${userTempList.temp_date }</td>
							</tr>
						</c:forEach>
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