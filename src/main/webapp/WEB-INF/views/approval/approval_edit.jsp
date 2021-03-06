<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Toast Editor 2.0.0과 의존성 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/approval/approval_edit.css">
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
	
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->
				<form id="htmlpass" method="post" action="readTemplate">
				<div class="conWrap">
					<div id="app_title">
						새 결재 문서 작성
					</div>
					<div id="app_subTitle">
					<label for="doc" id="doc_label">빈 문서</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="doc" id="doc">
							<option id="doc_op" value="빈 문서" selected="selected">빈 문서</option>
							<c:forEach items="${tempList }" var="temp">
								<option id="doc_op" value="${temp.temp_title }">${temp.temp_title }</option>
							</c:forEach>
						</select>
					</div>
					* 선택값이 없으면 문서관리에서 먼저 양식을 추가해주세요.
						<table id="doc_table">
							<tr>
								<th id="table_th">제목</th>
								<td><input class="title"id="table_input" type="text" placeholder="제목을 입력해주세요" name="inputTitle"></td>
								<td id="none_td"></td>	
							</tr>
							<tr>
								<th id="table_th">수신참조</th>
								<td>
										<input class="susin" id="table_input" type="text" placeholder="참조자를 선택해주세요" name="inputSusin" readOnly>
								</td>
								<td id="none_td">
									<div id="1" onclick="modal1(this);">									
										<img src="${pageContext.request.contextPath }/resources/img/approval/user-solid.svg">
									</div>
								</td>
							</tr>
							<tr>
								<th id="table_th">참조문서</th>
								<td><input id="table_input" type="file" placeholder="참조문서를 선택해주세요" name="file" readOnly></td>
								<td id="none_td">
									<a>
										<img src="${pageContext.request.contextPath }/resources/img/approval/file-powerpoint-solid.svg">
									</a>
								</td>
							</tr>
							<tr>
								<th id="table_th">시행자</th>
								<td><input class="player" id="table_input" type="text" placeholder="시행자를 선택해주세요" name="inputPlayer" readOnly></td>
								<td id="none_td">
									<div id="2" onclick="modal2(this);">
										<a href="#">
											<img src="${pageContext.request.contextPath }/resources/img/approval/book-reader-solid.svg">
										</a>
									</div>
								</td>
							</tr>
							<tr>
								<th id="table_th">결재자</th>
								<td><input class="finalApp" id="table_input" type="text" placeholder="결재자를 선택해주세요" name="inputFinalApp" readOnly></td>
								<td id="none_td">
									<div id="3" onclick="modal3(this);">
									<a href="#">
										<img src="${pageContext.request.contextPath }/resources/img/approval/user-check-solid.svg">
									</a>
									</div>
								</td>
							</tr>
						</table>
				
				<div id="editor"></div>
					<div>
						<button id="cancle_btn" onclick="cancle();">취소</button>	
					</div>
						<input type="hidden" id="hd" name="htmlcontent"> 
						<input type="hidden" id="hd2" name="doc_type"> 
						<input type="hidden" id="soosinHidden" name="soosin_empId">
						<input type="hidden" id="playerHidden" name="player_empId">
						<input type="hidden" id="finalAppHidden" name="final_empId">
						<input type="hidden" id="tempName" name="tempName">
						<input type="hidden" id="tempContent" name="temp_content">
						<input type="submit" id="submit" value="기안">
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
		var checkInput;	
		var editBtn = $("#submit"); // 넘겨줄 때 필요한 버튼
		// 에디터 생성
		var editor = new toastui.Editor({
			el:document.querySelector("#editor"),
			initialEditType:'wysiwyg',
			previewStyle:'vertical',
			height:'500px',
			
		});
		
		// 에디터에 html을 삽입
		/* editor.setHtml('<div id="mydiv"> <span style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"> <colgroup> <col width="310"> <col width="490"> </colgroup> <tbody> <tr> <td style="background: rgb(255, 255, 255); padding: 0px !important; border: 0px currentColor; border-image: none; height: 70px; text-align: center; color: black; font-size: 36px; font-weight: bold; vertical-align: top;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"> &nbsp;&nbsp기&nbsp;&nbsp;안&nbsp;&nbsp;서</td> </tr> <tr> <td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;"> <table style="border: 1px solid rgb(0, 0, 0); font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; margin-top: 1px; border-collapse: collapse; width: 318px;"> <colgroup> <col width="90"> <col width="120"> </colgroup> <tbody id="firstTable"> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 문서번호</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:docNo}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">문서번호</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><br> </td> </tr> <tr style="height: 32px;"> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 부&nbsp;&nbsp;&nbsp;서</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안부서</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 기&nbsp;안&nbsp;일</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안일</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 기 안 자</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:draftUser}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">기안자</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 시행일자</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{calendar}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><input class="ipt_editor ipt_editor_date" type="date" name="tryDate"><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 결재내용</td> <div id="#label_div"> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle; width: 269px;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{radio_인가_조건부_보류_부결}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""> <input class="editor_opt" type="radio" name="doc_label" value="인가"> <label class="editor_label">인가</label> <input class="editor_opt" type="radio" name="doc_label" value="조건부"> <label class="editor_label">조건부</label> <input class="editor_opt"	type="radio" name="doc_label" value="보류"> <label class="editor_label">보류</label> <input class="editor_opt" type="radio" name="doc_label" value="부결"> <label class="editor_label">부결</label> </div> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> </td> </tr> </tbody> </table> </td> <td style="background: white; padding: 0px !important; border: none; text-align: right; color: black; font-size: 12px; font-weight: normal; vertical-align: top;"> [결재선]<!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --> <br> <table id="approvalArea" style="margin-inline: auto; width: 130px; border: 1px solid black; border-collapse: collapse; text-align: center;"> <tr style="height: 30;"> <th style="background-color: rgb(221, 221, 221); font-size: 12px; font-weight: bold; border: 1px solid black; border-collapse: collapse; text-align: center; color: black;">결재자 : <span id="signName"></span></th> </tr> <tr style="height: 100;"> <td id="signTd1" style="border: 1px solid black;"><img id="signImg"></td> </tr> </table> </td> </tr> </tbody> </table> <table style="border: 2px solid; width: 800px; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; margin-top: 10px; border-collapse: collapse; height: 385px;"> <colgroup> <col width="140"> <col width="660"> </colgroup> <tbody> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 참&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{label:docReference}}" data-wrapper="" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">참조자</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;"> 제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;"> <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><input class="ipt_editor" type="text"><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br> </td> </tr> <tr> <td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;" colspan="2">상&nbsp;&nbsp;세&nbsp;&nbsp;내&nbsp;&nbsp;용</td> </tr> <tr> <td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 18px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;" colspan="2"><span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{editor}}" data-wrapper="" style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_editor" style="width: 100%; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 11pt; line-height: 200px; margin-top: 0px; margin-bottom: 0px;">에디터(본문)</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &amp; quot; malgun gothic&amp;quot; , dotum , arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br></td> </tr> </tbody> </table> </span></span> <p style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"> <br> </p> </div> </body> </html>'); */
	    
		
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
        	  var template = $("#mydiv").html();
        	  var opt = $(".editor_opt[name=doc_label]:checked").val();
        	  var hidden = $("#hd");
        	  var hidden2 = $("#hd2");
        	  hidden.val(template);
        	  hidden2.val(opt);
        	  
          });
		
		  
          // 상위 select 값 선택 시 템플릿 불러오기
		  $("#doc").on("change", function(){
		     var label = $("#doc_label");
		     var select = $("#doc option:selected").val();
		     var hidden2 = $("#tempName");
		     
		     label.empty();
		     label.append(select);
		     hidden2.val(select);
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/approval/readTemp",
				data: {"tempName" : select},
				dataType:"json",
				success:function(data){
					editor.setHtml(data.tempContent);
					$("#tempContent").val(data.tempContent);
					console.log(data);
					console.log("뭐야");
				}
			});
		  });
		  
		  
		  // 취소버튼 클릭시 main으로 이동
		 function cancle(){
			 location.replace("approval_Main");
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
			 var test = $(".finalApp").val();
			 var temp = test.split(" ").join("");
			 var list = temp.split(">");
			 console.log(list);
			 
			 $(".signArea").html('');
			 for(var i = 0; i < list.length; i++){
				 $(".signArea").append('<table id="approvalArea" style="margin-inline: auto; width: 130px; border: 1px solid black; border-collapse: collapse; text-align: center;"> <tr style="height: 30;"> <th style="background-color: rgb(221, 221, 221); font-size: 12px; font-weight: bold; border: 1px solid black; border-collapse: collapse; text-align: center; color: black;">결재자 : <span id="signName'+i+'"></span></th> </tr> <tr style="height: 100;"> <td id="signTd1" style="border: 1px solid black;"><img id="signImg"></td> </tr> </table>');
				 $('#signName'+i).append(list[i]);
				 console.log(list[i])
				 
			 }
			 
		 };
		 
		 // 문서 유효성 검사
		 $("#submit").on("click", function(){
			 var title = $(".title").val();
			 var susin = $(".susin").val();
			 var player = $(".player").val();
			 var finalApp = $(".finalApp").val();
			 var template = editor.html();

			if(!title) {
				alert("제목을 입력해주세요");
				$(".title").focus();
				return false;
			}
			
			if(!player) {
				alert("시행자를 선택해주세요");
				$(".player").focus();
				return false;
			}
			
			if(!finalApp) {
				alert("결재자를 선택해주세요");
				$(".finalApp").focus();
				return false;
			}
			
			if(!template) {
				alert("문서 작성을 해주세요");
				$("#mydiv").focus();
				return false;
			}
 		 });
	</script>	
</html>