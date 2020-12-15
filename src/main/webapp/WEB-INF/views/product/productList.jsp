<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>상품관리 메인</title>

<style>

#top>div:nth-child(n) {
	float: left;
}

#top{
	width: 100%;
	height: 150px;
}

#top>span {
	color: #5E5E5E ;
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;

}
.conWrap{
	

}
table {
 width: 100%;
 border: 1px solid black;
	border-collapse: collapse;
}
td , th {
	height: 80px;

	border: 1px solid black;
}



</style>



</head>
<body>


	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

		<section class="contents">
			<article>

				<div class="conWrap">
				<div id="top">
							<img
								src="${pageContext.request.contextPath }/resources/img/common/G6.png">

							<span>상품관리 > 상품목록</span>
				</div>
				<div>
					<table>
						<tr>
						    <td>&nbsp;&nbsp;검색분류</td>
						    <td>&nbsp;<select>
						    <option>상품명</option>
						    <option>상품 코드 </option>
						    </select>&nbsp;<input type="text"></td>
						</tr>
						<tr>
						    <td>&nbsp;&nbsp;상품분류</td>
						    <td>&nbsp;<input type="text"></td>
						</tr>
					
						<tr>
						    <td>&nbsp;&nbsp;판매상태</td>
						    <td><input type="radio" >&nbsp;<label>전체</label>
						    <input type="radio" >&nbsp;<label>판매함</label>
						    <input type="radio" >&nbsp;<label>판매안함</label></td>
						</tr>
						
					
					</table>
				
				</div>
		
					<table>
						<tr style="width:100%;">
							<th>상품이미지</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>판매상태</th>
							<th>간략설명</th>
							<th>상세 설명</th>	
						</tr>
				<c:forEach var="menu" items="${list}">
						<tr>
						<td><img src="download?no=${menu.pro_id}" width="100%" height="100"></td> 
						
						<td>&nbsp;&nbsp;<a href='detail?no=${menu.pro_id}'>${menu.pro_name}</a> </td>
							<td>&nbsp;&nbsp;${menu.pro_price}</td>
							<td>&nbsp;&nbsp;${menu.pro_status}</td>
							<td>&nbsp;&nbsp;${menu.pro_summary}</td>
							<td>&nbsp;&nbsp;${menu.pro_detail}</td>
						
						</tr>
				</c:forEach>
					</table>
				</div>
			
			</article>
		</section>
	</div>





</body>
</html>