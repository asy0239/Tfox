<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>


		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->

				<div class="conWrap">
					<h2>내 휴가 자세히보기</h2>
					<hr>
					<div class="subtitle">
						<c:forEach var="vaclist" items="${vaclist }">
							<table>
								<tbody>
									<tr>
										<td>신청자</td>
										<td>${vaclist.emp_name }</td>
									</tr>
									<tr>
										<td>부서</td>
										<td>${vaclist.dept_name }</td>
									</tr>
									<tr>
										<td>종류</td>
										<td>${vaclist.vactype_name }</td>
									</tr>
									<tr>
										<td>휴가기간</td>
										<td><fmt:formatDate value="${vaclist.vacapl_start }"
												pattern="yyyy.MM.dd" /> ~ <fmt:formatDate
												value="${vaclist.vacapl_end }" pattern="yyyy.MM.dd" /></td>
									</tr>
									<tr>
										<td>사유</td>
										<td>${vaclist.vacapl_reason }</td>
									</tr>
									<tr>
										<td>휴가 승인 현황</td>
										<td>${vaclist.vacapl_status }</td>
									</tr>
								</tbody>
							</table>
									<button name="back" onclick="cancle()">확인</button>
						</c:forEach>
					</div>
				</div>

			</article>
		</section>
	</div>
</body>
<script>
function cancle(){
	 location.replace("${pageContext.request.contextPath }/attendance/vacationMypage");
};

</script>


</html>