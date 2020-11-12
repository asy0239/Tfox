<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approval_main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/card_hover.css">
<title>전자결재 메인</title>
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
						<span id="subMain"> 자주쓰는 결재 </span> 
						<span id="app_subsub"> 사용자가 가장 많이 사용하는 결재 양식입니다. </span> 
						<button id="approval_btn"> 결재 작성 버튼 </button>
					</div>
				<div id="doc_box_area">
					<div id="doc_box">	
						<i class="fas fa-file-invoice-dollar fa-10x" id="doc_img"></i>
						<div id="doc_name">품의서</div>
					</div>
					<div id="doc_box">
						<i class="fas fa-file-alt fa-10x" id="doc_img"></i>
					<div id="doc_name">기안서</div>
					</div>
					<div id="doc_box">
						<i class="fas fa-file-contract fa-10x" id="doc_img"></i>
						<div id="doc_name">회계장부</div>
					</div>
					
				</div>
				</div>
				
			</article>
		</section>
	</div>
	
</body>
</html>