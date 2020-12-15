<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approval_keep.css">
<title>결재 상신함</title>
</head>
<body>
	 <div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->

				<div class="conWrap">
				<div id="app_title">전자결재</div>
					<div id="app_subTitle">
						<span id="subMain">결재 상신함</span> 
						<span id="app_subsub"> 결재 상신 내역을 확인하고 관리할 수 있습니다 </span> 
					</div>
				</div>
				<div id="sec_area">
					<div id="sec_box">
						<div>
							<span>${fn:length(sendContainsDocCount) }건</span>
							<span>전체</span>	
						</div>
					</div>
					<div id="sec_box">
						<div>
						<c:choose>
							<c:when test="${!empty sendIngDocList }">
								<span>${fn:length(sendIngDocList)}건</span>
							</c:when>
							<c:when test="${empty sendIngDocList }">
								<span>0건</span>
							</c:when>
						</c:choose>
							<span>진행중</span>
						</div>
					</div>
					<div id="sec_box">
						<div>
						<c:choose>
							<c:when test="${!empty sendNoDocList }">
								<span style="color:red">${fn:length(sendNoDocList)}건</span>
							</c:when>
							<c:when test="${empty sendNoDocList }">
								<span style="color:red">0건</span>
							</c:when>
						</c:choose>
							<span>반려</span>
						</div>
					</div>
					<c:set var="temp" value=""></c:set>
					<c:set var="miniTemp" value="${sendDocList[0].send_app_id }"></c:set>
					<c:forEach var="totalList" items="${sendDocList }" varStatus="index">
					<c:if test="${totalList.send_app_id != temp}">
					<div id="sec_box_lg">
						<div>
							<c:choose>
								<c:when test="${totalList.temp_title eq '품의서'}">
									<img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">						
								</c:when>
								<c:when test="${totalList.temp_title eq '기안서'}">
									<img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg">					
								</c:when>
								<c:when test="${totalList.temp_title eq '회계장부'}">
									<img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg">				
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg">
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							${totalList.temp_title}
						</div>
						<div>
							${totalList.send_app_title }
						</div>
						<div>
							<img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg">
						</div>
						<div>
							<p>${totalList.st_emp_name}</p>
							<p>${totalList.st_emp_dept_name}</p>
						</div>
						
						<div id="process" class="${index.index }">
						
							<c:forEach var="stOrder" items="${sendDocList }" varStatus="i">
								<c:if test="${totalList.send_app_id eq stOrder.send_app_id }">
								<c:choose>
									<c:when test="${stOrder.send_app_id eq miniTemp}">
										<div>
											<c:if test="${stOrder.st_apply eq '승인'}">
											<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>												
											</c:if>
											<c:if test="${stOrder.st_apply eq '결재중'}">
											<p><img src="${pageContext.request.contextPath }/resources/img/approval/edit.svg" style="width:30px"></p>
											</c:if>
											<c:if test="${stOrder.st_apply eq '반려'}">
											<p><img src="${pageContext.request.contextPath }/resources/img/approval/times-solid.svg" style="width:30px"></p>
											</c:if>
											<p id="check_name">${stOrder.st_emp_name }</p>
										</div>							
										<img id="right" src="${pageContext.request.contextPath }/resources/img/approval/right.svg" style="width:30px">
									</c:when>
									<c:when test="${stOrder.send_app_id != miniTemp}">
										<div>
											<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>
											<p id="check_name">${stOrder.st_emp_name }</p>
										</div>							
									</c:when>
								</c:choose>
								</c:if>
								<c:set var="miniTemp" value="${sendDocList[i.index+1].send_app_id }"/>
							</c:forEach>
						</div>
					</div>
					</c:if>
					<c:set var="temp" value="${totalList.send_app_id}"></c:set>
					</c:forEach>
					</div>
			</article>
		</section>
	</div>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			for(var i = 0; i < ${sendDocList.size()}; i++) {
				$("."+i).children('img').last().css('display','none');
			}
			if(${sendContainsDocCount.size()} == 0){
				$("#sec_area").css("grid-template-rows", "repeat(1 ,140px)")
			} else {
				$("#sec_area").css("grid-template-rows", "repeat("+${sendContainsDocCount.size()}+" ,130px)")									
			}
		});
	</script>
</body>
</html>