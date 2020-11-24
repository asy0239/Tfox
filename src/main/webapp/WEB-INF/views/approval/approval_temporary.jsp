<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/approval_temporary.css">
<title>임시저장함</title>
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
						<span id="subMain">결재 임시저장함</span> 
						<span id="app_subsub"> 임시저장한 결재 내역을 보고 관리할 수 있습니다 </span> 
					</div>
				</div>
				
				<div id="sec_area">
					<div id="sec_date">2020-11-16</div>
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
						<div id="edit">
							<img src="${pageContext.request.contextPath }/resources/img/approval/edit.svg">
							<span>수정</span>
							
						</div>
						<div id="edit">
							<img src="${pageContext.request.contextPath }/resources/img/approval/trash-alt-solid.svg">
							<span>삭제</span>
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
						<div id="edit">
							<img src="${pageContext.request.contextPath }/resources/img/approval/edit.svg">
							<span>수정</span>
							
						</div>
						<div id="edit">
							<img src="${pageContext.request.contextPath }/resources/img/approval/trash-alt-solid.svg">
							<span>삭제</span>
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
						<div id="edit">
							<img src="${pageContext.request.contextPath }/resources/img/approval/edit.svg">
							<span>수정</span>
							
						</div>
						<div id="edit">
							<img src="${pageContext.request.contextPath }/resources/img/approval/trash-alt-solid.svg">
							<span>삭제</span>
						</div>
					</div>
				</div> 
				
			</article>
		</section>
	</div>
</body>
</html>