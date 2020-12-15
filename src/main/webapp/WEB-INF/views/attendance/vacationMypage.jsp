<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 휴가 페이지</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>

.myVacation_top span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
}
#myVacationYear {
	border: 1px solid gray;
	border-radius:20px;
	width:200px;
	padding-bottom: 100px;
}

#texter {
	font-size: 15px;
	font-weight: bold;
}

.main_top span{
	font-size: 20px;
	font-weight: bold;

}


</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<div class="conWrap">
			<article>
				<div class="myVacation_top">
					<span>근태관리 > 내 휴가현황</span>
				</div>
				
				<div><a href="${pageContext.request.contextPath }/attendance/vacationMypage">내 휴가 현황&nbsp;&nbsp;</a><a href="${pageContext.request.contextPath }/attendance/vacationMycalendar"><span>내 휴가 캘린더</span></a></div>

				<hr>
				<div class="main_top">
					<span>사용 휴가 정보</span>
				</div>
				<div id="myVacationYear">
					<p id="texter"> 총 연차 일수 : ${Day.YearAllday }일</p>
					<p id="texter"> 남은 연차 일수 : ${Day.leftday }일</p>
					<p id="texter"> 사용한 연차 일수 : ${Day.yearDay }일</p>
					<p id="texter"> 총 사용한 휴가일수 : ${Day.allDay }일</p>
				</div>
				<div id="maVacationCategory">
					<div class="main_top">
					<span>사용한 휴가 종류</span>
					</div>
					<table class="table table-hover" style="text-align:center;">
						<tbody>
							<tr>
								<c:forEach var="category" items="${category }">
									<td>${category }</td>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="cateday" items="${cateday }">
									<td>${cateday }</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="myVacationList">
					<div class="main_top">
					<span>신청한 휴가 정보</span>
					</div>
					<table class="table table-hover">
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
									<td><a href="vacation/mydetail?vacapl_id=${vac.vacapl_id}">자세히보기</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
			</article>
		</section>
	</div>




</body>
</html>