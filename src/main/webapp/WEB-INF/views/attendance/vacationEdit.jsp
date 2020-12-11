<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
 	
<style>

.VacationEdit_top span {
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	font-weight: bold;
}

.sub_title_top span {
	bottom: 8px;
	margin-top: 50px;
	font-size: 15px;
	font-weight: bold;
}
#top {
	width: 100%;
	height: 100px;
	border: 1px solid black;
}

table {
	width: 500px;
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


</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<div class="conWrap">
				<div class="VacationEdit_top">
					<span>근태관리 > 휴가신청</span>
				</div>
				<hr>
					<div class="cont_box">
						<div class="setting_field">
						
							<form id="vacationset" method="post" action="vacOnOff">
								<ul class="set_input w_auto">
									<li>
										<div class="sub_title_top">
											<span>사용 여부</span>
										</div>
										<div>
										<c:forEach var="oh" items="${onOff }">										
											<label> 
											<input type="radio" name="vacOnOff" value="Y" onclick="setUseFlag();" <c:if test="${oh.vac_yn eq 'Y'}">checked</c:if>>사용함
											</label>
											<label>
											<input type="radio" name="vacOnOff" value="N" onclick="setUseFlag();" <c:if test="${oh.vac_yn eq 'N'}">checked</c:if>> 사용 안 함</label>
										</c:forEach>
										</div>
									</li>
									<li>
										<p class="bt_left" style="padding-bottom: 0;">
											<button type="button" onclick="setVacationUseFlag()">저장</button>
										</p>
									</li>
								</ul>
							</form>

							<div id="vac_config">
								<div class="leftvacset">
									<div class="sub_title_top">
											<span>휴가 생성 조건</span>
									</div>
									<ul class="mgb_10">
										<li>- 설정한 휴가 생성 기준으로 매년 1월 1일 또는
											사용자 입사일(입사일 기준)에 휴가가 자동 생성됩니다.</li>
										<li>- 조직에 속하지 않거나 입사일이 없는 사용자는 휴가가 생성되지
											않습니다.</li>
										<li>- 사용하던 휴가 생성 기준을 변경 적용하는 경우, 기존 휴가
											데이터는 초기화됩니다. (기존 휴가 생성분 삭제 및 새 기준에 맞추어 재생성)</li>
										<li>- 적용 전 입력한 휴가 생성 조건에 따라 생성될 전직원 생성
											예정휴가를 다운로드받아보실 수 있습니다.</li>
									</ul>
								</div>
								<br> <br>

								<div>
									<label> <input type="radio" name="create_type" value="A" checked /> 회계연도 기준</label>
									<label> <input name="create_type" type="radio" value="J" /> 입사일 기준</label>
								</div>
								
								<form id="vacationDayset" method="post" action="vacationDayset">
								<table class="vacDate">
									<caption>휴가 생성 조건 목록으로 휴가 일수 설정으로 구성되어
										있습니다.</caption>
									<colgroup>
										<col width="80">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">휴가 일수</th>
											<td style="padding: 0;">
												<table>
													<col>
													<col>
													<col>
													<col>
													<col>
													<col>
													<col>
													<col>
													<col>
													<col>
													<tbody>
														<tr>
															<td>N(입사연도)</td>
															<td>N+1</td>
															<td>N+2</td>
															<td>N+3</td>
															<td>N+4</td>
															<td>N+5</td>
															<td>N+6</td>
															<td>N+7</td>
															<td>N+8</td>
															<td>N+9</td>
														</tr>
														<tr>
														<c:forEach var="day" items="${vcsday }" end="9">
															<td><input type="hidden" name="year_id" value="${day.year_id }"><label><input type="text" value="${day.year_day }"
																	name="vc_date"> 일</label></td>
														</c:forEach>
														</tr>
														<tr>
															<td>N+10</td>
															<td>N+11</td>
															<td>N+12</td>
															<td>N+13</td>
															<td>N+14</td>
															<td>N+15</td>
															<td>N+16</td>
															<td>N+17</td>
															<td>N+18</td>
															<td>N+19</td>
														</tr>
														<tr>
														<c:forEach var="day" items="${vcsday }" begin="10" end="19">
															<td><input type="hidden" name="year_id" value="${day.year_id }"><label><input type="text" value="${day.year_day }"
																	name="vc_date"> 일</label></td>
														</c:forEach>
														</tr>
														<tr class="row-count-2">
															<td>N+20</td>
															<td>N+21</td>
															<td>N+22</td>
															<td>N+23</td>
															<td>N+24</td>
															<td>N+25</td>
															<td>N+26</td>
															<td>N+27</td>
															<td>N+28</td>
															<td>N+29</td>
														</tr>
														<tr class="row-count-2">
														<c:forEach var="day" items="${vcsday }" begin="20" end="29">
															<td><input type="hidden" name="year_id" value="${day.year_id }"><label><input type="text" value="${day.year_day }"
																	name="vc_date"> 일</label></td>
														</c:forEach>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
							
									</tbody>
								</table>
								<div class="vacdaysetbtn">
									<input type="submit" value="저장">
								</div>
								</form>


								<div class="vacCate">
									<div class="sub_title_top">
										<span>휴가 종류</span>
									</div>
									<button id="addVacCate">추가</button>
								</div>
								<form id="vacCateSet" method="post" action="vacCateSet">
								<table class="tablevactype" id="vcTypeTable">
									<caption>휴가 종류 목록으로 휴가명, 사용 여부, 차감 여부로 구성되어 있습니다.</caption>
									<colgroup>
										<col width="20%">
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="row">휴가명</th>
											<th scope="row" class="C">사용 여부</th>
											<th scope="row" class="C">연차 차감 여부</th>
											<th scope="row" class="C">삭제하게</th>
										</tr>
									</thead>
									<tbody id="vacCategory">
										<c:forEach var="cate" items="${vCate }" varStatus="status">
										<tr>
											<td><input type="hidden" name="vactypeName" value="${cate.vactype_name }">${cate.vactype_name }</td>
											<td>
											<select name="vactypeYN">
													<option value="Y" <c:if test="${cate.vactype_yn eq 'Y' }">selected</c:if>>사용</option>
													<option value="N" <c:if test="${cate.vactype_yn eq 'N' }">selected</c:if>>사용 안 함</option>
											</select>
											</td>
											<td>
											<select name="yearYN">
													<option value="O" <c:if test="${cate.vactype_yearyn eq 'O' }">selected</c:if>>차감</option>
													<option value="X" <c:if test="${cate.vactype_yearyn eq 'X' }">selected</c:if>>차감 안 함</option>
											</select>
											</td>
											<td>
												<input type="button" class="deleteCat" value="삭제하기" />
											</td>
										</tr>
										</c:forEach>		
									</tbody>
								</table>
								<div class="catButton">
									<input type="submit" value="저장">
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>

</body>
<script>
	function setUseFlag(){
		var onoff = $('input[type=radio][name=vacOnOff]:checked').val();
		if(onoff == 'Y'){
		$('#vac_config').show();
		}else{
		$('#vac_config').hide();
		}
	}
	$(".deleteCat").click(function(){
		
		var catDelete = $(this);
		
		var tr = catDelete.parent().parent();
		var td = tr.children();

		var no = td.eq(0).text();
		$.ajax({
			url : "${pageContext.request.contextPath}/attendance/vacationDeleteCat",
			type : "POST",
			data: {"name":no},
			dataType: "JSON",
			success:function(data){
				
				$("#vacCategory").html('');
				$.each(data, function(index, cate){
					var vactypeY = cate.vactype_yn;
					var vactypeN = cate.vactype_yn
					var yearY = cate.vactype_yearyn;
					var yearN = cate.vactype_yearyn;
					if(vactypeY == 'Y' ){
						vactypeY = 'selected';
						vactypeN = '';
					}else{
						vactypeN = 'selected';
						vactypeY = '';
					}
					
					if(yearY == 'O' ){
						yearY = 'selected';
						yearN = '';
					}else{
						yearN = 'selected';
						yearY = '';
					}
					
					$("#vacCategory").append('<tr> <td><input type="hidden" name="vactypeName" value="'+cate.vactype_name +'">'+cate.vactype_name +'</td> <td> <select name="vactypeYN"> <option value="Y" '+vactypeY+'>사용</option> <option value="N" '+vactypeN+'>사용 안 함</option> </select> </td> <td> <select name="yearYN"> <option value="O" '+yearY+'>차감</option> <option value="X" '+yearN+'>차감 안 함</option> </select> </td> <td> <input type="button" class="deleteCat" value="삭제하기" /> </td> </tr>')
				});
			},
			error:function(){
				alert("삭제되지 않았습니다")
			},
		});	
	});
	
var i = 0;
	
$("#addVacCate").on("click", function(){
	var index1 = 
	i++;
	console.log(i);
	//$("#vacCategory").append('<tr id='+i+'> <td><input type="text" size="10"></td> <td><select id="vacation_use"> <option value="Y" selected>사용</option> <option value="N">사용 안 함</option> </select></td> <td><label> <input type="checkbox" id="vacation_minus_0" > 연차에서 차감 </label></td> </tr>')
	$("#vacCategory").append('<tr> <td><input type="text" size="10" name="vactypeName" placeholder="휴가이름"></td> <td> <select name="vactypeYN"> <option value="Y" selected>사용</option> <option value="N">사용 안 함</option> </select> </td> <td> <select name="yearYN"> <option value="O" selected>차감</option> <option value="X">차감 안 함</option> </select> </td> <td> <input type="button" class="deleteCat" value="삭제하기" /> </td> </tr>')
});


$(document).ready(function(){
	var test = "${onOff}"
	console.log(test[36]);
	if (test[36] == 'Y'){
		$('#vac_config').show();
	}else{
		$('#vac_config').hide();
	}
});
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

/*  function saveVacCategory(){
	$.ajax({
		type:GET,
		dataType:"json",
		url:"${pageContext.request.contextPath}/appendance/vacationEdit",
		data:{i:[{"휴가종류":"포상휴가"}]}
	});
}  */
</script>
</html>