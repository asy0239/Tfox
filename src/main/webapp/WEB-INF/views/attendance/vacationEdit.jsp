<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<script>

 	function setUseFlag(){
 		var onoff = $('input[type=radio][name=vacOnOff]:checked').val();
		if(onoff == 'Y'){
			$('#vac_config').show();
		}else{
			$('#vac_config').hide();
		}
	}
	</script>
<style>
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

#calendar {
	width: 100%;
	height: 600px;
}

.checktool {
	padding-top: 20px;
}

.vac_config {
	
}
</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<section class="contents">
			<article>
				<div class="conWrap">
					<div class="cont_box">
						<div class="setting_field">
							<h4>휴가 설정</h4>
							<form id="vacationset" method="post" action="#">
								<ul class="set_input w_auto">
									<li>
										<p>사용 여부</p>
										<div>
											<label class="mgr_20"> <input type="radio"
												name="vacOnOff" value="Y" checked onclick="setUseFlag();">사용함
											</label> <label><input type="radio" name="vacOnOff" value="N"
												onclick="setUseFlag();"> 사용 안 함</label>
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
									<h4 class="vacsubTitle">휴가 생성 조건</h4>
									<ul class="mgb_10">
										<li>- 설정한 휴가 생성 기준으로 매년 생성일자(회계연도 기준) 또는
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

								<div class="after gt-mv-20">
									<label><input type="radio" name="create_type" value="A"
										checked /> 회계연도 기준</label> <label class="gt-ml-40"><input
										name="create_type" type="radio" value="J" /> 입사일 기준</label>
								</div>

								<table class="vacDate">
									<caption>휴가 생성 조건 목록으로 휴가 일수, 생성일자, 이월 설정으로 구성되어
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
															<td><label><input type="text" value="15"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="15"
																	name="vc_date"> 일</label></td>																	
															<td><label><input type="text" value="15"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="15"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="15"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="15"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="16"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="16"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="17"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="17"
																	name="vc_date"> 일</label></td>
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
															<td><label><input type="text" value="20"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="21"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="21"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="22"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="22"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="23"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="23"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="24"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="24"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
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
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
															<td><label><input type="text" value="25"
																	name="vc_date"> 일</label></td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr id="create_date" class="">
											<th scope="row">생성일자</th>
											<td>매년 <select name="start_month">
													<option value="1" selected="selected">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
											</select>&nbsp; 월 &nbsp;1&nbsp;일
											</td>
										</tr>
									</tbody>
								</table>


								<div class="vacdaysetbtn">
									<button type="button" onclick="">적용</button>
								</div>



								<div class="vacCate">
									<h4>휴가 종류</h4>
									<button id="addVacCate">추가</button>
									</a>
								</div>
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
											<th scope="row" class="C">차감 여부</th>
										</tr>
									</thead>
									<tbody id="vacCategory">
										<tr>
											<td>연차</td>
											<td><select id="vacation_use">
													<option value="Y" selected>사용</option>
													<option value="N">사용 안 함</option>
											</select></td>
											<td><label><input type="checkbox"
													id="vacation_minus_0" checked="checked"> 연차에서 차감
											</label></td>
										</tr>
										<tr>
											<td>병가</td>
											<td><select id="vacation_use">
													<option value="Y" selected>사용</option>
													<option value="N">사용 안 함</option>
											</select></td>
											<td><label><input type="checkbox"
													id="vacation_minus_0" checked="checked"> 연차에서 차감
											</label></td>
										</tr>
										<tr>
											<td>포상휴가</td>
											<td><select id="vacation_use">
													<option value="Y" selected>사용</option>
													<option value="N">사용 안 함</option>
											</select></td>
											<td><label> <input type="checkbox"
													id="vacation_minus_0" checked="checked"> 연차에서 차감
											</label></td>
										</tr>
									</tbody>
								</table>
								<div class="catButton">
									<button type="button" onclick="saveVacCategory()">저장</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>

</body>
<script>
var i = 0;
	
$("#addVacCate").on("click", function(){
	i++;
	console.log(i);
	$("#vacCategory").append('<tr id='+i+'> <td><input type="text" size="10"></td> <td><select id="vacation_use"> <option value="Y" selected>사용</option> <option value="N">사용 안 함</option> </select></td> <td><label> <input type="checkbox" id="vacation_minus_0" checked="checked"> 연차에서 차감 </label></td> </tr>')
});

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