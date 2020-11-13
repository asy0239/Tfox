<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#test {
		background:red;
	}
	table, td , th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	}

	th {
		background-color: rgb(221, 221, 221);
		font-size: 12px;
		font-weight: bold;
		/* text-align: center; */
	}
	
	#approvalArea {
		margin:auto;
	}
</style>
<!-- Toast Editor 2.0.0과 의존성 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

</head>
<body>
	<h1>결제 문서 확인</h1>
	<div id="editor"></div>
	
	<div>${docType }</div>
</body>

	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-jquery-editor.min.js"></script>
    <script src="${pageContext.request.contextPath  }/resources/js/approval/signPad.js"></script>
	<script>
			
		var signTd1 = $("#signTd1");
		var editor = new toastui.Editor({
			el:document.querySelector("#editor"),
			initialEditType:'wysiwyg',
			previewStyle:'vertical',
			height:'500px',
			
		});
		
		editor.on("keyup", function(){
			console.log("입력됨");
		});
		
		editor.setHtml('${template}');
		
		$("input").remove();
		$(".editor_label").remove();
		
		$(".editor_label").append("${docType}")
		
/* 		
		$(document).ready(function () {			
              var sign = $('#txt').SignaturePad({
                  allowToSign: true,
                  img64: 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7',
				  border: '1px solid #c7c8c9',
                  width: '100px',
				  height: '100px',
                  callback: function (data, action) {
					//   console.log(data);
					
				
                  }
              });
              var sign = $('#txt2').SignaturePad({
                  allowToSign: true,
                  img64: 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7',
                  border: '1px solid #c7c8c9',
                  width: '100px',
                  height: '100px',
                  callback: function (data, action) {
                    //   console.log(data);
                  }
              });
			  
          }) */
          
	</script>
</html>