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
	
	.checktool{
	padding-top:20px;
	} 
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<section class="contents">
			<article>
				<div class="conWrap"> 
               		<div id="vacSelect">
               			휴가 설정
               			<hr>
               			<div id="vacOnOff">
               				<input type="radio" name="vacOnOff" value="ON" checked="checked">사용함
               				<input type="radio" name="vacOnOff" value="OFF">사용안함
               			</div>
               			<div>
               				<input type="text" value="1">입력
               				
               			
               			</div>
               		</div>
               		
                </div>
                
			</article>
		</section>
	</div>

</body>
</html>