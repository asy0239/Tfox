<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/product/modal.css">
	
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
		width: 150px;
	}
	.t{
		height: 15px;
		width: 90px;
	}
	.ph{
		padding-left: 15px;
		height: 340px;
		width: 300px;
	}
	
	
	 #photo{
	 
		height: 300px;
		width: 300px;
		border: 1px solid black;
	}
	 #photo1{
	 	height: 100px;
	 	width: 100px;
	 	border: 1px solid black;
	 }
</style>
</head>

<body>
	  <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	  <script   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
       <%@ include file="modal_Manufacturer.jsp" %>
       <%@ include file="modal_Supplier.jsp" %>
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
									<td class="ph"><div id="photo"></div></td>
									<td class="ph"><div id="photo1"></div></td>
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
										<c:forEach  var="supplier" items="${sup}">
											<option id="ownsu">${supplier.sup_name}</option>
										</c:forEach>
										</select>
										&nbsp;
										<button class="bt" id="myBtn2">등록</button>
					 				</td>
								</tr>
								
								
								<tr>
									
					
									<td>&nbsp;제조사</td>
									<td>
									&nbsp;
										<select name="made" id="made">
								
								<c:forEach var="manuf" items="${list}">
											<option id="ownmd">${manuf.manu_name}</option>
								</c:forEach>
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
										   <select id="select1" onchange="itemChange();">
										        <option>국내</option>
										        <option>국외</option>
										     
									        </select>
										&nbsp;
										 
									        <select id="select2">
									        	<option>선택하시오</option>
									            <option>서울특별시</option>
									            <option>부산광역시</option>
									            <option>대구광역시</option>
									            <option>인천광역시</option>
									            <option>광주광역시</option>
									            <option>대전광역시</option>
									            <option>울산광역시</option>
									            <option>세종특별자치시</option>
									            <option>경기도</option>
									            <option>강원도</option>
									            <option>충청북도</option>
									            <option>충청남도</option>
									            <option>전라북도</option>
									            <option>전라남도</option>
									            <option>경상북도</option>
									            <option>경상남도</option>
									            <option>제주특별자치도</option>
									        </select>
									</td>
								</tr>
							</table>
						
						</div>
					
					
					
					
					</div>
					<div id="buttom">
						
						
					</div>
				
				
				
				</div>
				
				   <script>
        function itemChange(){
                
          
            var korea = ["서울특별시","부산광역시","대구광역시","인천광역시","인천광역시"
            	,"광주광역시","대전광역시","울산광역시","세종특별자치시","경기도","강원도",
            	"충청남도","충청북도","전라북도","전라남도","경상북도","경상남도","제주특별자치도"];
           
            var abroad = ["아시아","아메리카","유럽","아프리카","오세아니아"];
            var selectItem = $("#select1").val();
            
           
            var changeItem;
              
            if(selectItem == "국내"){
              changeItem = korea;
            }
            else if(selectItem == "국외"){
              changeItem = abroad;
            }
            $('#select2').empty();
             
            for(var count = 0; count < changeItem.length; count++){                
                            var option = $("<option>"+changeItem[count]+"</option>");
                            $('#select2').append(option);
                        	
                        }
             
            }
            
        </script>
				
				
			</article>
		</section>
	</div>
	<script>
        const editor = new toastui.Editor({
            el:document.querySelector(".toast-custom-editor")
        });

        // Get the modal
        var modal = document.getElementById('myModal');
        var modal2 =  document.getElementById('myModal2');
        
        
        // Get the button that opens the modal
        var btn1 = document.getElementById("myBtn");
		var btn2 = document.getElementById("myBtn2");
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
      	var span2 = document.getElementById("ww");


        // When the user clicks on the button, open the modal 
        btn1.onclick = function() {
    	
            modal.style.display = "block";
        }
        
        btn2.onclick = function(){
        	modal2.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span2.onclick = function() {
        
            modal2.style.display = "none";
        }
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }else if(event.target == modal2){
            	modal2.style.display = "none";
            }
            
            
        }

        
    		function cancle(){
    			modal.style.display="none";
    		}
    		function cancle2(){
    			modal2.style.display="none";
    		}		
    
    </script>
    
   
  	
</body>
</html>