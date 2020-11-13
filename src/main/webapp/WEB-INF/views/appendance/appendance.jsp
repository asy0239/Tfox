<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
 <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.js"></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
<style>
	#top{
		width: 100%;
		height: 100px;
		border: 1px solid black;
		
	}
	table {
	
		width: 1000px;
		heigth: 500px;
		
		
	}
		table,tr, td {
		border-collapse:collapse;
		border: 1px solid black;
		text-align:center;
		margin: auto;
		
	}

	
	
	#top >span{
		font-size: 40px;
	}
	
	#mid {
		width: 100%;
		height: 500px;
		border: 1px solid black;
		margin: auto;
		text-align:center;
	}

	font {
		font-size: 20px;
	}
	
	#calendar {
		width:100%;
		height:600px;
	} 
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<section class="contents">
			<article>
				<div class="conWrap"> 
                		<h3>근태 현황</h3>
                		<hr>
                		<p>잘 나옵니까?</p>
                		<div class="checktool">
                			<button>출근</button>
                			<input type="text">
                			<br>
                			<button>퇴근</button>
                			<input type="text">
                		</div>
     				   <div id='calendar'></div>
                </div>
                
			</article>
		</section>
	</div>

</body>
</html>