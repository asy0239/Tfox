  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.hood-item-wrap{
		width: 1200px;
		margin: 0 auto;
	}
	
	.hood_item_img{
		width: 50%;
		float: left;
		height: 700px;
		
	}
	.hood_item_img a img{
		margin-top: 50px;
		margin-left: 30px;
		width: 540px;
		height: 600px;
	}
	 
	.hood_item_info{
		width: 50%;
		float: right;
		height: 700px;
	}
	.item_info_head{
		margin-top: 50px;
		margin-left: 30px;
		width: 540px;
		border-bottom: 1px solid;
		border-bottom-color: #a0a0a0;
	}
	#item_title {
		font-size: 25px;
		
	}
	.item_info_mid{
		margin-left: 30px;
		width: 540px;
		border-bottom: 1px solid;
		border-bottom-color: #a0a0a0;
	}
	#item_yoyag{
		color: #a0a0a0;
	}
	.itemI{
		margin-top: 30px;
	}
	.item_button{
		margin-left: 30px;
	}
	.itemDe{
		margin-left: 30px;
	}
	input[type=radio]{
   		display:none; 
  		margin:10px;
	}
	input[type=radio]+label{
    	margin-top:5px;
    	font-size: 15px;
    	margin-left: 5px;
    	background: white;
    	outline: none;
    	border: none;
    	cursor: pointer;
    	border: 1px solid #C4C4C4;
    	border-radius: 3px;
    	padding:2px 10px;
 	}
 	
 	input[type=radio]+label:hover {
    	background: #F2A71A;
    	color: white;
	}
	input[type=radio]:checked + label {
   		background: #F2A71A;
   		color: white;
	}
	
	
	.itemDe_menu a img {
		width: 30px;
		height: 30px;
	}
	#item_buy{
		width: 350px;
		height: 60px;
	}
	
	#item_jang{
		width: 50px;
		height: 60px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
	<div class="hood-item-wrap">
		<div class="hood_item_img">
			<a><img src="${pageContext.request.contextPath }/resources/img/webFront/item1.PNG"/></a>
		</div>
		<div class="hood_item_info">
			<form>
				<div class="item_info_head">

				<%-- 	<c:out value="${product.pro_name }" /><br> --%>
					<span>Size : S M L</span>
				</div>
				<div class="item_info_mid">
					<span id="item_yoyag">블라블라블라블라블라</span>
					
					<table class="itemI" cellpadding="20px">
						<tr>
							<td>판매가</td>
							<td>23000</td>
						</tr>
						<tr>
							<td>색상</td>
							<td>
								<select>
									<option>색상 선택</option>
									<option>블랙</option>
									<option>그레이</option>
									<option>네이비</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>사이즈</td>
							<td>
								<input class="item_size" id="itemS1" type="radio" name="itemSDate" value="s">
								<label class="item_size"for="itemS1">S</label>
								<input class="item_size" id="itemS2" type="radio" name="itemSDate" value="m">
								<label class="item_size"for="itemS2">M</label>
								<input class="item_size" id="itemS3" type="radio" name="itemSDate" value="l">
								<label class="item_size"for="itemS3">L</label>
							</td>
						</tr>
						<tr>
							<td>배송정보</td>
							<td><div>실시간 재고</div></td>
						</tr>
					</table>
				</div>
				<!-- 주문항목  -->
				<div class="itemDe">
					<table>
						<tr>
							<td>
								<div class="itemDe_menu">
									<span>마운틴 후드티S, 블랙</span> <a><img id="" src="${pageContext.request.contextPath }/resources/img/webFront/3.PNG"/></a> 	
									<br><input type="text" value="1"/> 
									<a><img id="" src="${pageContext.request.contextPath }/resources/img/webFront/2.PNG"/></a>
									<a><img id="" src="${pageContext.request.contextPath }/resources/img/webFront/1.PNG"/></a>								
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="item_button">
					<button id="item_buy">BUY NOW</button>
					<button id="item_jang">장바구니</button>
				</div>
			</form>
			
		</div>
	</div>

</body>
</html>