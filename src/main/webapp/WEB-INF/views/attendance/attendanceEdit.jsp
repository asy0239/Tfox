<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.timeall{
	
	float:left;
	padding-left:20px;
}
.timeall div{
	padding-left:20px;
	width: 30px; 
	height: 30px; 

	
}

</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
			<div class="conWrap">
			<form id="attendsetOn" method="post" action="atdOnOff">
				<div class="main_top">
					<span>근태 사용 여부</span>
					<div class="abcd">
						<label><input type="radio" name="time_use_flag" value="Y" <c:if test="${atdYN[0].attdb_yn eq 'Y'}">checked</c:if>> 사용함</label>
						<label><input type="radio" name="time_use_flag" value="N" <c:if test="${atdYN[0].attdb_yn eq 'N'}">checked</c:if>> 사용 안 함</label>
					</div>
				</div>
				<div class="main_top">
					<span>52시간 근무 적용 여부</span>
					<div class="abcd">
						<label><input type="radio" name="time_52hours" value="Y" <c:if test="${atdYN[0].attdb_oe eq 'Y'}">checked</c:if>> 사용함</label> 
						<label><input type="radio" name="time_52hours" value="N" <c:if test="${atdYN[0].attdb_oe eq 'N'}">checked</c:if>> 사용 안 함</label>
					</div>
				</div>
				<div class="bt_left">
					<button type="button" onclick="setWorkTimeConfig();">저장</button>
				</div>
			</form>


				<div class="main top">
				<span>출퇴근 시간 설정</span>
				</div>
					<div class="timeall" style="float:left"> 
						<div class="timeMon" style="float:left">
							<input type="checkbox" id="mon" name="attset_day" value="Y"><label>월</label>
						</div>
						<div class="timeTue" style="float:left"><input type="checkbox" id="tue" name="attset_day" value="Y"><label>화</label></div>
						<div class="timeWen" style="float:left"><input type="checkbox" id="wen" name="attset_day" value="Y"><label>수</label></div>
						<div class="timeTur" style="float:left"><input type="checkbox" id="thr" name="attset_day" value="Y"><label>목</label></div>
						<div class="timeFri" style="float:left"><input type="checkbox" id="fri" name="attset_day" value="Y"><label>금</label></div>
						<div class="timeSat" style="float:left"><input type="checkbox" id="sat" name="attset_day" value="Y"><label>토</label></div>
						<div class="timeSun" style="float:left"><input type="checkbox" id="sun" name="attset_day" value="Y"><label>일</label></div>
					</div>
					<br>
					<br>
					<div>
						<div>기본 근무 시작 및 종료 시간을 입력해주세요</div>
						<div>월요일 : 출근시간 <input type="time" name="start_time">  퇴근시간 <input type = "time" name="endtime"> </div>
						<div>화요일 : 출근시간 <input type="time" name="start_time">  퇴근시간 <input type = "time" name="endtime"> </div>
						<div>수요일 : 출근시간 <input type="time" name="start_time">  퇴근시간 <input type = "time" name="endtime"> </div>
						<div>목요일 : 출근시간 <input type="time" name="start_time">  퇴근시간 <input type = "time" name="endtime"> </div>
						<div>금요일 : 출근시간 <input type="time" name="start_time">  퇴근시간 <input type = "time" name="endtime"> </div>
						<div>토요일 : 출근시간 <input type="time" name="start_time">  퇴근시간 <input type = "time" name="endtime"> </div>
						<div>일요일 : 출근시간 <input type="time" name="start_time">  퇴근시간 <input type = "time" name="endtime"> </div>
					</div>
					<button type="button">저장</button>
				</div>
			</article>
		</section>
	</div>
</body>

<script>
function setVacationUseFlag(){
	var save = $('input[name=vacOnOff]:checked').val();
	if (save == 'Y'){
		if(confirm('휴가 기능을 \'사용함\'으로 설정하시겠습니까?')){
			$('#vacationset').submit();
		}}
	else{
		if(confirm('휴가 기능을 \'사용 안 함\'으로 설정하시겠습니까?')){
			$('#vacationset').submit();
		}
	

	}
}


</script>
</html>