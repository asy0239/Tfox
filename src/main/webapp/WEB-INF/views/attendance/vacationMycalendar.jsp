<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

      
      $(function() {
      	var base = "${pageContext.request.contextPath}";
      	
      	//풀캘린더 로드
          $("#calendar").fullCalendar({
          	defaultView			: 'month',	//기본 뷰 설정
         	    header				: {
         	    						left	: 'today', // month/week뷰 변환 버튼
         	    						center	: 'prev, title, next',
         	    						right  	: 'month,agendaWeek,agendaDay'
         							    
         		},
         		fixedWeekCount            : 'variable',
          	defaultDate			: moment(),//현재를 기준으로 생성
          	nextDayThreshold	: "00:00:00",
          	defaultAllDay		: false,
          	editable			: true,
          	eventLimit			: true,//이벤트 개수가 표시칸을 벗어나면 더보기 버튼 생성
          	
          	//이벤트 목록 불러오기
           	events				: function(start, end, timezone, callback) {
           								
					                    	$.ajax({
					                    		url			:base+"/schAjax/id",
					                    		type		:"get",
					                    		async		: false,
					                    		traditional : true,
					                    		data: {id 		: loginId
					                    			  ,start	: start.format()
					                    			  ,end		: end.format() 
					                    		},
					                    		dataType:"json",
					                    		success:function(json){
					                    			
					        						events = [];
					        						$(json).each(function() {
					        							
					        							//allDay data processing
					        							var yn = false;
					        							var end = $(this).prop('end');
					        							var	start = $(this).prop('start');
					        							
					        							if($(this).attr('allDay') == "on"){
					        								yn = true;
					        								if (start !== end) {
							                    	              end = moment(end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
							                    	        }
					        							}
					        							
					        							//events 객체에 주입
					        							events.push({
					        								id	  			: $(this).attr('id'),
					        								title 			: $(this).attr('title'),
					        								start 			: start,
					        								end	  			: end,
					        								allDay			: yn,
					        								repeat 			: $(this).attr('repeat'),
					        								endRepeat 		: $(this).attr('endRepeat'),
					        								content			: $(this).attr('content'),
					        								security		: $(this).attr('security'),
					        								stat			: $(this).attr('stat'),
					        								writer 			: $(this).attr('writer'),
					        								writeDate		: $(this).attr('writeDate'),
					        								modifyDate		: $(this).attr('modifyDate'),
					        								backgroundColor	: $(this).attr('backgroundColor'),
					        								writerName		: $(this).attr('writerName'),
					        								//캘린더에서 데이터를 받을때는 groupName으로 받고 서버로 보낼때는 groupCode로 보냄
					        								groupName		: $(this).attr('groupName')
					        							});
					        						});
					        						
					        						//월, 년 변경되었거나 자료 변경에 따라 다시 불러오기
													callback(events);
													console.log(events)
					                    		}
           							});
           	},
    </script>
<body>
	<div id="calendar"></div>
</body>
</html>