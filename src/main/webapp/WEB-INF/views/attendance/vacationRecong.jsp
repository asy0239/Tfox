<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
      table {
        width: 100%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
      }
      th, td {
        border-bottom: 1px solid #444444;
        padding: 10px;
        text-align: center;
      }
  
      #search{
      	float:right;
      }
 
    </style>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<h3>휴가 승인 페이지</h3>
				<hr>
				<div id="search">
					<!-- 서치바 들어갈 예정 검색 버튼 들어가야함 ajax  -->
					<select id="search_category">
						<option value="부서"> 부서
						<option value="이름"> 이름
					</select>
					<input type="text" placeholder="부서 검색 또는 이름 검색하기">
					<input type='button' value='검색' onclick='alert("안녕하세요")'/>

				</div>
				<div class="Recognition">
					<table>
						<tbody>
							<tr>
								<td>신청자</td>
								<td>부서</td>
								<td>신청날짜</td>
								<td>휴가종류</td>
								<td>기간</td>
								<td>상세</td>
								<td>상태</td>
							</tr>
							<!-- 이부분부터 반복문 사용해서 뽑을것 -->
							<tr>
								<td>박찬영</td>
								<td>인사</td>
								<td>2020-08-23</td>
								<td>연차</td>
								<td>2020-09-12 ~ 2020-09-13</td>
								<td>승인</td>
								<td>자세히보기</td>
							</tr>
							<tr>
								<td>박찬영</td>
								<td>인사</td>
								<td>2020-08-23</td>
								<td>연차</td>
								<td>2020-09-12 ~ 2020-09-13</td>
								<td>승인</td>
								<td>자세히보기</td>
							</tr>
							<tr>
								<td>박찬영</td>
								<td>인사</td>
								<td>2020-08-23</td>
								<td>연차</td>
								<td>2020-09-12 ~ 2020-09-13</td>
								<td>승인</td>
								<td>자세히보기</td>
							</tr>
							<tr>
								<td>박찬영</td>
								<td>인사</td>
								<td>2020-08-23</td>
								<td>연차</td>
								<td>2020-09-12 ~ 2020-09-13</td>
								<td>승인</td>
								<td>자세히보기</td>
							</tr>
						</tbody>
					<!-- 페이징 처리 들어갈 위치 -->
					</table>
				</div>
			</article>
		</section>
	</div>
</body>
</html>