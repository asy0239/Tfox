<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Toast Editor 2.0.0과 의존성 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/approval/approval_edit.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/approval/approval_edit_template.css">
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<title>양식 상세 관리</title>
<style>
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
	
	#table_th {
		width:20%;
	}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>




		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->
				
				<div class="conWrap">
					<div id="app_title">
						양식 관리
					</div>
					<form id="htmlpass" method="post" action="updateTemplate">
						<table id="doc_table">
							<tr>
								<th id="table_th">양식 제목</th>
								<td>${template.temp_title }</td>
								<td id="none_td"></td>	
							</tr>
						</table>
					<div id="editor"></div>
					<div>
						<button type="button" id="cancle_btn" onclick="cancle();">취소</button>	
					</div>
						<input type="hidden" id="tempId" name="temp_id">
						<input type="hidden" id="editorContent" name="editorContent"> 
						<input type="hidden" id="tempTitle" name="tempTitle"> 
						<input type="submit" id="submit" value="수정">
					</form>
				</div>
			</article>
		</section>
	</div>
	<%@ include file="modal_soosin.jsp" %>
	<%@ include file="modal_player.jsp" %>
	<%@ include file="modal_finalApp.jsp" %>
</body>

	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-jquery-editor.min.js"></script>
    <script src="${pageContext.request.contextPath  }/resources/js/approval/signPad.js"></script>
	<script>
			
		var editBtn = $("#submit"); // 넘겨줄 때 필요한 버튼
		// 에디터 생성
		var editor = new toastui.Editor({
			el:document.querySelector("#editor"),
			initialEditType:'wysiwyg',
			previewStyle:'vertical',
			height:'500px',
			
		});
		
		// 에디터에 글짜 수정이 일어날 때 실행되는 함수
		editor.on("change", function(){
			var editorContent = editor.getMarkdown();
			var tempTitle = $("#table_input").val();
			$("#tempId").val('${template.temp_id}');
			$("#editorContent").val(editorContent);
			$("#tempTitle").val(tempTitle);
			console.log(tempTitle);
			console.log(editorContent);
			
		});
		// 에디터에 html을 삽입
		
		 editor.setMarkdown(`'${template.temp_content}'`); 

		
		$("#test").on('click', function(){
			var editorContent = editor.getMarkdown();
			var tempTitle = $("#table_input").val();
			console.log(tempTitle);
			console.log(editorContent);
		});
		// 페이지 실행 시 수행되는 함수, $('#txt')가 클릭 시 signPad 실행
		$(document).ready(function () {			
              var sign = $('#txt').SignaturePad({
                  allowToSign: true,
                  img64: 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7',
				  border: '1px solid #c7c8c9',
                  width: '100px',
				  height: '100px',
                  callback: function (data, action) {	
                  }
              });
              var sign = $('#txt2').SignaturePad({
                  allowToSign: true,
                  img64: 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7',
                  border: '1px solid #c7c8c9',
                  width: '100px',
                  height: '100px',
                  callback: function (data, action) {
                  }
              });
			  
          })
		
		  
		  
		  // 취소버튼 클릭시 main으로 이동
		 function cancle(){
			console.log("클릭은돔?");
			 location.replace("approval_manage");
		 };
		 
		 
		 $("#submit").on("click", function(){
			 alert("정상 처리 되었습니다.");
		 });
		 
	</script>	
</html>