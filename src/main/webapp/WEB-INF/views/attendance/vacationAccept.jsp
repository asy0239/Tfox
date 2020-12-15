<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 현황</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
<style>

.table{
	font-size:20px;
	font-weight:bold;

}

.maintesttop span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
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
				<div class="maintesttop">
					<span>근태관리 > 휴가승인</span>
				</div>
					<div class="subtitle">
						<c:forEach var="vaclist" items="${vaclist }">
							<table class="table">
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
							<c:choose>
									<c:when test="${vaclist.vacapl_status eq '승인대기중'}">
										<form name="vacationY" method="post" action="vacationY">
											<input type="hidden" name="Y" value="${vaclist.vacapl_id }">
											<button class="btn btn-info">승인하기</button>
										</form>
										<form name="vacationN" method="post" action="vacationN">
											<input type="hidden" name="N" value="${vaclist.vacapl_id }">
											<button class="btn btn-info">반려하기</button>
										</form>
									</c:when>
							<c:otherwise>
									<button class="btn btn-info" name="back" onclick="cancle()">확인</button>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>

			</article>
		</section>
	</div>
</body>
<script>
function cancle(){
	 location.replace("${pageContext.request.contextPath }/attendance/vacationRecong");
};

</script>


</html>