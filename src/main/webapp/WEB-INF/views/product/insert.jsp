<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<title>상품관리 메인</title>
<style>
	#top > div:nth-child(n)  {
	float: left;
	
	}
	#top > div:nth-child(1){
		
	}
	#top > span{
		position: relative;
		bottom: 8px;
	 	margin-left: 30px; 
		font-size:25px;
		font-weight: bold;
	}
	#mid-1{
		width: 1000px;
		height: 950px;
		margin-top: 100px;
		border: 1px solid black;
		margin-left: 40px;
		padding-bottom:10px;
	}
	#mid-2{
		width: 1000px;
		height: 254px;
		margin-top: 100px;
		border: 1px solid black;
		margin-left: 40px;
		padding-bottom:10px;
	}
	
	#mid-3{
		
		width: 1000px;
		height: 380px;
		margin-top: 100px;
		border: 1px solid black;
		margin-left: 40px;
		padding-bottom:10px;
	}
	.mid > div:nth-child(2){
	    margin-left: 50px;
	    margin-top: 10px;
		
		width:900px;
		
	}
	#mid-1 >div{
		
		height: 890px
	}
	#mid-2 >div{
		height: 194px
	}
	#mid-3 >div{
		height: 320px
	}
	table, th, td {
	  border-collapse:collapse;
	  border: 1px solid black;
	  
	}
	
	tr > td:nth-child(1) {
		height: 45px;
		width:130px;
		
	
	}
	table  tr:nth-child(7){

		height:290px;
	}
		table  tr:nth-child(6){

		height:280px;
	}	
	input {
		height: 20px;
		width: 300px;
	}
	#mid-2 table td:nth-child(2) {
		height: 50px;
		width: 700px;
	}
		#mid-3 table td:nth-child(2) {
		height: 50px;
		width: 700px;
	}
	
	.m2 {
		height: 50px;
	}
	
	#buttom{
		height: 200px;
	}
	button{
		height:30px;
		width:50px;
		background:white;
		 
		border: 2px solid #555555;
	}
	.bt{
		border: 1px solid black;
	
	}
	#date{
		height: 30px; 
		width: 100px;
	}
	.t{
		height: 15px;
		width: 90px;
	}
	
	
	
</style>
</head>

<body>
	
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
			<section class="contents">
			<article>
				<div class="conWrap" >
				
					<div id="top">
						<img src="${pageContext.request.contextPath }/resources/img/common/G6.png">	
						
						<span>상품관리 > 상품등록</span>
					</div>
					<div id="mid-1" class="mid">
					<img src="${pageContext.request.contextPath }/resources/img/product/mid-1.png">
						<div>
							<table>
								<tr>
									<td> &nbsp;  상품명</td>
									<td colspan="2"> &nbsp; &nbsp;<input type="text" >
								</td>
								</tr>
								<tr>
									<td> &nbsp; 판매가</td>
									<td colspan="2"> &nbsp; &nbsp;<input type="text"></td>
									
								</tr>
								<tr>
									<td> &nbsp; 자체 상품코드</td>
									<td colspan="2"> &nbsp; &nbsp;<input type="text"></td>
									
								</tr>
								<tr>
									<td> &nbsp; 상품 요약설명</td>
									<td colspan="2"> &nbsp; &nbsp;<input type="text"></td>
									
								</tr>
								<tr>
									<td> &nbsp; 상품 분류</td>
									<td colspan="2">
										 &nbsp; &nbsp;
										 <select name="product" id="product">
											<option value="hot">모자</option>
											<option value="dress">원피스</option>
											<option value="shirt">반팔</option>
											<option value="padding">패딩</option>
											<option value="coat">코트</option>	
										</select>
										색상&nbsp;<input type="text" class="t"> 사이즈&nbsp;<input type="text" class="t">
					
									</td>
									
								</tr>
								<tr>
									<td> &nbsp; 상품 상세설명</td>
									<td colspan="2" ><div class="toast-custom-editor"></div></td>
									
								</tr>
								<tr>
									<td> &nbsp;이미지</td>
									<td></td>
									<td></td>
								</tr>
							</table>		
						
						
						
						</div>
				
					</div>
						
					<div id="mid-2" class="mid">
					<img src="${pageContext.request.contextPath }/resources/img/product/mid-2.png">	
						<div>
							<div class="m2"></div>
							<table>
								<tr>
									<td>&nbsp;공급가</td>
									<td>&nbsp;&nbsp;<input type="text"></td>
								</tr>
								<tr>
									<td>&nbsp;소비자가</td>
									<td>&nbsp;&nbsp;<input type="text"></td>
								</tr>
								
							</table>
						</div>
					</div>
					<div id="mid-3" class="mid">
					<img src="${pageContext.request.contextPath }/resources/img/product/mid-3.png">	
						<div>
						<div class="m2"></div>
						
							<table>
								<tr>
									<td>&nbsp;공급사</td>
									<td>
									&nbsp;
										<select name="supply" id="supply">
											<option id="ownsu">자체공급</option>
										</select>
										&nbsp;
										<button class="bt">등록</button>
					 				</td>
								</tr>
								
								
								
								<tr>
									<td>&nbsp;제조사</td>
									<td>
									&nbsp;
										<select name="made" id="made">
											<option id="ownmd">자체제작</option>
										</select>
										&nbsp;
										<button class="bt" id="myBtn">등록</button>
									</td>
								</tr>
								<tr>
									<td>&nbsp;제조일자</td>
									<td> &nbsp;&nbsp;<input type="date" id="date"></td>
								</tr>
								<tr>
									<td>&nbsp;원산지</td>
									<td>
									&nbsp;
										<select name="" id="">
											<option id="">국내</option>
											<option id="">국외</option>
											<option id="">실내</option>
										</select>
										&nbsp;
										<select name="" id="">
											<option id="">국내선택</option>
										</select>
									</td>
								</tr>
							</table>
						
						</div>
					
					
					
					
					</div>
					<div id="buttom">
						
						
					</div>
				
				
				
				</div>
			</article>
		</section>
	</div>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        const editor = new toastui.Editor({
            el:document.querySelector(".toast-custom-editor")
        });
        
        
  
    </script>
    <%@ include file="modal_Manufacturer.jsp" %>
</body>
</html>