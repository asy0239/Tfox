<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/user/userMain.css">
<title>유저 관리</title>
<style>
#top {
	width: 100%;
	height: 120px;
}

#t1 td:nth-child(1) {
	height: 100px;
	width: 100px;
	background-color: black;
	color: white;
	font-size: large;
	text-align: center;
}

#t1 td:nth-child(2) {
	height: 100px;
	width: 500px;
	font-size: large;
}

table, tr, td {
	border-collapse: collapse;
	border: 1px solid black;
}

#t1, #t2 {
	width: 100%;
	height: 50px;
	fomt-size: large;
}

#t2 th {
	font-size: large;
}

#submit {
	width: 100px;
	height: 30px;
	background: black;
	color: white;
	margin: 0 auto;
	padding: 0 auto;
}

.submit {
	padding: 20px;
	display: flex;
}

#t2info {
	background: black;
	color: white;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<section class="contents">
			<article>


				<div class="conWrap">

					<!-- 유저 검색 -->
					<div id="top"></div>
					<div id="mid1">
						<h3>
							<label id="userlist"
								style="font-size: x-large; font-weight: bold;">유저관리</label>
						</h3>
						<form>
							<table id="t1">
								<tr>
									<td>검색어</td>
									<td><select style="margin: 20px">
											<option>전체</option>
											<option value="이름">이름</option>
											<option value="아이디">아이디</option>
											<option value="이메일">이메일</option>
									</select><input type="text" placeholder="입력하세요"></td>
								</tr>
								<tr>
									<td>구매건수/건수</td>
									<td><select style="margin: 20px">
											<option>전체</option>
									</select> <input type="date">~<input type="date"></td>
								</tr>
								<tr>
									<td>가입일</td>
									<td><input type="date" style="margin: 20px">~<input
										type="date"></td>
								</tr>
								<tr>
									<td>이메일 수신</td>
									<td><input type="radio" name="email" value="전체">전체
										<input type="radio" name="email" value="수신허용">수신허용 <input
										type="radio" name="email" value="수신거부">수신거부</td>
								</tr>


							</table>
							<div class="submit">
								<input type="submit" value="검색하기" id="submit">
							</div>
						</form>
					</div>
					<!-- 검색 목록 -->
					<h3>
						<label id="userlist"
							style="font-size: x-large; font-weight: bold;">회원목록</label>
					</h3>
					<div>
						<form>
							<table id="t2">
								<tr id="t2info">
									<th><input type="checkbox"></th>
									<th>이름</th>
									<th>아이디</th>
									<th>가입일</th>
									<th>휴대전화</th>
									<th>이메일</th>
									<th>관련내역</th>
								</tr>
					<c:forEach var="user" items="${userlist}">
						<tr>
							<input type="hidden" "<c:out value='${user.user_id }'/>">
							<td><input type="checkbox"></td>
							<td><c:out value="${user.user_name}"/></td>
							<td><c:out value="${user.user_loginid}"/></td>
							<td><c:out value="${user.user_date }"/></td>
							<td><c:out value="${user.phone }"/></td>
							<td><c:out value="${user.user_email }"/></td>
							<td></td>
						</tr>
					</c:forEach>
							</table>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						</form>
					</div>
					
				</div>
			</article>
		</section>
	</div>								
</body>
</html>