<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>내 휴가 현황</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.js"></script>
</head>
<style>
.maintesttop span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
}
</style>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<div class="conWrap">
					<div class="maintesttop">
					<span>근태관리 > 내휴가현황</span>
				</div>
				<hr>
				<div><a href="${pageContext.request.contextPath }/attendance/vacationMypage">내 휴가 현황&nbsp;&nbsp;</a><a href="${pageContext.request.contextPath }/attendance/vacationMycalendar"><span>내 휴가 캘린더</span></a></div>
				<br>	
				<div id="calendar"></div>
				</div>
			</article>
		</section>
	</div>
</body>

<script>
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
	 			url:"${pageContext.request.contextPath}/attendance/vacationView",
	 			type:"POST",
	 			async:false,
	 			dataType:"JSON",
	 			success:function(data){
	 				var events = [];
	 					$(data).each(function(index, item){
	 						var start = item.vacapl_start
	 						var end = item.vacapl_end
	 						var title = item.vactype_name
	 						console.log(start);
	 						console.log(end);
	 						console.log(title);
	 						events.push({
	 							title: title,
	 							start: start,
	 							end: end
	 						});
	 					});
	 				console.log(events);
	 				callback(events);
	 				}
	 		});
	 	}
	  });
	  calendar.render();
});

</script>
</html>