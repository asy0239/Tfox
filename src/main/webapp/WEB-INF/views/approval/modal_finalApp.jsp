<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/modal.css"> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/icon_font.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/approval/jquery.transfer.css">
<script src="${pageContext.request.contextPath }/resources/js/approval/jquery.transfer.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="modal" id="my_modal3">
		<div class="modal-content">
			<div id="orga_title">
				조직도
			</div>
			<div class="transfer3">
			</div>
			<div id="close_btn" onclick="closeModal3();">닫기</div>
			<div id="save_btn" onclick="saveModal();"></div>
		</div>
		
	</div>
	
	<script>
		var emp = '${empList}';
		var empJson = JSON.parse(emp);
			var settings3 = {
				    // data item name
				    itemName: "employeeName",
				    // group data item name
				    groupItemName: "groupName",
				    // group data array name
				    groupArrayName: "groupData",
				    // data value name
				    valueName: "value",
				    // tab text
				    tabNameText: "items",
				    // right tab text
				    rightTabNameText: "selected items",
				    // search placeholder text
				    searchPlaceholderText: "search",
				    // items data array
				    dataArray: empJson,
				    // group data array
				    groupDataArray: empJson,
				    callable: function (items) {
				      // your code
				      var choiceValue = "";
				      var choiceValueId = "";
				      for(var i = 0; i < items.length; i++) {
				    	  if(i==0) {
				    		  choiceValue += items[i].employeeName;	
				    		  choiceValueId += items[i].value;
				    	  } else {
				    		  choiceValue += " > ";
				    		  choiceValueId += ", ";
					    	  choiceValue += items[i].employeeName;		
					    	  choiceValueId += items[i].value;
				    	  }
				      }
			    	  var finalApp = choiceValue;
			    	  var finalAppId = choiceValueId;
			    	  $(".finalApp").attr('value' , finalApp);
			    	  $("#finalAppHidden").attr('value', finalAppId);
			    	  $("#signTd1").children("#txt").attr('value', finalApp);

					  choiceValue = "";
					  choiceValueId = "";
					  
				    }
				};

				var myTransfer3 = $(".transfer3").transfer(settings3);
				
				myTransfer3.getSelectedItems();
		
			


	</script>
</body>
</html>