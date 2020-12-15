<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<style>
	.qnaAddWrap {
		margin-top: 200px;
		width: 1200px;
		margin:0 auto;
	}
	
	table {
  		border-collapse: separate;
  		border-spacing: 0 10px;
	}
	#QnaADD{
	margin-top: 100px;
	margin-right:50px;
	width: 150px;
	height: 50px;
	color: white;
	float: right;
	background-color: black;
}
</style>
<body>
	<div>
		<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
		<div class="qnaAddWrap">
		<form  name="qnaAdd" method="get" action="qna.add">
		
			<table align="center">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="user_name"
						value="<c:out value="${detail.gesi_name }"/>"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="gesi_title"
						value="<c:out value="${detail.gesi_title }"/>"/></td>
				</tr>
				<tr>
					<td>문의유형</td>
					<td>
						<input type="text" name="qna_name"
						value="<c:out value="${detail.qna_name }"/>"/>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="gesi_content"
						value="<c:out value="${detail.gesi_content }"/>"/></td>
				</tr>
			</table>
			
			<div align="center">
					<button type="submit" id="QnaADD">답변하기</button>
			</div>	
						
			<input  type="hidden" id="h" name="gesi_id" value="<c:out value="${detail.gesi_id }"/>"/>		
		</form>
		<hr>
		</div>
			<div class="gesimulList">
					<span>답변</span>
			</div>
	
	
	</div>
</body>
</html>