<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<div id="sec_date">2020-11-16</div>
					<div id="sec_box">
						<div>
							<span>22건</span>
							<span>전체</span>
						</div>
					</div>
					<div id="sec_box">
						<div>
							<span>10건</span>
							<span>진행중</span>
						</div>
					</div>
					<div id="sec_box">
						<div>
							<span style="color:red">2건</span>
							<span>반려</span>
						</div>
					</div>
					<div id="sec_box_lg" class="detail">
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
						<div id="process">
							<div>
								<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>
								<p id="check_name">이름</p>
							</div>
							<img id="right" src="${pageContext.request.contextPath }/resources/img/approval/right.svg" style="width:30px">
							<div>
								<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>
								<p id="check_name">이름</p>
							</div>
							<img id="right" src="${pageContext.request.contextPath }/resources/img/approval/right.svg" style="width:30px">
							<div>
								<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>
								<p id="check_name">이름</p>
							</div>
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
						<div id="process">
							<div>
								<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>
								<p id="check_name">이름</p>
							</div>
							<img id="right" src="${pageContext.request.contextPath }/resources/img/approval/right.svg" style="width:30px">
							<div>
								<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>
								<p id="check_name">이름</p>
							</div>
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
						<div id="process">
							<div>
								<p><img src="${pageContext.request.contextPath }/resources/img/approval/check.svg" style="width:30px"></p>
								<p id="check_name">이름</p>
							</div>
						</div>	
					</div>
				</div> 
				
			</article>
		</section>
	</div>
	
	<script>
		$(".detail").on("click", function(){
			location.href="approval_get_detail?";
		});
	</script>
</body>
</html>