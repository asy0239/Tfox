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
		border: 1px solid black;
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

		
		height:250px;
		
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
									<td> &nbsp; 상품명</td>
									<td colspan="2"><input type="text" >
								</td>
								</tr>
								<tr>
									<td> &nbsp; 판매가</td>
									<td colspan="2"><input type="text"></td>
									
								</tr>
								<tr>
									<td> &nbsp; 자체 상품코드</td>
									<td colspan="2"><input type="text"></td>
									
								</tr>
								<tr>
									<td> &nbsp; 상품 요약설명</td>
									<td colspan="2"><input type="text"></td>
									
								</tr>
								<tr>
									<td> &nbsp; 상품 분류</td>
									<td colspan="2">
										<select name="product" id="product">
											<option value="hot">모자</option>
											<option value="dress">원피스</option>
											<option value="shirt">반팔</option>
											<option value="padding">패딩</option>
											<option value="coat">코트</option>	
										</select>
									</td>
									
								</tr>
								<tr>
									<td> &nbsp; 상품 상세설명</td>
									<td colspan="2" ><div class="toast-custom-editor"></div></td>
									
								</tr>
								<tr>
									<td> 이미지</td>
									<td></td>
									<td></td>
								</tr>
							</table>		
						
						
						
						</div>
				
					</div>
						
					<div id="mid-2" class="mid">
					<img src="${pageContext.request.contextPath }/resources/img/product/mid-2.png">	
						<div>
							
						</div>
					</div>
					<div id="mid-3" class="mid">
					<img src="${pageContext.request.contextPath }/resources/img/product/mid-3.png">	
						<div>
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
</body>
</html>