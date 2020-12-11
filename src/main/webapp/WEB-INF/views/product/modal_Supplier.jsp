<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<div id="myModal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      <div id="modal-3">제조사 등록<span class="close" id="ww"> &times;</span></div>                                                          

        

	<form name="joinuser" id="joinuser"> 
    	<div id="modal-4">
        <table>
        	<tr>
        		<td>&nbsp;공급사명(필수)</td>
        		<td>&nbsp;&nbsp;<input class="id"  type="text" name="name" id="supname">&nbsp;&nbsp;</td>
        		
        	</tr>
      
        	<tr>
        		<td>&nbsp;정산유형</td>
        		<td><input type="radio" name="kkm" value="Y" id="ra"class="rai">
        		<label for="ra">수수료형</label>
        		<input type="text" id="rate" >
        		<input class="rai" type="radio" name="kkm" value="N" id="status">
        		<label for="status">매입형</label></td>
        	</tr>
        </table>
        <h3 id="error1"></h3>
       <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
       </div>
</form>  
        <div><button class="mbtn" id="btn2">등록</button><button class="mbtn" onclick="cancle2();">취소</button></div>
 		</div>
 		</div>
<script type="text/javascript">


   
    	$('.rai').on('click',function(){
    		
    		var valueCheck = $('.rai:checked').val();
    		
    		if(valueCheck == 'N'){
    	
    			$('#rate').attr('disabled' , true);
    	
    			
    		}else{
    			$('#rate').removeAttr("disabled");
    			
    		}
    		
    		
    	});
    	
    	$('#btn2').on('click' , function(){
    		
    		var name = document.getElementById("supname").value;
    		var rate = document.getElementById("rate").value;
    		var status = document.getElementById('status').value;
    		var value = $('.rai:checked').val();
    		if(value == 'N'){
    			status = 'Y';
    			rate = 'null';
    			
    		}
    		
    		var form = {
    				sup_name : name,
    				sup_fee : rate,
    				sup_pur : status
    						
    		}
    		
    		$.ajax({
    			url: "sup",
				type: "POST",
				data: JSON.stringify(form),
				contentType: "application/json; charset=utf-8;",
				dataType: "json",
				success: function(data){
					alert("등록 되었습니다.");
	            	var txt = data.name;
	          		$('#supply').append(str = '<option>' + txt +'<option>');
	          		 $('#supply').children('option:last').remove();
	          		$('#supply option').each(function(){
	            		if($(this).val() == txt){
	            			$(this).attr("selected" , "selected");
	            		} 
	            	 });
	        		 var modal4 = document.getElementById('myModal2');
	          		 modal4.style.display = "none";
				},
				error: function(){
					alert("supplier 등록 실패");
					
				}
    			
    			
    		});	
    	});
    	    
    	
    	
    	
    	
    </script>
  
