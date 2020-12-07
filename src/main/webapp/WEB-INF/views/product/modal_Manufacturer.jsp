<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
	<div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      <div id="modal-1">제조사 등록<span class="close"> &times;</span></div>                                                          

        
	<form id="frm"> 
    	<div id="modal-2">
        <table>
        	<tr>
        		<td>&nbsp;제조사명(필수)</td>
        		<td>&nbsp;&nbsp;<input class="id"  type="text" name="name" id="manuName"></td>
        		
        	</tr>
      
        	<tr>
        		<td>&nbsp;대표자명(필수)</td>
        		<td>&nbsp;&nbsp;<input class="pwd" type="text"  name="CEO" id="manuCEO"></td>
        	</tr>
        </table>
        <h3 id="error1"></h3>
       <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
       </div>
</form>  
        <div><button class="mbtn" id="btn1">등록</button><button class="mbtn" onclick="cancle();">취소</button></div>
 		</div>
 		</div>
<script type="text/javascript">
    $('#btn1').on('click', function(){
    	var name  =  document.getElementById("manuName").value;
    	var ceo  =  document.getElementById("manuCEO").value;
    	
        var form = {
        		manu_name : name,
        		manu_ceo : ceo
        }

        $.ajax({
            url: "manuf",
            type: "POST",
            data: JSON.stringify(form),
            contentType: "application/json; charset=utf-8;",
            dataType: "json",
            success: function(data){
            
           		alert("등록되었습니다.");
          
            
           	
            },
            error: function(){
            	 alert("Manufacturer 등록 실패");
            }
        });
    });
    
    
    </script>
  

