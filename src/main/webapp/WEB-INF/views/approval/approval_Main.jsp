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
							<span id="total" style="color: purple"></span>
							<span>전체 결재 내역 보기</span>
						</div>
					</div>
					<c:forEach var="doc" items="${totalDoc['sendList']}" begin='0' end= '6'>
							<div id="sec_box_lg">
 								<%-- <div>${docMap['emp_id']}</div> --%>
								<div>
									<c:choose>
										<c:when test="${doc['temp_id'] eq 'TMP001'}">
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg">
										</c:when>
										<c:when test="${doc['temp_id'] eq 'TMP002'}">
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg">
										</c:when>
										<c:when test="${doc['temp_id'] eq 'TMP003'}">
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg">
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg">
										</c:otherwise>
									</c:choose>
								</div>
								<div>${doc['temp_title'] }</div>
								<div>${doc['app_title'] }</div>
								<div>
									<img
										src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg">
								</div>
								<div>
									<p>${doc['emp_name']}</p>
									<p>${doc['dept_name']}</p>
								</div>
								<div>${doc['app_date'] }</div>
								</div>
						</c:forEach>
					</div>
					<div id="pageNumber">
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
			var sendList = ${docList.size()};
			var weekIgnore = ${totalDoc['refList'].size()};
			var noCheck = ${noCheck.size()};
			var total = sendList + weekIgnore + noCheck;
			if(${docList.size()} == 0) {
				$("#sec_area").append('<div id="sec_box_lg" class="nullDoc">조회된 내역이 없습니다.</div>')
			} else {
				$("#sec_area").css("grid-template-rows", "repeat("+sendList+" ,140px)")				
			};
			$("#total").text(total +"건");
			
		});
		
		// 7일간 안본 문서 내역 보기
 		function weekIgnore(){
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/approval/weekIgnore.do",
				dataType:"json",
				success:function(data){
					var tmpList = ['TMP001' , 'TMP002', 'TMP003'];
					var sendList = ${docList.size()};
					var ref = ${totalDoc['refList'].size()};
					var noCheck = ${noCheck.size()};
					var total = sendList + ref + noCheck;
					$("#sec_area").html('');
					if(data.length == 0){
						$("#sec_area").css("grid-template-rows", "repeat(1 ,140px)")
					}
					$("#sec_area").css("grid-template-rows", "repeat("+data.length+" ,140px)")				
					/* $("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>0건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>0건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">2건</span> <span>전체 결재 내역 보기</span> </div> </div> <c:forEach var="doc" items="${data.weekIgnore }"> <div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq 'TMP001'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP002'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP003'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>${doc.temp_title }</div> <div>${doc.app_title }</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>${doc.emp_name }</p> <p>${doc.dept_name }</p> </div> <div>${doc.app_date }</div> </div> </c:forEach> </div>'); */
					$("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>'+data.length+'건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>'+noCheck+'건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">'+total+'건</span> <span>전체 결재 내역 보기</span> </div> </div>');
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
					var tmpList = ['TMP001' , 'TMP002', 'TMP003'];
					var sendList = ${docList.size()};
					var ref = ${totalDoc['refList'].size()};
					var noCheck = ${noCheck.size()};
					var total = sendList + ref + noCheck;
					console.log(noCheck);
					$("#sec_area").html('');
					/* $("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>0건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>0건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">2건</span> <span>전체 결재 내역 보기</span> </div> </div> <c:forEach var="doc" items="${data.weekIgnore }"> <div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq 'TMP001'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP002'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP003'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>${doc.temp_title }</div> <div>${doc.app_title }</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>${doc.emp_name }</p> <p>${doc.dept_name }</p> </div> <div>${doc.app_date }</div> </div> </c:forEach> </div>'); */
					if(noCheck == 0) {
						$("#sec_area").css("grid-template-rows", "repeat(1 ,140px)")				
					} else {
						$("#sec_area").css("grid-template-rows", "repeat("+noCheck+" ,140px)")
					}
					$("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>'+${weekIgnore.size()}+'건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>'+noCheck+'건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">'+total+'건</span> <span>전체 결재 내역 보기</span> </div> </div>');
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
					var tmpList = ['TMP001' , 'TMP002', 'TMP003'];
					var sendList = ${docList.size()};
					var ref = ${totalDoc['refList'].size()};
					var noCheck = ${noCheck.size()};
					var total = sendList + ref + noCheck;
					var total_doc = sortDate(data); // 페이징할 데이터
					var dataPerpage = 10; // 한 페이지에 나타낼 데이터 수
					var pageCount = 5; // 한 화면에 나올 페이지 수
					$("#sec_area").html('');
					/* $("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>0건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>0건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">2건</span> <span>전체 결재 내역 보기</span> </div> </div> <c:forEach var="doc" items="${data.weekIgnore }"> <div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq 'TMP001'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP002'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq 'TMP003'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>${doc.temp_title }</div> <div>${doc.app_title }</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>${doc.emp_name }</p> <p>${doc.dept_name }</p> </div> <div>${doc.app_date }</div> </div> </c:forEach> </div>'); */
					$("#sec_area").css("grid-template-rows", "repeat("+total+" ,140px)")				
					$("#sec_area").html('<div id="sec_box" onclick="weekIgnore();"> <div> <span>'+${weekIgnore.size()}+'건</span> <span>7일 이상 지연된 결재요청(상신)</span> </div> </div> <div id="sec_box" onclick="noCheck();"> <div> <span>'+noCheck+'건</span> <span>확인하지 않은 결재요청(수신)</span> </div> </div> <div id="sec_box" onclick="totalDoc();"> <div> <span style="color: purple">'+total+'건</span> <span>전체 결재 내역 보기</span> </div> </div>');
					// 페이징 버튼 추가
					if(pageNumber > 1) {
						var arr = pagingNumDef(pageNumber);
						for(var i = 0; i < arr.length; i++) {
							console.log(i);
							$("#pageNumber").append('<a class="choice" id="'+i+'">'+arr[i]+'</a>');
						}
					}
					
					$(".choice").bind('click' , function(){
						console.log($(this).attr('id'));
						pageChoice = $(this).attr('id');
						
					});
					
					if(total_doc.length == 0) {
						$("#sec_area").append('<div id="sec_box_lg" class="nullDoc">조회된 내역이 없습니다.</div>')
					} else {
						$.each(total_doc,function(index, doc){
							if(!doc.emp_id && !doc.approver_id) {
								// ref 행을 위한 if
								console.log("ref 실행");
								$("#sec_area").append('<div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq '+tmpList[0]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[1]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[2]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>'+doc.temp_title+'</div> <div>'+doc.app_title+'</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>'+doc.send_emp_name+'</p> <p>'+doc.send_dept_name+'</p> </div> <div>'+dateFormatting(doc.app_date)+'</div> </div>')
							} else if(!doc.approver_id && !doc.ref_emp_id){
								// sendList 행을 위한 if
								$("#sec_area").append('<div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq '+tmpList[0]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[1]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[2]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>'+doc.temp_title+'</div> <div>'+doc.app_title+'</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>'+doc.emp_name+'</p> <p>'+doc.dept_name+'</p> </div> <div>'+dateFormatting(doc.app_date)+'</div> </div>')															
							} else if(!doc.ref_emp_id && !doc.emp_id) {
								// noCheckList 행을 위한 if
								console.log("nocheck 실행");
								$("#sec_area").append('<div id="sec_box_lg"> <div> <c:choose> <c:when test="${doc.temp_id eq '+tmpList[0]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-alt-solid.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[1]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/품의서.svg"> </c:when> <c:when test="${doc.temp_id eq '+tmpList[2]+'}"> <img src="${pageContext.request.contextPath }/resources/img/approval/file-contract-solid.svg"> </c:when> <c:otherwise> <img src="${pageContext.request.contextPath }/resources/img/approval/file-solid.svg"> </c:otherwise> </c:choose> </div> <div>'+doc.send_temp_title+'</div> <div>'+doc.send_app_title+'</div> <div> <img src="${pageContext.request.contextPath }/resources/img/approval/user_circle.svg"> </div> <div> <p>'+doc.send_emp_name+'</p> <p>'+doc.send_dept_name+'</p> </div> <div>'+dateFormatting(doc.app_date)+'</div> </div>')
							}	
						})
					}
					
					
					
					
				}
			});
		};
		
		function pagingData(data , pageNumber , idx) {
			
		}
		
		// 페이징 카운트
		function pagingNumDef(pageNumber) {
			var arr = new Array();
			var pageNumber = pageNumber;
			for(var i = 0; i < pageNumber; i++) {
				arr[i] = i+1;
			}
			return arr;
		}
		// 날짜 정렬 최신순
		function sortDate(data) {
			var sendList = data['sendList'];
			var weekIgnore = data['refList'];
			var noCheck = data['noCheckList'];
			var temp = $.merge(sendList, weekIgnore);
			var total = $.merge(temp,noCheck);
			var result = total.sort(function(a, b){
				return new Date(dateFormatting(b['app_date'])) - new Date(dateFormatting(a['app_date']));
			});
			
			return total;
		}
		
		// 날짜 데이터 포맷팅 함수
		function dateFormatting(date){
			var month="";
			var year="";
			var day="";
			var resultDay="0";
			var resultMonth="0";
			if(date != null) {
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
			return null;
		}
	</script>
</body>
</html>