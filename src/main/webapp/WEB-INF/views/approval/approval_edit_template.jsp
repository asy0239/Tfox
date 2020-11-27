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
<title>양식추가하기</title>
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
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>




		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->
				<form id="htmlpass" method="post" action="editTemplate">
				<div class="conWrap">
					<div id="app_title">
						새 양식 추가
					</div>
					
						<table id="doc_table">
							<tr>
								<th id="table_th">양식 제목</th>
								<td><input id="table_input" type="text" name="temp_title" placeholder="제목을 입력해주세요"></td>
								<td id="none_td"></td>	
							</tr>
						</table>
				<div id="editor"></div>
					<div>
						<button id="cancle_btn" onclick="cancle();">취소</button>	
					</div>
					
						<input type="hidden" id="hd" name="htmlcontent"> 
						<input type="hidden" id="hd2" name="doc_type"> 
						<input type="submit" id="submit" value="추가">
				</div>
				</form>
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
			initialEditType:'markdown',
			previewStyle:'vertical',
			height:'500px',
			
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
          
          // 테스트
		  $("#btn").on("click", function(){
		  var test = $(".editor_opt[name=doc_label]:checked").val();
			 console.log(test); 
			 
		  });
		
		
          // 에디터에 입력된 값들을 넘겨주는 버튼이 클릭 시 실행
          editBtn.on('click', function(){
        	  var template = editor.getMarkdown();
        	  /* var template = $("#mydiv").html(); */
        	  var opt = $(".editor_opt[name=doc_label]:checked").val();
        	  var hidden = $("#hd");
        	  var hidden2 = $("#hd2");
        	  hidden.val(template);
        	  hidden2.val(opt);
        	  console.log(template);
        	  
          });
		
		  
		  $("#doc").on("click", function(){
		     var label = $("#doc_label");
		     var select = $("#doc option:selected").val();
		     
		     label.empty();
		     label.append(select);
		  });
		  
		  
		  // 취소버튼 클릭시 main으로 이동
		 function cancle(){
			 location.replace("approval_manage");
		 };
		 
		 
		 // 모달창 띄우기
		 function modal1(e){
			 $("#my_modal1").show();
			 console.log("모달1");
			 selectId = $(e).attr("id");
		 };
		 function modal2(e){
			 $("#my_modal2").show();
			 console.log("모달2");
			 selectId = $(e).attr("id");
		 };
		 function modal3(e){
			 $("#my_modal3").show();
			 console.log("모달3");
			 selectId = $(e).attr("id");
		 };
		 
		 function closeModal1(){
			 $("#my_modal1").hide();
		 };
		 
		 function closeModal2(){
			 $("#my_modal2").hide();
		 };
		 
		 function closeModal3(){
			 $("#my_modal3").hide();
		 };
	</script>	
</html>