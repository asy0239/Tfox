<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

#search {
	float: right;
}
</style>

<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<h3>휴가 승인 페이지</h3>
				<hr>
				<form name="vacationRecong" method="get" action="vacationRecong">
					<div id="search">
						<select id="search_category" name="search_cate">
							<option value="dept_name">부서
							<option value="emp_name">이름
						</select> 
						<input type="text" name="keyword" placeholder="부서 검색 또는 이름 검색하기">
						<button type="submit">검색</button>
					</div>
				</form>
				<div class="Recognition">
					<table>
						<tbody>
							<tr>
								<td>신청자</td>
								<td>부서</td>
								<td>신청날짜</td>
								<td>휴가종류</td>
								<td>기간</td>
								<td>상세</td>
								<td>상태</td>
							</tr>
							<!-- 이부분부터 반복문 사용해서 뽑을것 -->
							<c:forEach var="vac" items="${vaclist}">
								<tr>
									<td>${vac.emp_name }</td>
									<td>${vac.dept_name }</td>
									<td>${vac.vacapl_appdate }</td>
									<td>${vac.vactype_name }</td>
									<td><fmt:formatDate value="${vac.vacapl_start }"
											pattern="yyyy.MM.dd" /> ~ <fmt:formatDate
											value="${vac.vacapl_end }" pattern="yyyy.MM.dd" /></td>
									<td>${vac.vacapl_status }</td>
									<td><a href="vacation/detail?vacapl_id=${vac.vacapl_id}">자세히보기</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 처리 들어갈 위치 -->
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="${pageContext.request.contextPath }/attendance/vacationRecong?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="${pageContext.request.contextPath }/attendance/vacationRecong?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="${pageContext.request.contextPath }/attendance/vacationRecong?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</article>
		</section>
	</div>
</body>

</html>