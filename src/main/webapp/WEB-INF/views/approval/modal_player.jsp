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
	<div class="modal" id="my_modal2">
		<div class="modal-content">
			<div id="orga_title">
				조직도
			</div>
			<div class="transfer2">
			</div>
			
			<div id="close_btn" onclick="closeModal2();">닫기</div>
			<div id="save_btn" onclick="saveModal();"></div>
		</div>
		
	</div>
	
	<script>
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
			var settings2 = {
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
				    		  choiceValue += ", ";
				    		  choiceValueId += ", ";
					    	  choiceValue += items[i].employeeName;		
					    	  choiceValueId += items[i].value;
				    	  }
				      }
				    	  
			    	  var player = choiceValue;
			    	  var playerEmpId = choiceValueId;
			    	  $(".player").attr('value', player);
			    	  $("#playerHidden").attr('value', playerEmpId);
				    	  
					  
					  choiceValue = "";
					  choiceValueId = "";
					  
				    }
				};

				var myTransfer2 = $(".transfer2").transfer(settings2);
				
				myTransfer2.getSelectedItems();
		
			


	</script>
</body>
</html>