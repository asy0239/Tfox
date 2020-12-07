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
<body>
	<div>
		<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
		
		<form  name="qna.add" method="get" action="qna.add">
			<table>
				<tr>
					<td>작성자</td>
				</tr>
				<tr></tr>
				<tr></tr>
			<div id="editor"></div>
			</table>			
			
			
		</form>
		
		

	
	
	
	
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js">
	</script>
		
	<script>
        //에디터 생성
        var editor = new toastui.Editor({
            //el : element , 적용시킬 대상
            //el:document.getElementById("editor"),
            el:document.querySelector("#editor"),
        });        
    </script>
	</div>
</body>
</html>