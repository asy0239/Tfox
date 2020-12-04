<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<p id="texter">총 연차 일수</p>
					<p id="texter">남은 연차 일수</p>
					<p id="texter">사용한 연차 일수</p>
					<p id="texter">총 사용한 휴가일수</p>
				</div>
				<div id="maVacationCategory">
					<h2>사용한 휴가 종류</h2>
					<table>
						<tbody>
							<tr>
								<td>연차</td>
								<td>포상휴가</td>
							</tr>
							<tr>
								<td>2일</td>
								<td>3일</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div id="myVacationList">
					<h1>신청한 휴가 정보</h1>
					<table>
						<tbody>
							<tr>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>

			</article>
		</section>
	</div>
</body>
</html>