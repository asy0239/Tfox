<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/user/userMain.css">
<title>유저 관리</title>
<style>
	#top {
		width: 100%;
		height: 120px;
		
	}
	#t1 td:nth-child(1){
		height: 100px;
		width: 100px;
		background-color:black;
		color:white;
	}
	
	#t1 td:nth-child(2){
		height: 100px;
		width: 500px;
	}
	
	
	table , tr ,td{
		border-collapse:collapse;
		border: 1px solid black;
	}

	
</style>
</head>
<body>
		<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>

		<section class="contents">
			<article>
		

				<div class="conWrap" >
	
	<!-- 유저 검색 -->
	<div id="top"></div>
	<div id="mid1">
	<form>
		<table id="t1">
			<tr >
				<td >검색어</td>
				<td><select>
					<option>전체</option>
					<option value="이름">이름</option>
					<option value="아이디">아이디</option>
					<option value="이메일">이메일</option>
				</select><input type="text" placeholder="입력하세요"></td>
			</tr>
			<tr>
				<td>구매건수/건수</td>
				<td><select>
					<option>전체</option>
				</select>
					<input type="date">~<input type="date">
				</td>
			</tr>
			<tr>
			    <td>가입일</td>
			    <td>
				
					<input type="date">~<input type="date"></td>
			</tr>
			<tr>
			    <td>이메일 수신</td>
			    <td><input type="radio" value="전체">전체
			    	<input type="radio" value="수신허용">수신허용
			    	<input type="radio" value="수신거부">수신거부
			    	</td>
			</tr>
			
			
		</table>
			<button>검색</button>
	</form>
	</div>
	<!-- 검색 목록 -->
	<div>회원 목록</div>
		<div>
			<form>
				<table id="t2">
					<tr>
						<th><input type="checkbox"></th>
						<th>이름</th>
						<th>아이디</th>
						<th>가입일</th>
						<th>휴대전화</th>
						<th>이메일</th>
						<th>관련내역</th>
					</tr>
				</table>
			</form>
		</div>
		
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		
	
	
				</div>

			</article>
		</section>
	</div>
</body>
</html>