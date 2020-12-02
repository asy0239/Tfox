<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.qnaList {
	margin-top: 20px;
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
					<th><input type="checkbox"></th>
					<th class="qnaAnsYn">번호</th>
					<th class="qnaNote">분류</th>
					<th class="qnaDate">제목</th>
					<th class="qnaDate">작성일</th>
					<th class="qnaDate">작성자</th>
				</tr>
				<!-- 목록 출력 -->
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				
			</table>
		</div>
		<div>
			<button>글쓰기</button>
		</div>

	</div>

</body>
</html>