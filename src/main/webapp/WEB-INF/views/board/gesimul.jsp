<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리</title>
<style>

.gesimul_top span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
}

.gesimulList span{
	margin-left: 30px;
	font-size: 15px;
	font-weight: bold;
}

#t1 td:nth-child(1){
		height:50px;
		width: 200px;
		background-color:black;
		color:white;
		font-size:large;
		text-align:center;
}

#t1 td:nth-child(2){
		height: 50px;
		width: 700px;
		font-size:large;
		
	}
	
table, tr, td, th{
		border-collapse:collapse;
		border: 1px solid black;
	}
#t1 , #t2{ 
		width:100%;
		margin-top: 10px;
		
	}
.gesibtn{
	width: 100%;
	height: 60px;
	margin-top: 10px;
}
#gesiB {
	height: 50px;
	width: 100px;
	background:black;
	color:white;
	padding:0 auto;
}
input[class=br] {
	display: none;
	margin: 10px;
}

input[class=br]+label {
	/* display:inline-block;
   margin:-2px;
   width:110px;
   text-align:center; */
	margin-top: 5px;
	font-size: 15px;
	margin-left: 5px;
	background: white;
	outline: none;
	border: none;
	cursor: pointer;
	border: 1px solid #C4C4C4;
	border-radius: 3px;
	padding: 2px 10px;
}

input[class=br]+label:hover {
	background: #F2A71A;
	color: white;
}

input[class=br]:checked+label {
	background: #F2A71A;
	color: white;
}

input[class=br].active-color {
	color: #F2A71A;
}

input[class=br]:radio+label {
	background-image: none;
	background: #F2A71A;
	color: white;
}
</style>
</head>
<body>
	<div id="gesimul_wrap">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->
				<div class="conWrap">
					<div class="gesimul_top">
						<img
							src="${pageContext.request.contextPath }/resources/img/common/G4.png">
						<span>게시판 관리 > 게시물 관리</span>
					</div>
					<br>
					<!-- 게시물 검색 -->
					<div id="gesimul_mid">
						<form name='gesiS.do' method="get" action="gesiS.do">
							<table id="t1">
								<tr>
									<td>기간</td>
									<td><input class="br" id="br1" type="radio" name="gesiDate" value="1"> 
										<label class="br" for="br1">오늘</label>
										<input class="br" id="br2" type="radio" name="gesiDate" value="2"> 
										<label class="br" for="br2">3일</label> 
										<input class="br" id="br3" type="radio" name="gesiDate" value="3">
										<label class="br" for="br3">7일</label> 
										<input class="br" id="br4" type="radio" name="gesiDate" value="4"> 
										<label class="br" for="br4">1개월</label> 
										<input type="date" name="searchDate" >~<input type="date" name="searchDate2"></td>
								</tr>
								<tr>
									<td>게시판 선택</td>
									<td><select name="gesi_code" style="margin:10px">
											<option value="">전체</option>
											<option value="GS001">Q&A</option>
											<option value="GS002">상품 사용후기</option>
									</select></td>
								</tr>
								<tr>
									<td>게시글 찾기</td>
									<td><select style="margin:10px" name="searchType">
											<option value="gesi_title">제목</option>
											<option value="gesi_content">내용</option>
											<option value="user_name">작성자</option>
									</select> <input type="text" name="typeKeyword"/></td>
								</tr>
								<tr>
									<td>답변상태</td>
									<td><input type="radio" value="전체" style="margin:10px">전체 
									<input
										type="radio" value="답변 전">답변 전 <input type="radio"
										value="답변 완료">답변 완료</td>
								</tr>
								<tr>
									<td>댓글여부</td>
									<td><input type="radio" value="전체" style="margin:10px">전체 <input
										type="radio" value="있음">있음 <input type="radio"
										value="없음">없음</td>
								</tr>


							</table>
							<div class="gesibtn" align="center">
								<button type="submit" id="gesiB">검색</button>
							</div>
							
						</form>
					</div> 
					<hr>
					<!-- 게시물 검색목록 -->
					<div class="gesimulList">
						<span>전체 게시물 목록</span>
						<table id="t2" align="center">
							<tr>
								<th colspan="7" align="center" class="gesiListBtn">
									<button></button>
									<button></button>
									<button></button>
									<button></button>
								</th>
							</tr>
							<tr class="listName">
								<th><input type="checkbox"></th>
								<th class="qnaAnsYn">번호</th>
								<th class="qnaNote" >분류</th>
								<th class="qnaDate">제목</th>
								<th class="qnaDate">작성일</th>
								<th class="qnaDate">작성자</th>
								<th class="qnaDate">답변상태</th>
							</tr>
							<c:forEach var="ql" items="${ gesiList}" varStatus="status">
								<c:url value='/gesi.web?gesi_code=${ql.gesi_code}' var="gesiWebURl"/> 
								<tr class="listResult">
									<!-- 이부분에 함수 넣어서 출력해야됨   -->
									<td><c:out value="<input type='checkbox'/>" escapeXml="false"/></td>
									<td><c:out value="${ql.rn}" /></td>
									<td><c:out value="<a href='${gesiWebURl }' onclick='window.open(this.href)'  target=_blank>${ql.gesi_name }<a/>" escapeXml="false"/></td>
									<td><c:out value="${ql.gesi_title}" /></td>
									<td><c:out value="${ql.gesi_date}" /></td>
									<td><c:out value="${ql.user_name }" /></td>
									<td><c:out value="${ql.gesi_status}" /></td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 처리 -->
						<div class="paging-area" align="center">
							<c:if test="${paging.startPage != 1 }">
								<a href="${pageContext.request.contextPath }/board/gesiS.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}
								&searchDate=${reqList.starD }&searchDate2=${reqList.endD }&gesi_code=${reqList.gesi_code }&searchType=${reqList.searchType }&typeKeyword=${reqList.keyword}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a href="${pageContext.request.contextPath }/board/gesiS.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}
									&searchDate=${reqList.starD }&searchDate2=${reqList.endD }&gesi_code=${reqList.gesi_code }&searchType=${reqList.searchType }&typeKeyword=${reqList.keyword}">${p }</a>
								</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a href="${pageContext.request.contextPath }/board/gesiS.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}
								&searchDate=${reqList.starD }&searchDate2=${reqList.endD }&gesi_code=${reqList.gesi_code }&searchType=${reqList.searchType }&typeKeyword=${reqList.keyword}">&gt;</a>
							</c:if>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>
<script>
	

</script>
	

</body>
</html>