<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리</title>
<style>
.gesimul_top {
	width:
}

.gesimul_top span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
}

input[type=radio] {
	display: none;
	margin: 10px;
}

input[type=radio]+label {
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

input[type=radio]+label:hover {
	background: #F2A71A;
	color: white;
}

input[type=radio]:checked+label {
	background: #F2A71A;
	color: white;
}

input[type=radio].active-color {
	color: #F2A71A;
}

input[type=radio]:radio+label {
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
					<!-- 게시물 검색 -->
					<div id="gesimul_mid">
						<form>
							<table id="t1">
								<tr>
									<td>기간</td>
									<td><input class="br" id="br1" type="radio"
										name="gesiDate" value="1"> <label class="br" for="br1">오늘</label>
										<input class="br" id="br2" type="radio" name="gesiDate"
										value="2"> <label class="br" for="br2">3일</label> <input
										class="br" id="br3" type="radio" name="gesiDate" value="3">
										<label class="br" for="br3">7일</label> <input class="br"
										id="br4" type="radio" name="gesiDate" value="4"> <label
										class="br" for="br4">1개월</label> <input type="date">~<input
										type="date"></td>
								</tr>
								<tr>
									<td>게시판 선택</td>
									<td><select>
											<option>전체</option>
											<option>Q&A</option>
											<option>상품 사용후기</option>
											<option>블라블라</option>
									</select></td>
								</tr>
								<tr>
									<td>게시글 찾기</td>
									<td><select>
											<option>제목</option>
											<option>내용</option>
											<option>작성자</option>
											<option>상품명</option>
											<option>아이디</option>
									</select> <input type="text" /></td>
								</tr>
								<tr>
									<td>답변상태</td>
									<td><input type="radio" value="전체">전체 <input
										type="radio" value="답변 전">답변 전 <input type="radio"
										value="답변 완료">답변 완료</td>
								</tr>
								<tr>
									<td>댓글여부</td>
									<td><input type="radio" value="전체">전체 <input
										type="radio" value="있음">있음 <input type="radio"
										value="없음">없음</td>
								</tr>


							</table>
							<button>검색</button>
						</form>
					</div>
					<!-- 게시물 검색목록 -->
					<div>
						<table align="center">
							<tr>
								<th colspan="6" align="center" class="title">전체 게시물 목록</th>
							</tr>
							<tr class="listName">
								<th class="qnaAnsYn">번호</th>
								<th class="qnaNote" colspan="4">분류</th>
								<th class="qnaDate">제목</th>
								<th class="qnaDate">작성일</th>
								<th class="qnaDate">작성자</th>
								<th class="qnaDate">답변상태</th>
							</tr>
							<c:forEach var="ql" items="${ requestScope.list }">
								<tr class="listResult">
									<!-- 이부분에 함수 넣어서 출력해야됨   -->
									<td><c:out value="${ ql.qnaAnsYn }" /></td>
									<td colspan="4"><c:out value="${ ql.qnaNote }" /></td>
									<td><c:out value="${ ql.qnaDate}" /></td>
									<td><c:out value="${ ql.qnaDate}" /></td>
									<td><c:out value="${ ql.qnaDate}" /></td>
									<td><c:out value="${ ql.qnaDate}" /></td>
								</tr>
							</c:forEach>
						</table>
						<div class="paging-area" align="center">
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>


</body>
</html>