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
 
 #homeInfo {
 	width:1000px;
 	height:500px;
 	border:1px solid black;
 }

</style>
</head>
<body>
<div class="confirm">
<h2>주문/결제</h2>
	<from action="confirm" method="post">
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
<!-- 배송지 정보 테이블 -->
<h2>배송지정보</h2>
<div id="homeInfo">
	<table>
	<div>배송지 선택
	<input type="radio" name="배송지">기본 배송지
	<input type="radio" name="배송지">신규 배송지
	</div>
		<tr>
			<td width="200px">이름 </td>
			<td><input type="text" maxlength="13" name="userId" id="userId"></td>
		</tr>
		<tr>
			<td width="200px">번호 </td>
			<td><input type="text" maxlength="13" name="userId" id="userId"></td>
		</tr>
		<tr>
					<td>우편번호</td>
					<td><input type="text" name="zipCode"></td>
					<td><div id="ckZip">검색</div></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address1"></td>
					<td></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" name="address2"></td>
					<td></td>
				</tr>
	</table>
</div>
<!-- 결제 수단 -->
<div>카카오페이
	<input type="submit" value="주문하기">
</div>
				</from>
</div>

<script>

</script>
</body>
</html>