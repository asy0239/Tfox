<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태설정</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
<style>
.timeall{
	
	padding-bottom:120px;
}

.setTime{
	padding-top : 250px;
}
.maintesttop span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
}

.main_top span{
	font-size: 20px;
	font-weight: bold;

}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
			<div class="conWrap">
			<div class="maintesttop">
					<span>근태관리 > 근태설정</span>
				</div>
			<hr>
			<form id="attendsetOn" method="post" action="atdOnOff">
				<div class="main_top">
					<span>근태 사용 여부</span>
					<div class="abcd">
						<label><input type="radio" name="att_timeYN" value="Y" <c:if test="${atdYN[0].attdb_yn eq 'Y'}">checked</c:if>> 사용함</label>
						<label><input type="radio" name="att_timeYN" value="N" <c:if test="${atdYN[0].attdb_yn eq 'N'}">checked</c:if>> 사용 안 함</label>
					</div>
				</div>
				<div class="main_top">
					<span>52시간 근무 적용 여부</span>
					<div class="abcd">
						<label><input type="radio" name="att_52YN" value="Y" <c:if test="${atdYN[0].attdb_oe eq 'Y'}">checked</c:if>> 사용함</label> 
						<label><input type="radio" name="att_52YN" value="N" <c:if test="${atdYN[0].attdb_oe eq 'N'}">checked</c:if>> 사용 안 함</label>
					</div>
				</div>
				<div class="bt_left">
					<input type="submit" class="btn btn-info" value="저장하기">
				</div>
			</form>

			<form id="attendtimeOn" method="post" action="timedaySet">
				<div class="main_top">
				<span>출퇴근 시간 설정</span>
				</div>
				<br>
				<div style="text-align:center;">기본 근무 시작 및 종료 시간을 입력해주세요</div>
					<table class="table">
						<tr>
						<td><span>월요일</span></td>
						<td>	<label><input type="radio" name="attset_mon" value="Y" onclick="timeToggle()" <c:if test="${setlist[0].attset_yn eq 'Y'}">checked</c:if>> 사용함</label> 
								<label><input type="radio" name="attset_mon" value="N" onclick="timeToggle()" <c:if test="${setlist[0].attset_yn eq 'N'}">checked</c:if>> 사용 안 함</label></td>
								<td><div id="montime"> 출근시간 <input type="time" name="start_time" value="${setlist[0].attset_start }">  퇴근시간 <input type="time" name="endtime" value="${setlist[0].attset_end }"> </div></td>
						</tr>
						<tr>
						<td><span>화요일</span></td>
						<td>	<label><input type="radio" name="attset_tue" value="Y" onclick="timeToggle2()" <c:if test="${setlist[1].attset_yn eq 'Y'}">checked</c:if>> 사용함</label> 
								<label><input type="radio" name="attset_tue" value="N" onclick="timeToggle2()"<c:if test="${setlist[1].attset_yn eq 'N'}">checked</c:if>> 사용 안 함</label></td>
								<td><div id="tuetime"> 출근시간 <input type="time" name="start_time" value="${setlist[1].attset_start }">  퇴근시간 <input type ="time" name="endtime" value="${setlist[1].attset_end }"> </div></td>
						</tr>
						<tr>
						<td><span>수요일</span></td>
						<td>	<label><input type="radio" name="attset_wed" value="Y" onclick="timeToggle3()" <c:if test="${setlist[2].attset_yn eq 'Y'}">checked</c:if>> 사용함</label> 
								<label><input type="radio" name="attset_wed" value="N" onclick="timeToggle3()"<c:if test="${setlist[2].attset_yn eq 'N'}">checked</c:if>> 사용 안 함</label></td>
								<td><div id="wedtime"> 출근시간 <input type="time" name="start_time" value="${setlist[2].attset_start }">  퇴근시간 <input type ="time" name="endtime" value="${setlist[2].attset_end }"> </div></td>
						</tr>
						<tr>
						<td><span>목요일</span></td>
						<td>	<label><input type="radio" name="attset_thr" value="Y" onclick="timeToggle4()" <c:if test="${setlist[3].attset_yn eq 'Y'}">checked</c:if>> 사용함</label> 
								<label><input type="radio" name="attset_thr" value="N" onclick="timeToggle4()"<c:if test="${setlist[3].attset_yn eq 'N'}">checked</c:if>> 사용 안 함</label></td>
								<td><div id="thrtime"> 출근시간 <input type="time" name="start_time" value="${setlist[3].attset_start }">  퇴근시간 <input type ="time" name="endtime" value="${setlist[3].attset_end }"> </div></td>
						</tr>
						<tr>
						<td><span>금요일</span></td>
						<td>	<label><input type="radio" name="attset_fri" value="Y" onclick="timeToggle5()" <c:if test="${setlist[4].attset_yn eq 'Y'}">checked</c:if>> 사용함</label> 
								<label><input type="radio" name="attset_fri" value="N" onclick="timeToggle5()"<c:if test="${setlist[4].attset_yn eq 'N'}">checked</c:if>> 사용 안 함</label></td>
								<td><div id="fritime"> 출근시간 <input type="time" name="start_time" value="${setlist[4].attset_start }">  퇴근시간 <input type ="time" name="endtime" value="${setlist[4].attset_end }"> </div></td>
						</tr>
						<tr>
						<td><span>토요일</span></td>
						<td>	<label><input type="radio" name="attset_sat" value="Y" onclick="timeToggle6()" <c:if test="${setlist[5].attset_yn eq 'Y'}">checked</c:if>> 사용함</label> 
								<label><input type="radio" name="attset_sat" value="N" onclick="timeToggle6()" <c:if test="${setlist[5].attset_yn eq 'N'}">checked</c:if>> 사용 안 함</label></td>
								<td><div id="sattime"> 출근시간 <input type="time" name="start_time" value="${setlist[5].attset_start }">  퇴근시간 <input type ="time" name="endtime" value="${setlist[5].attset_end }"> </div></td>
						</tr>
						<tr>
						<td><span>일요일</span></td>
						<td>	<label><input type="radio" name="attset_sun" value="Y" onclick="timeToggle7()" <c:if test="${setlist[6].attset_yn eq 'Y'}">checked</c:if>> 사용함</label> 
								<label><input type="radio" name="attset_sun" value="N" onclick="timeToggle7()" <c:if test="${setlist[6].attset_yn eq 'N'}">checked</c:if>> 사용 안 함</label></td>
								<td><div id="suntime"> 출근시간 <input type="time" name="start_time" value="${setlist[6].attset_start }">  퇴근시간 <input type ="time" name="endtime" value="${setlist[6].attset_end }"> </div></td>
						</tr>	
					</table>
					<input type="submit" class="btn btn-info" value="저장" style="float:left;">
				</form>
				</div>
			</article>
		</section>
	</div>
