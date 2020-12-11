<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qnaList {
	width: 1200px;
	margin-top: 20px;
	margin: 0 auto;
}
table, tr, td, th{
		border-collapse:collapse;
		border: 1px solid black;
	}
#q1{ 
		width:100%;
		margin-top: 10px;
		
	}
</style>
</head>
<body>
	<div>
		<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
		<h1 align="center">Q&A</h1>

		<div class="qnaList">
			<table id="q1" align="center">
				<tr>
					<th colspan="6" align="center" class="gesiListBtn"></th>
				</tr>
				<tr class="listName">
					<th class="qnaAnsYn">번호</th>
					<th class="qnaNote">분류</th>
					<th class="qnaDate">제목</th>
					<th class="qnaDate">작성일</th>
					<th class="qnaDate">작성자</th>
				</tr>
				<!-- 목록 출력 -->
				<c:forEach var="qna" items="${ qnaList}">
				<tr>
					<td><c:out value="${qna.rn}" /></td>
					<td><c:out value="${qna.qna_name}" /></td>
					<td><c:out value="${qna.gesi_title}" /></td>
					<td><c:out value="${qna.gesi_date}" /></td>
					<td><c:out value="${qna.user_name}" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath }/webFront/QnaInsert'">글쓰기</button>
		</div>

		<!-- 페이징 처리 -->
		<div class="paging-area" align="center">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="${pageContext.request.contextPath }/webFront/gesi.web?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="${pageContext.request.contextPath }/webFront/gesi.web?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="${pageContext.request.contextPath }/webFront/gesi.web?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>

	</div>
	
</body>
</html>