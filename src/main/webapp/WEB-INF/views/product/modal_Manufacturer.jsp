<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	  .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 500px; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
          	 
         
        }
        
     
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        #modal-1{
        	height:50px;
        	width: 100%;
        }
        #modal-2{
           height:130px; 
        	width: 100%;
        }
        .mbtn{
        	border: 1px solid black;
        }
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>	
	<div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      <div id="modal-1">제조사 등록<span class="close"> &times;</span></div>                                                          

        
    	<form  method="post" name="form1">
    	<div id="modal-2">
        <table>
        	<tr>
        		<td>&nbsp;제조사명(필수)</td>
        		<td>&nbsp;&nbsp;<input id="manuName" name="name" type="text"></td>
        		
        	</tr>
      
        	<tr>
        		<td>&nbsp;대표자명(필수)</td>
        		<td>&nbsp;&nbsp;<input type="text" id="manuCEO" name="CEO"></td>
        	</tr>
        </table>
        <h3 id="error1"></h3>
       
        <div><button class="mbtn" id="inputBt" onclick="callByAjax();">등록</button><button class="mbtn" onclick="cancle();">취소</button></div>
       </div>
        </form>
 		</div>
 		</div>
   
	<script>
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];                                          




    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
		console.log("눌림 ");
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
		function cancle (){
			modal.style.display="none";
			
		}
		
		/* $(function(){
			$("#inputBt").click(function(){
				var inputValName = $("#manuName").val();
				var inputValCEO =$("#manuCEO").val();
				if(!inputValName && !inputValCEO ){
					var error1 = document.getElementById("error1");
					error1.style.color ="red";
				   error1.innerHTML = "제조업체 혹은 대표자명을 입력해주세요";   
				}else{
						$.ajax({
							url:base+"/rest/id",
							type:"post",
							dataType:"json",
							data:{
								valName : inputValName,
								valMenu : inputValCEO
							}
							success:function(json){
								console.log(json);
							}
						
						})
				}
			});
		});
	 */
	 
	 function callByAjax(){
		var form = documnet.form1;
		var name = form.name;
		var ceo = form.CEO;
		
		var action = form.action;
		
		$.post(
			action,
			{
				name : '경민',
				CEO : '성윤'
				
			},
			function(data){
				$('#ownmd').append(data);
			},
			'html'
		
		);
	 }
		
	</script>
</body>
</html>