</body>

<script>
$(document).ready(function(){
	var test1 = "${setlist[0].attset_yn}";
	var test2 = "${setlist[1].attset_yn}";
	var test3 = "${setlist[2].attset_yn}";
	var test4 = "${setlist[3].attset_yn}";
	var test5 = "${setlist[4].attset_yn}";
	var test6 = "${setlist[5].attset_yn}";
	var test7 = "${setlist[6].attset_yn}";
	console.log(test7);
	
	if (test1 =='Y') {
		$("#montime").show();
 	 } else {
		$("#montime").hide();
	 }
	
	if (test2 =='Y') {
		$("#tuetime").show();
 	 } else {
		$("#tuetime").hide();
	 }
	
	if (test3 =='Y') {
		$("#wedtime").show();
 	 } else {
		$("#wedtime").hide();
	 }
	
	if (test4 =='Y') {
		$("#thrtime").show();
 	 } else {
		$("#thrtime").hide();
	 }	
	
	if (test5 =='Y') {
		$("#fritime").show();
 	 } else {
		$("#fritime").hide();
	 }	
	
	if (test6 =='Y') {
		$("#sattime").show();
 	 } else {
		$("#sattime").hide();
	 }
	
	if (test7 =='Y') {
		$("#suntime").show();
 	 } else {
		$("#suntime").hide();
	 }	
});
	function timeToggle(){
		var onoff = $('input[type=radio][name=attset_mon]:checked').val();
	 	if (onoff =='Y') {
			$("#montime").show();
     	 } else {
			$("#montime").hide();
    	 }	
	}

	function timeToggle2(){
		var onoff = $('input[type=radio][name=attset_tue]:checked').val();
	 	if (onoff =='Y') {
			$("#tuetime").show();
     	 } else {
			$("#tuetime").hide();
    	 }	
	}
	function timeToggle3(){
		var onoff = $('input[type=radio][name=attset_wed]:checked').val();
	 	if (onoff =='Y') {
			$("#wedtime").show();
     	 } else {
			$("#wedtime").hide();
    	 }	
	}
	function timeToggle4(){
		var onoff = $('input[type=radio][name=attset_thr]:checked').val();
	 	if (onoff =='Y') {
			$("#thrtime").show();
     	 } else {
			$("#thrtime").hide();
    	 }	
	}
	function timeToggle5(){
		var onoff = $('input[type=radio][name=attset_fri]:checked').val();
	 	if (onoff =='Y') {
			$("#fritime").show();
     	 } else {
			$("#fritime").hide();
    	 }	
	}
	function timeToggle6(){
		var onoff = $('input[type=radio][name=attset_sat]:checked').val();
	 	if (onoff =='Y') {
			$("#sattime").show();
     	 } else {
			$("#sattime").hide();
    	 }	
	}
	function timeToggle7(){
		var onoff = $('input[type=radio][name=attset_sun]:checked').val();
	 	if (onoff =='Y') {
			$("#suntime").show();
     	 } else {
			$("#suntime").hide();
    	 }	
	}
	
</script>
</html>