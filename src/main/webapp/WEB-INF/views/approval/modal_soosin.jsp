<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="modal" id="my_modal1">
		<div class="modal-content">
			<div id="orga_title">
				조직도
			</div>
			<div class="transfer1">
			</div>
			<div id="close_btn" onclick="closeModal1();">닫기</div>
			<div id="save_btn" onclick="saveModal();"></div>
		</div>
	</div>
	
	<script type="text/javascript">

			var emp = '${empList}';
			var empJson = JSON.parse(emp);
			
			var employeeName = [
		    {
		        "language": "jQuery",
		        "value": 122
		    },
		    {
		        "language": "AngularJS",
		        "value": 132,
		        "disabled": true
		    },
		    {
		        "language": "ReactJS",
		        "value": 422
		    },
		    {
		        "language": "VueJS",
		        "value": 232
		    },
		    {
		        "language": "JavaScript",
		        "value": 765
		    },
		    {
		        "language": "Java",
		        "value": 876
		    },
		    {
		        "language": "Python",
		        "value": 453
		    },
		    {
		        "language": "TypeScript",
		        "value": 125,
		        "selected": true
		    },
		    {
		        "language": "PHP",
		        "value": 633
		    },
		    {
		        "language": "Ruby on Rails",
		        "value": 832
		    }
		];

		var groupData = [
		    {
		        "groupName": "JavaScript",
		        "groupData": [
		            {
		                "employeeName": "jQuery",
		                "value": 122
		            },
		            {
		                "employeeName": "AngularJS",
		                "value": 643
		            },
		            {
		                "employeeName": "ReactJS",
		                "value": 422
		            },
		            {
		                "employeeName": "VueJS",
		                "value": 622
		            }
		        ]
		    },
		    {
		        "groupName": "Popular",
		        "groupData": [
		            {
		                "employeeName": "JavaScript",
		                "value": 132
		            },
		            {
		                "employeeName": "Java",
		                "value": 112
		            },
		            {
		                "employeeName": "Python",
		                "value": 124
		            },
		            {
		                "employeeName": "TypeScript",
		                "value": 121
		            },
		            {
		                "employeeName": "PHP",
		                "value": 432
		            },
		            {
		                "employeeName": "Ruby on Rails",
		                "value": 421
		            }
		        ]
		    }
		];
			var settings1 = {
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
				      var choiceValue = "";
				      var choiceValueId = "";
				      for(var i = 0; i < items.length; i++) {
				    	  if(i==0) {
				    		  choiceValue += items[i].employeeName;	
				    		  choiceValueId += items[i].value;
				    	  } else {
				    		  choiceValue += ", ";
				    		  choiceValueId += ", ";
					    	  choiceValue += items[i].employeeName;		
					    	  choiceValueId += items[i].value;
				    	  }
				      }
			    	  var susin = choiceValue;
			    	  var susinEmpId = choiceValueId;
			    	  $(".susin").attr('value' , susin);
			    	  $("#soosinHidden").attr('value', susinEmpId);
			    	  
				    	  					  
					  choiceValue = "";
					  
					  
					  
				    }
				};

				var myTransfer1 = $(".transfer1").transfer(settings1);
				
				myTransfer1.getSelectedItems();			


	</script>
</body>
</html>