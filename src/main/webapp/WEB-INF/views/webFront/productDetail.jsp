  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		margin-top: 60px;
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
		margin-top: 35px;
		margin-left: 30px;
	}
	
	#proCL{
		width: 150px;
		height: 35px;
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
	
	
	#proDel {
		width: 30px;
		height: 30px;
	}
	
	
	#probtn{
		backgroung: white;
		
	}
 	#a td:nth-child(1){ width: 200px;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
	<div class="hood-item-wrap">
		<div class="hood_item_img">
			<a><img src="/tfox/webFront/fileList?pro_id=${pro_id }"/></a>
		</div>
		<div class="hood_item_info">
				<div class="item_info_head">
					<h3><c:out value="${pro_name }" /></h3> 
					<span>Size : <c:forEach var="ps" items="${ proSize }">
									<c:out value="${ps.pro_size}, " />
								</c:forEach>
					</span>
				</div>
				<div class="item_info_mid">
					<span id="item_yoyag"><c:out value="${pro_summary }" /></span>
					
					<table class="itemI" cellpadding="20px">
						<tr>
							<td>판매가</td>
							<td><c:out value="${pro_price }" /></td>
						</tr>
						<tr>
							<td>색상</td>
							<td>
								<select id="proCL">
									<c:forEach var="c" items="${ proColor }">
										<option><c:out value="${c.pro_color}색 " /></option>
								    </c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>사이즈</td>
							<td>
								<c:forEach var="ps" items="${ proSize}">
								<input class="item_size" id="<c:out value='${ps.pro_size}'/>" name="size" type="radio" value="<c:out value='${ps.pro_size}'/>">
								<label class="item_size"for="<c:out value='${ps.pro_size}'/>"><c:out value="${ps.pro_size}" /></label>
						
								</c:forEach>
								
							</td>
						</tr>
					</table>
				</div>
			<form name='cart.add' method="get" action="cart.add">
				<!-- 주문항목  -->
				<div class="itemDe">
					<table id="tbe">
						<tbody id ="a">
							<!-- 주문할 목록 추가  -->
						
						</tbody>
					</table>
				</div>
				<div class="item_button">
					<button id="item_buy">BUY NOW</button>
					<button id="item_jang" type="submit">장바구니</button>
				</div>
				
				<input type="hidden" value="<c:out value='${pro_name }'/>" name="name"/>
				<input type="hidden" value="<c:out value='${pro_price }'/>" name="price"/>
				
			</form>
			
		</div>
	</div>
		<script>
		$(function(){
			$(document).on("click","#decreaseQuantity",function(e){
			e.preventDefault();
			var stat = $('#numberUpDown').val();
			var num = parseInt(stat,10);
			num--;
			if(num<=0){
			alert('더이상 줄일수 없습니다.');
			num =1;
			}
			var Snum = String(num);
			$('#numberUpDown').val(Snum);
			});
			
			$(document).on("click","#increaseQuantity",function(e){
			e.preventDefault();
			var stat = $('#numberUpDown').val();
			var num = parseInt(stat,10);
			num++;

			if(num>20){
			alert('더이상 늘릴수 없습니다.');
			num=20;
			}
			var Snum = String(num);
			$('#numberUpDown').val(Snum);
			});
			});

	</script>
	<script>
		jQuery('#proCL').off().on('click', function() {
			var color = jQuery('#proCL option:selected').val();
			console.log(color);
	
				 $("input:radio[name=size]").off().on('click',function(){
						var size = $("input:radio[name=size]:checked").val()
						console.log(size);
						  $('#a').append("<tr><td>&nbsp;"
								  			+ "<c:out value='${pro_name }' /> "
						  					+ size + ", "+ color +   
						  					"&nbsp;</td> <td>"+
						  					"<input id='numberUpDown' name='pro_ea' value='1'></input>"+
						  					"<a href='#' id='increaseQuantity'>올림</a>"+
						  					"<a href='#' id='decreaseQuantity'>내림</a>"+
						  					"&nbsp;</td> <td>"+
						  					"<button type='button' id='probtn'>"+
						  					"<img id='proDel' src='${pageContext.request.contextPath }/resources/img/webFront/3.PNG'/>"
						  					+"</button>"+
						  					"<input type='hidden' name='size' value='"+size+"'/>"+
						  					"<input type='hidden' name='color' value='"+color+"'/>"+
						  					"</td>"
						  				+"</tr>" ); 
						

					  });
		});
	</script>
	
</body>
</html>