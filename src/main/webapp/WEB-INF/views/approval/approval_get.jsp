<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approval_keep.css">
<title>결재 수신함</title>
</head>
<body>
	 <div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>




		<section class="contents">
		<form id="target" action="${pageContext.request.contextPath }/approval/approval_get_detail" method="POST">
			<article>
				<!-- 내용작성을 이곳에서~ -->
				<div class="conWrap">
				<div id="app_title">전자결재</div>
					<div id="app_subTitle">
						<span id="subMain">결재 수신함</span> 
						<span id="app_subsub"> 결재 수신 내역을 확인하고 관리할 수 있습니다 </span> 
					</div>
				</div>
				
				<div id="sec_area">
					<div id="sec_box">
						<div>
							<span>${fn:length(noCheckList) }건</span>
							<span>전체</span>
						</div>
					</div>
					<div id="sec_box">
						<div>
							<span>${fn:length(ingList) }건</span>
							<span>결재 대기 중</span>
						</div>
					</div>
					<div id="sec_box">
						<div>
							<span style="color:red">${fn:length(applyList) }건</span>
							<span>결재 완료</span>
						</div>
					</div>
					<c:forEach var="noCheckList" items="${noCheckList }">
					<div id="sec_box_lg" class="detail">
						<div>
							<c:choose>
								<c:when test="${noCheckList.send_temp_title eq '품의서'}">
									<img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">						
								</c:when>
								<c:when test="${noCheckList.send_temp_title eq '기안서'}">
									<img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg">					
								</c:when>
								<c:when test="${noCheckList.send_temp_title eq '회계장부'}">
									<img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg">				
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg">
								</c:otherwise>
							</c:choose>	
						</div>
						<div>
							${noCheckList.send_temp_title}
						</div>
						<div>
							${noCheckList.send_app_title}
						</div>
						<div>
							<img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg">
						</div>
						<div>
							<p>${noCheckList.send_emp_name}</p>
							<p>${noCheckList.send_dept_name }</p>
						</div>
						<div id="" class="${index.index }">
							<div></div>
							<div style="width:100%">
								${noCheckList.send_app_date }
							</div>
						</div>
						<input type="hidden" name="in_doc_id" class="docId" value="${noCheckList.send_app_id }">
						<input type="hidden" name="doc_id" class="sendDocId" value="">
					</div>
					</c:forEach>
				</div> 
				
			</article>
					</form>
		</section>
	</div>
	
	<script>
		$(".detail").click(function(){
			var app_id = $(this).children(".docId").val();
			var send_app_id = $(".sendDocId");
			send_app_id.val(app_id);
			$("#target").submit();
			console.log(app_id);
		});
		
		$(document).ready(function(){
			for(var i = 0; i < ${noCheckList.size()}; i++) {
				$("."+i).children('img').last().css('display','none');
			}
			if(${noCheckList.size()} == 0){
				$("#sec_area").css("grid-template-rows", "repeat(1 ,140px)")
			} else {
				$("#sec_area").css("grid-template-rows", "repeat("+${noCheckList.size()}+" ,130px)")									
			}
		});
	</script>
</body>
</html>