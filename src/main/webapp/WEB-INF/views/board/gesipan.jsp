<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.gesipan_top span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
	
}


table, tr, td, th{
		border-collapse:collapse;
		border: 1px solid black;
	}
 
 #t2{ 
		width:100%;
		margin-top: 10px;
		
	}
	
.gesimulList span {
	margin-left: 30px;
	font-size: 20px;
	font-weight: bold;
	
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
					<div class="gesipan_top">
						<img
							src="${pageContext.request.contextPath }/resources/img/common/G4.png">
						<span>게시판 관리 > 게시판 설정</span>
						
						
						<div class="gesimulList" style="margin-top: 50px;">
						<span>전체 게시판 목록</span>
						<table id="t2" align="center">
							<tr class="listName">
								<th class="qnaDate">게시판 제목</th>
								<th class="qnaDate">게시물 관리</th>
								<th class="qnaDate">표시여부</th>
							</tr>
							<c:forEach var="p" items="${ pan}" varStatus="status">
								<c:url value='/board/gesipan2?gesi_code=${p.gesi_code}' var="gesiWebURl"/>
								<c:set var="dd" value="'this.href', 'width=430,height=500,location=no,status=no,scrollbars=no'"/>
								<tr class="listResult">
									<!-- 이부분에 함수 넣어서 출력해야됨   -->
									<td><c:out value="<a href='${gesiWebURl }' onclick='window.open(${dd })'>${p.gesi_name }<a/>" escapeXml="false"/></td>
									<td><button>글보기</button>&nbsp;&nbsp;<button>글삭제</button>&nbsp;&nbsp;<button>공지글</button>&nbsp;&nbsp;<button>고정글</button></td>&nbsp;&nbsp;
									<td><c:out value="${p.gesi_status}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			</article>
		</section>
	</div>
</body>
</html>