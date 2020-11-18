<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    </style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>


		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->

				<div class="conWrap">
					<h2>휴가 신청</h2>
					<hr>
					<div class="subtitle">
						<table>
							<tbody>
								<tr>
									<td>신청자</td>
									<td><input type="text" value="김경민"></td>
								</tr>
								<tr>
									<td>부서</td>
									<td><input type="text" value="인사과"></td>
								</tr>
								<tr>
									<td>휴가현황</td>
									<td><p>0일(계산수식 여기다 작성)</p></td>
								</tr>
								<tr>
									<td>종류</td>
									<td>
										<select name="category">
											<option value="category">연차</option>
											<option value="category">병가</option>
											<option value="category">교육</option>
											<option value="category">여름휴가</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>휴가기간</td>
									<td><input type="date"> - <input type="date"></td>
								</tr>
								<tr>
									<td>사유</td>
									<td><textarea style="width:80%;text-align:center;"  rows="10"></textarea></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>

			</article>
		</section>
	</div>
</body>
</html>