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
		
		<c:if test="${ !empty sessionScope.loginUser }">
		<div class="qnaAddWrap">
		<form  name="qnaAdd" method="get" action="qna.add">
			<table align="center">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="user_name"
						value="<c:out value="${ sessionScope.loginUser.user_name }"/>"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="gesi_title"/></td>
				</tr>
				<tr>
					<td>문의유형</td>
					<td>
						<select id="qnatype" name="qnatype">
							<!-- 여기에다가 문의 종류 불러와야함 -->
							<c:forEach var="category" items="${qnaType }">
								<option value="${category.qna_code }">${category.qna_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><div id="editor"></div></td>
				</tr>
			</table>
			<div align="center">
					<button type="submit" id="QnaADD">문의하기</button>
			</div>	
			<input type="hidden" name="user_id"
						value="<c:out value="${ sessionScope.loginUser.user_id }"/>"/>
						
			<input  type="hidden" id="h" name="gesi_content"  >
						
		</form>
		</div>
		</c:if>
		<c:if test="${ empty sessionScope.loginUser }">
		</c:if>

	
	
	
	
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js">
	</script>
		
	<script>
        //에디터 생성
        var editor = new toastui.Editor({
            el:document.querySelector("#editor"),
            initialEditType:'wysiwyg',
            
        }); 
        
        $("#QnaADD").on('click',function(){
			var test = editor.getMarkdown();
			var hidden = $("#h");
			hidden.val(test);
					
		});
    </script>
	</div>
</body>
</html>