<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>

<style>
.checktoolbar{
	float:left;
}
.checktool{
	padding-right:250px;

}
.attendance_timer span{
	font-size:35px;
}
#top {
	width: 100%;
	height: 100px;
	border: 1px solid black;
}

table {
	width: 1000px;
	heigth: 500px;
}

table, tr, td {
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	margin: auto;
}

#top>span {
	font-size: 40px;
}

#mid {
	width: 100%;
	height: 500px;
	border: 1px solid black;
	margin: auto;
	text-align: center;
}

font {
	font-size: 20px;
}

#nowTimes{
	font-size:40px;
	font-weight:bold;
}

#calendar {
	width: 100%;
	height: 600px;
}

.checktool {
	padding-top: 20px;
}
.checktoolbar{
	float: left;
}
</style>

<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.js"></script>

</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<div class="conWrap">
					<h3>근태 현황</h3>
					<hr>
					<p>잘 나옵니까?</p>
					
					<div class="checktoolbar">
						<div id="checkwork" class="checktool" style="float:left">
							<div id="checkgowork">
							<input type="hidden" id="att_id" value="${time[0].att_id }">
							<input type="button" id="attrbtn1" disabled value="출근하기">
							<input id="gowork" type="text" value="${time[0].att_start }"readonly> <br> <br>
							</div>
							<div id="checkendwork">
							<input type="button" id="attrbtn2" disabled value="퇴근하기">
							<input id="exitwork" type="text" value="${time[0].att_end}" readonly>
							</div>
						</div>
						<div class="attendance_timer" style="float:left">
								<span id="nowTimes"></span>
						</div>
					</div>
					<div id="calendar"></div>
				</div>
				<!-- 달력 -->
			</article>
		</section>
	</div>

</body>

<script>



$(document).ready(function(){
	$(document).ready(function(){
		var gowork = $("#gowork").val();
		var exitwork = $("#exitwork").val();
		console.log(gowork);
		console.log(exitwork);
		if(gowork == ''){
			$("#attrbtn1").attr("disabled", false);
			$("#attrbtn2").attr("disabled", false);
		}else if(gowork != null && exitwork == ''){
			$("#attrbtn1").attr("disabled", true);
			$("#attrbtn2").attr("disabled", false);
		}else{
			$("#attrbtn1").attr("disabled", true);
			$("#attrbtn2").attr("disabled", true);
		}
		
	});	
});	


document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    headerToolbar: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,dayGridWeek,dayGridDay'
	    },
	    navLinks: true, // can click day/week names to navigate views
	    editable: true,
	    dayMaxEvents: true, // allow "more" link when too many events
	 	events: function(start, callback){
	 		$.ajax({
	 			url:"${pageContext.request.contextPath}/attendance/attCalanview",
	 			type:"POST",
	 			async:false,
	 			dataType:"JSON",
	 			success:function(data){
	 				var events = [];
	 				console.log(data);
	 					$(data).each(function(index, item){
	 						console.log(item.cal_title);
	 						var start = item.cal_start;
	 						var time = item.cal_time;
	 						var startdate = start +'T'+time;
	 						var title = item.cal_title;
	 						console.log(startdate);
	 						events.push({
	 							title: title,
	 							start: startdate
	 						});
	 					});
	 				console.log(events);
	 				callback(events);
	 				}
	 		});
	 	}
	  });
	  calendar.render();
	  
	  $("#attrbtn1").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/attendance/attStart.do",
				type : "POST",
				dataType: "JSON",
				success:function(data){
					console.log(data);
					$("#checkgowork").html('');
					$.each(data,function(index, att){
					var gowork = att.att_start;
					var attid = att.att_id;
					console.log(gowork);
					console.log(attid);
					$("#checkgowork").append('<input type="hidden" id="att_id" value="'+attid+'"> <input type="button" id="attrbtn1" disabled="true" value="출근하기"> <input id="gowork" type="text" value="'+gowork+'"readonly> <br> <br>');
					});
					alert("출근 처리 되었습니다.");
					calendar.refetchEvents();
				},
				error:function(){
					alert("출근처리되지 않았습니다.");
				},
			});	
		});

	$("#attrbtn2").click(function(){
		var attid = $("#att_id").val();
		console.log(attid);
		$.ajax({
			url : "${pageContext.request.contextPath}/attendance/attEnd.do",
			type : "POST",
			data : {"attid":attid},
			dataType: "JSON",
			success:function(data){
				$("#checkendwork").html('');
				$.each(data,function(index, att){
				var gowork = att.att_start;
				var attid = att.att_id;
				var endwork = att.att_end;
				$("#checkendwork").append('<input type="button" id="attrbtn2" disabled="true" value="퇴근하기"> <input id="exitwork" type="text" value="'+endwork+'"readonly>');
				});
					alert("퇴근 처리 되었습니다.");
					calendar.refetchEvents();
			},
			error:function(){
				alert("퇴근처리되지 않았습니다.")
			},
		});	
	});
	
	
	
    realTimer();
    // 이후 1초에 한번씩 시간을 갱신한다.
    setInterval(realTimer, 1000);
});


// 시간을 출력
function realTimer() {
	const nowDate = new Date();
	const year = nowDate.getFullYear();
	const month= nowDate.getMonth() + 1;
	const date = nowDate.getDate();
	const hour = nowDate.getHours();
	const min = nowDate.getMinutes();
	const sec = nowDate.getSeconds();
	document.getElementById("nowTimes").innerHTML = 
              year + "-" + addzero(month) + "-" + addzero(date) + "&nbsp;<br>" + hour + ":" + addzero(min) + ":" + addzero(sec);
}
    // 1자리수의 숫자인 경우 앞에 0을 붙여준다.
function addzero(num) {
	if(num < 10) { num = "0" + num; }
		return num;

}
    


</script>
</html>