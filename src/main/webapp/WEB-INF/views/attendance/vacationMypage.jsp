<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#myVacationYear{
	border: 2px solid black;
	padding-bottom:200px;
}
#texter{
	font-size:15px;
	font-weight:bold;
}
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
				<h1>내 휴가 현황</h1>
				<hr>
				<h1>남은 휴가 정보</h1>
				<div id="myVacationYear">
					<p id="texter">총 연차 일수 : ${Day.YearAllday }일</p>
					<p id="texter">남은 연차 일수 : ${Day.leftday }일</p>
					<p id="texter">사용한 연차 일수 : ${Day.yearDay }일</p>
					<p id="texter">총 사용한 휴가일수 : ${Day.allDay }일</p>
				</div>
				<div id="maVacationCategory">
					<h2>사용한 휴가 종류</h2>
					<table>
						<tbody>
							<tr>
								<c:forEach var="category" items="${category }">
									<td> ${category } </td>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="cateday" items="${cateday }">
									<td> ${cateday }</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div id="myVacationList">
					<h1>신청한 휴가 정보</h1>
					<table>
						<tbody>
							<c:forEach var="vac" items="${vaclist}">
							<tr>
								<td>${vac.emp_name }</td>
								<td>${vac.dept_name }</td>
								<td>${vac.vacapl_appdate }</td>
								<td>${vac.vactype_name }</td>
								<td><fmt:formatDate value="${vac.vacapl_start }" pattern="yyyy.MM.dd"/>
									 ~ <fmt:formatDate value="${vac.vacapl_end }" pattern="yyyy.MM.dd"/>
								</td>
								<td>${vac.vacapl_status }</td>
								<td><a href="$">자세히보기</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</article>
		</section>
	</div>
</body>
</html>