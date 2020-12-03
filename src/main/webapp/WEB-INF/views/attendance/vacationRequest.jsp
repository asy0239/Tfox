<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      table {
        width: 100%;
        border-top: 1px solid #444444;
        border-collapse: collapse;
      }
      th, td {
        border-bottom: 1px solid #444444;
        padding: 10px;
        text-align: center;
      }
    </style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>


		<section class="contents">
			<article>
				<!-- 내용작성을 이곳에서~ -->

				<div class="conWrap">
					<h2>휴가 신청</h2>
					<hr>
					<div class="subtitle">
					<form method="post" action="vacationInsert">
						<table>
							<tbody>
								<tr>
									<td>신청자</td>
									<td><input type="hidden" id="name" name="emp_id" value="${loginEmp.EMP_ID}">${loginEmp.EMP_NAME }</td>
								</tr>
								<tr>
									<td>부서</td>
									<td><input type="hidden" id="deptname" name="dept_name" value="${deptname}">${deptname }</td>
								</tr>
								<tr>
									<td>남은 연차일수</td>
									<!-- 계산수식 불러와서 작성 -->
									<td><p><input type="hidden" id="reqDay"  value="${reqDay}">${reqDay}일</p></td>
								</tr>
								<tr>
									<td>종류</td>
									<td>
										<select name="vactype_name">
										<!-- 여기에다가 휴가 종류 불러와야함 -->
										<c:forEach var="category" items="${category }">
											<option value="${category }">${category}</option>
										</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>휴가기간</td>
									<td><input name="vacapl_start" type="date" required> - <input name="vacapl_end" type="date" required></td>
								</tr>
								<tr>
									<td>사유</td>
									<td><textarea name="vacapl_reason" style="width:80%;text-align:center;"  rows="10"></textarea></td>
								</tr>
							</tbody>
						</table>
						<input type="submit">신청하기
						</form>
					</div>
				</div>

			</article>
		</section>
	</div>
</body>

<script>

/* function call()
{
    var startdate = document.getElementById("#startdate").value;
    var enddate = document.getElementById("#enddate").value;
    var ar1 = sdd.split('-');
    var ar2 = edd.split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
 if(startdate && enddate){
    document.getElementById('days').value = parseInt(dif/cDay) + 1
 }
}
$("#confirm").click(function(){
	var name = $("#name").val();
	var deptname = $("#deptname").val();
	var reqDay = $("#reqDay").val();
	var category = $("#category").val();
	var startdate = $("#startdate").val();
	var enddate = $("#enddate").val();

	console.log(enddate);
	console.log(startdate);
	
	console.log(enddate - startdate);
  $.ajax({
         url: "requestObject",
         type: "POST",
         data: name:name,
         dataType:"json"
         success: function(data){
             $('#result').text(data);
         },
         error: function(){
             alert("simpleWithObject err");
         }
     }); 
}); */



</script>
</html>