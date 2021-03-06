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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/approval/approval_get_detail.css">
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
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
	
	#editor{
		padding-top:100px;
	}
	
	#app_subTitle {
		display:flex;
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
					<div id="app_subTitle">
						<div id="doc_label">
							결재 수신 상세 내용
						</div>
						<div id="btnArea">
							<div><button onclick="signAdd();">사인</button></div>
							<div><button onclick="approve();">승인</button></div>
							<div><button onclick="del();">반려</button></div>
							<div><button onclick="waiting();">검토</button></div>
						</div>	
					</div>
					
					<form action="applyDoc" id="target" method="POST">
						<table id="doc_table">
							<tr>
								<th id="table_th">제목</th>
								<td style="text-align: left; padding-left: 15px;">
									${getDetail.send_app_title}
								</td>
								<td id="none_td"></td>	
							</tr>
							<tr>
								<th id="table_th">
									참조자
								</th>
								<td style="text-align: left; padding-left: 15px;">
									<c:forEach var="emp" items="${getDetailRef}">
									${emp.emp_name }	
									</c:forEach>
								</td>
								<td id="none_td">
								</td>
							</tr>
							<tr>
								<th id="table_th">참조문서</th>
								<td><input id="table_input" type="file" placeholder=""></td>
								<td id="none_td">
								</td>
							</tr>
							<tr>
								<th id="table_th">시행자</th>
								<td style="text-align: left; padding-left: 15px;">
								<c:forEach var="excu" items="${getExcu}">
									${excu.emp_name}
								</c:forEach>
								</td>
								<td id="none_td">
								</td>
							</tr>
							<tr>
								<th id="table_th">신청자</th>
								<td style="text-align: left; padding-left: 15px;">
									${getDetail.send_emp_name}
								</td>
								<td id="none_td">
								</td>
							</tr>
						</table>
						<input type="hidden" id="apply" name="app_id">
						<input type="hidden" id="appStId" name="app_st_id">
					</form>
					<div id="editor"></div>
					<div id="commentArea">
						<div id="addFile">
							<div>첨부파일</div>
							<div></div>
						</div>
						<div id="addComment">
						
							<div id="comment">
								<p>Comment</p>
								<p>결재 문서에 대한 답변을 적어주세요</p>
							</div>
							<textarea id="comment" rows="" cols="100%">
							
							</textarea>
						</div>
					</div>
					
				</div>
			</article>
		</section>
	</div>

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
			height:'1200px',
			
		});
		
		// 에디터에 html을 삽입
		//editor.setHtml('<div id="mydiv"> <span style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"> <colgroup> <col width="310"> <col width="490"> </colgroup> <tbody id="firstTable"> <tr> <td style="background: rgb(255, 255, 255); padding: 0px !important; border: 0px currentColor; border-image: none; height: 70px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"> 기&nbsp;&nbsp;안&nbsp;&nbsp;용&nbsp;&nbsp;지</td> </tr> <tr> <td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;"> <table style="border: 1px solid rgb(0, 0, 0); font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; margin-top: 1px; border-collapse: collapse; width: 318px;"> <colgroup> <col width="90"> <col width="120"> </colgroup> <tbody> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 문서번호</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:docNo}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">문서번호</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><br> </td> </tr> <tr style="height: 32px;"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 부&nbsp;&nbsp;&nbsp;서</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안부서</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 기&nbsp;안&nbsp;일</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안일</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 기 안 자</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:draftUser}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안자</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 시행일자</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{calendar}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><input class="ipt_editor ipt_editor_date" type="date" name="tryDate"><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 결재내용</td> <div id="#label_div"> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{radio_인가_조건부_보류_부결}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""> <input class="editor_opt" type="radio" name="doc_label" value="인가"> <label class="editor_label">인가</label> <input class="editor_opt" type="radio" name="doc_label" value="조건부"> <label class="editor_label">조건부</label> <input class="editor_opt"	type="radio" name="doc_label" value="보류"> <label class="editor_label">보류</label> <input class="editor_opt" type="radio" name="doc_label" value="부결"> <label class="editor_label">부결</label> </div> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> </td> </tr> </tbody> </table> </td> <td style="background: white; padding: 0px !important; border: none; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;"> [결재선]<!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <br> <table id="approvalArea" style="width: 50%; border: 1px solid black; border-collapse: collapse; text-align: center;"> <tr style="height: 30;"> <th style="background-color: rgb(221, 221, 221); font-size: 12px; font-weight: bold; border: 1px solid black; border-collapse: collapse; text-align: center; color: black;">결재자</th> <th style="background-color: rgb(221, 221, 221); font-size: 12px; font-weight: bold; border: 1px solid black; border-collapse: collapse; text-align: center; color: black">결재자</th> </tr> <tr style="height: 100;"> <td id="signTd1"><input type="text" id="txt"></td> <td id="signTd2"><input type="text" id="txt2"></td> </tr> </table> </td> </tr> </tbody> </table> <table style="border: 2px solid; width: 800px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; margin-top: 10px; border-collapse: collapse; height: 385px;"> <colgroup> <col width="140"> <col width="660"> </colgroup> <tbody> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 참&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{label:docReference}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">참조자</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="2">상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용</td> </tr> <tr> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{editor}}" data-wrapper="" style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_editor" style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: 200px; margin-top: 0px; margin-bottom: 0px;">에디터(본문)</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></td> </tr> </tbody> </table> </span></span> <p style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"> <br> </p> </div>');
	    editor.setHtml(`'${getDetail.send_app_content}'`);
		
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
              
              $("#signName").text('${signVo.emp_name}');
			  
          })
          
          // 테스트
		  $("#btn").on("click", function(){
		  var test = $(".editor_opt[name=doc_label]:checked").val();
			 console.log(test); 
			 
		  });
		
		
          // 에디터에 입력된 값들을 넘겨주는 버튼이 클릭 시 실행
          editBtn.on('click', function(){
        	  var template = $("#mydiv").html();
        	  var opt = $(".editor_opt[name=doc_label]:checked").val();
        	  var hidden = $("#hd");
        	  var hidden2 = $("#hd2");
        	  hidden.val(template);
        	  hidden2.val(opt);
        	  
          });
		
		  
		  $("#doc").on("click", function(){
		     var label = $("#doc_label");
		     var select = $("#doc option:selected").val();
		     
		     label.empty();
		     label.append(select);
		  });
		  
		  
		  
		  // 취소버튼 클릭시 main으로 이동
		 function cancle(){
			 location.replace("approval_Main");
		 };
		 
		 // 승인
		 function approve() {
			 $("#apply").val('${getDetail.send_app_id}');
			 $("#appStId").val('${getDetail.appstatment_id}');
			 $("#target").submit();
		 }
		 
		 // 검토
		 function waiting() {
			 
		 }
		 
		 // 반려
		 function del() {
			 
		 }
		 
		 function signAdd() {
			 $("#signTd1").attr('style', 'height:120px;');
			 $("#signImg").attr('style', 'height:100px; width:100px;')
			 $("#signImg").attr('src', '${signVo.emp_sign}');
		 }
	</script>	
</html>