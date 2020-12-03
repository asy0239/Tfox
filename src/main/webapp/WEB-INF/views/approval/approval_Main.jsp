<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/approval/approvalTemplate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/approval/approval_main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/approval/card_hover.css">
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
						<span id="app_subsub">
							사용자가 가장 많이 사용하는 결재 양식입니다. </span>
						<button id="approval_btn" onclick="edit();">결재 작성 버튼</button>
					</div>
					<div id="doc_box_area">
						<c:forEach var="userTempList" items="${userTemplateList}">
							<c:forEach var="tempList" items="${templateList}">
								<c:if test="${tempList.temp_id == userTempList.get('TEMP_ID')}">
									<c:choose>
										<c:when test="${tempList.temp_id eq 'TMP001'}">
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:when>
										<c:when test="${tempList.temp_id eq 'TMP002'}">
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:when>
										<c:when test="${tempList.temp_id eq 'TMP003'}">
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:when>
										<c:otherwise>
											<div id="doc_box">
												<img
													src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg">
												<div id="doc_name">${tempList.temp_title}</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
				</div>
				<div id="sec_area">
					<div id="sec_box" onclick="weekIgnore();">
						<div>
							<span>${fn:length(weekIgnore)}건</span> 
							<span>7일 이상 지연된 결재요청(상신)</span>
						</div>
					</div>
					<div id="sec_box" onclick="noCheck();">
						<div>
							<span>${fn:length(noCheck)}건</span>
							<span>확인하지 않은 결재요청(수신)</span>
						</div>
					</div>
					<div id="sec_box" onclick="totalDoc();">
						<div>
							<span style="color: purple">${fn:length(docList)}건</span>
							<span>전체 결재 내역 보기</span>
						</div>
					</div>
					
						<c:forEach var="doc" items="${docList}">
								<div id="sec_box_lg">
								<div>
									<c:choose>
										<c:when test="${doc.temp_id eq 'TMP001'}">
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg">
										</c:when>
										<c:when test="${doc.temp_id eq 'TMP002'}">
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">
										</c:when>
										<c:when test="${doc.temp_id eq 'TMP003'}">
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg">
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg">
										</c:otherwise>
									</c:choose>
								</div>
								<div>${doc.temp_title }</div>
								<div>${doc.app_title }</div>
								<div>
									<img
										src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg">
								</div>
								<div>
									<p>${doc.emp_name }</p>
									<p>${doc.dept_name }</p>
								</div>
								<div>${doc.app_date }</div>
								</div>
						</c:forEach>
					
				</div>
			</article>
		</section>
	</div>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script>
		function edit() {
			location.href = "approval_edit";
		}
		
		$(document).ready(function() {
			if(${docList.size()} == 0) {
				$("#sec_area").append('<div id="sec_box_lg" class="nullDoc">조회된 내역이 없습니다.</div>')
			} else {
				$("#sec_area").css("grid-template-rows", "repeat("+${docList.size()} +" ,140px)")				
			}
			;
		});
		
		// 7일간 안본 문서 내역 보기
 		function weekIgnore(){
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/approval/weekIgnore.do",
				dataType:"json",
				success:function(data){
					$("#sec_area").html('');
					/* $("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>0건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>0건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">2건</span> <span>전체 결재 내역 보기</span> </div> </div> <c:forEach var="doc" items="${data.weekIgnore }"> <div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq 'TMP001'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP002'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP003'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>${doc.temp_title }</div> <div>${doc.app_title }</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>${doc.emp_name }</p> <p>${doc.dept_name }</p> </div> <div>${doc.app_date }</div> </div> </c:forEach> </div>'); */
					var tmpList = ['TMP001' , 'TMP002', 'TMP003'];
					$("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>'+data.length+'건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>'+${noCheck.size()}+'건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">'+${docList.size()}+'건</span> <span>전체 결재 내역 보기</span> </div> </div>');
					if(data.length == 0) {
						$("#sec_area").append('<div id="sec_box_lg" class="nullDoc">조회된 내역이 없습니다.</div>')
					} else {
						$.each(data,function(index, doc){
								$("#sec_area").append('<div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq '+tmpList[0]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[1]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[2]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>'+doc.temp_title+'</div> <div>'+doc.app_title+'</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>'+doc.emp_name+'</p> <p>'+doc.dept_name+'</p> </div> <div>'+dateFormatting(doc.app_date)+'</div> </div>')							
						})
					}
				}
			});
		};
		// 결재하지 않은 결재
		function noCheck(){
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/approval/noCheck.do",
				dataType:"json",
				success:function(data) {
					$("#sec_area").html('');
					/* $("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>0건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>0건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">2건</span> <span>전체 결재 내역 보기</span> </div> </div> <c:forEach var="doc" items="${data.weekIgnore }"> <div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq 'TMP001'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP002'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP003'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>${doc.temp_title }</div> <div>${doc.app_title }</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>${doc.emp_name }</p> <p>${doc.dept_name }</p> </div> <div>${doc.app_date }</div> </div> </c:forEach> </div>'); */
					var tmpList = ['TMP001' , 'TMP002', 'TMP003'];
					console.log(data.length==0);
					$("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>'+${weekIgnore.size()}+'건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>'+data.length+'건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">'+${docList.size()}+'건</span> <span>전체 결재 내역 보기</span> </div> </div>');
					if(data.length == 0) {
						$("#sec_area").append('<div id="sec_box_lg" class="nullDoc">조회된 내역이 없습니다.</div>')
					} else {
						$.each(data,function(index, doc){
								$("#sec_area").append('<div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq '+tmpList[0]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[1]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[2]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>'+doc.send_temp_title+'</div> <div>'+doc.send_app_title+'</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>'+doc.send_emp_name+'</p> <p>'+doc.send_dept_name+'</p> </div> <div>'+dateFormatting(doc.send_app_date)+'</div> </div>')							
						})
					}
				}
			});
		};
		
		// 로그인한 계정의 관련된 모든 문서들을 볼 수 있다.
		function totalDoc(){
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/approval/totalDoc.do",
				dataType:"json",
				success:function(data) {
					$("#sec_area").html('');
					/* $("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>0건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>0건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">2건</span> <span>전체 결재 내역 보기</span> </div> </div> <c:forEach var="doc" items="${data.weekIgnore }"> <div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq 'TMP001'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP002'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP003'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>${doc.temp_title }</div> <div>${doc.app_title }</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>${doc.emp_name }</p> <p>${doc.dept_name }</p> </div> <div>${doc.app_date }</div> </div> </c:forEach> </div>'); */
					var tmpList = ['TMP001' , 'TMP002', 'TMP003'];
					console.log(data.length==0);
					$("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>'+${weekIgnore.size()}+'건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>'+data.length+'건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">'+${docList.size()}+'건</span> <span>전체 결재 내역 보기</span> </div> </div>');
					if(data.length == 0) {
						$("#sec_area").append('<div id="sec_box_lg" class="nullDoc">조회된 내역이 없습니다.</div>')
					} else {
						$.each(data,function(index, doc){
								$("#sec_area").append('<div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq '+tmpList[0]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[1]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[2]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>'+doc.send_temp_title+'</div> <div>'+doc.send_app_title+'</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>'+doc.send_emp_name+'</p> <p>'+doc.send_dept_name+'</p> </div> <div>'+dateFormatting(doc.send_app_date)+'</div> </div>')							
						})
					}
				}
			});
		};
		
		// 날짜 데이터 포맷팅 함수
		function dateFormatting(date){
			var month="";
			var year="";
			var day="";
			var resultDay="0";
			var resultMonth="0";
			for(var i = 0; i<date.length; i++){
				if(!isNaN(date[i])) {
					if(i < 2) {
						if(date[i] != " "){
							month += date[i];
						}
					}
					if(i >= 2 && i < 6) {
						if(date[i] != " "){
							day += date[i];						
						}
					}
					if(i>=6) {
						year += date[i];
					}
				}
			}
			
			if(day.length != 2){
				resultDay += day;
			} else {
				resultDay = day;
			}
			if(month.length != 2) {
				resultMonth += month;
			} else {
				resultMonth = month;
			}
		
			var result = year+"-"+resultMonth+"-"+resultDay;
			result.replace(/\s/gi,"");
			return result;
		}
	</script>
</body>
</html>