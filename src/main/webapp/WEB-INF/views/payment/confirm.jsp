<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<style>
	#item-table {
		width:1200px;
		margin:0 auto;
		
	}

 	#itemArea {
 		background:whtie;
		color:black;
		border-top:1px solid gray;
		border-bottom:1px solid gray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
        font-size: small;
		width:1200px;
		height:30px;
 }

</style>
</head>
<body>
<div class="confirm">
<h2>주문/결제</h2>
<!-- 상품정보 테이블 -->
<div id="item-table">
	<table align="center">
		<tr id="itemArea">
			<th width="500px">상품정보</th>
			<th width="100px">판매처</th>
			<th width="100px">배송비</th>
			<th width="100px">수량</th>
			<th width="100px">주문금액</th>
		</tr>
		<!-- 상품정보 데이터 -->
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
<!-- 배송지 정보 -->
<h2>배송지정보</h2>
<div id="homeInfo">
	<div>배송지 선택
	<input type="radio">기본 배송지
	<input type="radio">신규 배송지
	</div>
	<table>
		<tr>이름</tr><br>
		<tr>번호</tr><br>
		<tr>주소</tr>
	</table>
</div>
<!-- 결제 수단 -->
<div>카카오페이
	<button>주문하기</button>
</div>
</div>
</body>
</html>