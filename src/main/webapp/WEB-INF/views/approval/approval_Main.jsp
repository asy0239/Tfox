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
						<button id="approval_btn" onclick="edit();"> 결재 작성 버튼 </button>
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
				<div id="sec_area">
					<div id="sec_box">
						<div>
							<span>0건</span>
							<span>7일 이상 지연된 결재요청</span>
						</div>
					</div>
					<div id="sec_box">
						<div>
							<span>0건</span>
							<span>확인하지 않은 결재요청</span>
						</div>
					</div>
					<div id="sec_box">
						<div>
							<span style="color:purple">2건</span>
							<span>전체 결재 내역 보기</span>
						</div>
					</div>
					<div id="sec_box_lg">
						<div>
							<img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">
						</div>
						<div>
							양식명
						</div>
						<div>
							문서 제목
						</div>
						<div>
							<img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg">
						</div>
						<div>
							<p>사원이름</p>
							<p>부서</p>
						</div>
						<div>
							날짜
						</div>
					</div>
				</div> 
				
			</article>
		</section>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		function edit() {
			location.href = "approval_edit";
		}
	</script>
</body>
</html>