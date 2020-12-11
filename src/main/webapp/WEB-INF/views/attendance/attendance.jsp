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
						<div class="checktool" style="float:left">
							<button id="attbtn1">출근</button>
							<input id="go" type="text"> <br> <br>
							<button>퇴근</button>
							<input id="exit" type="text">
						</div>
						<div class="attendance_timer" style="float:left">
								<span id="nowTimes"></span>
						</div>
					</div>
				</div>
				<div>
				<!-- 메인 출력단 -->
					
				</div>
			</article>
		</section>
	</div>

</body>

<script>
document.addEventListener("DOMContentLoaded", function() {
    // 시간을 딜레이 없이 나타내기위한 선 실행
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
    
$(document).ready()
    //출근 버튼 클릭시 시간 가지고오기
    $(function(){
    	$("#attbtn1").click(function(){
    		$.ajax({
    			url : "${pageContext.request.contextPath}/attendance/attStart.do",
    			type : "POST",
    			dataType: "JSON",
    			success:function(data){
    				console.log(data)
    				$("#go").val();
    				if("#go" != null){
    					$("#attbtn1").attr('disabled');
    				}
    			},
    			error:function(){
    				alert("출근처리되지 않았습니다.")
    			},
    		});	
    	});
    });


</script>
</html>