<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css, 변수명 고치는중 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</head>
<body>
	<div class="cont_box">
		<div class="setting_field">
			<h4>휴가 설정</h4>
			<form id="vacationset" method="post" action="#">
				<ul class="set_input w_auto">
					<li>
						<p>사용 여부</p>
						<div>
							<label class="mgr_20"><input type="radio"
								name="vacOnOff" value="Y" checked
								onclick="setUseFlag();"> 사용함</label> <label><input
								type="radio" name="vacOnOff" value="N"
								onclick="setUseFlag();"> 사용 안 함</label>
						</div>
					</li>
					<li>
						<p class="bt_left" style="padding-bottom: 0;">
							<button type="button"
								onclick="vacationConfig.setVacationUseFlag()">저장</button>
						</p>
					</li>
				</ul>
			</form>

			<div id="vac_config">
				<div class="hidden pdt_10 mgr_20 after">
					<h4 class="pdb_10">휴가 생성 조건</h4>
					<ul class="mgb_10">
						<li class="gt-pv-5">- 설정한 휴가 생성 기준으로 매년 생성일자(회계연도 기준) 또는 사용자
							입사일(입사일 기준)에 휴가가 자동 생성됩니다.</li>
						<li class="gt-pv-5">- 조직에 속하지 않거나 입사일이 없는 사용자는 휴가가 생성되지 않습니다.</li>
						<li class="gt-pv-5">- 사용하던 휴가 생성 기준을 변경 적용하는 경우, 기존 휴가 데이터는
							초기화됩니다. (기존 휴가 생성분 삭제 및 새 기준에 맞추어 재생성)</li>
						<li class="gt-pv-5">- 적용 전 입력한 휴가 생성 조건에 따라 생성될 전직원 생성 예정휴가를
							다운로드받아보실 수 있습니다.</li>
					</ul>
				</div>

				<div class="after gt-mv-20">
					<label><input type="radio" name="create_type" value="A"
						checked /> 회계연도 기준</label> <label class="gt-ml-40"><input
						name="create_type" type="radio" value="J" /> 입사일 기준</label>
				</div>

				<table class="vacDate">
					<caption>휴가 생성 조건 목록으로 휴가 일수, 생성일자, 이월 설정으로 구성되어 있습니다.</caption>
					<colgroup>
						<col width="110">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">휴가 일수</th>
							<td style="padding: 0;">
								<table class="sub_table1" id="vcTable">
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
									<col>
									<col>
									<col>
									<tbody>
										<tr class="row-count-0">
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
											<td>N+10</td>
										</tr>
										<tr class="row-count-0">
											<td id="auto-create-method_0" class="center " colspan="2">자동생성</td>
											<td class="hide auto-create-method-01"><label><input
													type="text" value="11" name="vc_date"> 일</label></td>
											<td class="hide auto-create-method-01"><label><input
													type="text" value="15" name="vc_date"> 일</label></td>
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
											<td><label><input type="text" value="18"
													name="vc_date"> 일</label></td>
											<td><label><input type="text" value="18"
													name="vc_date"> 일</label></td>
										</tr>
										<tr class="row-count-1">
											<td>N+11</td>
											<td>N+12</td>
											<td>N+13</td>
											<td>N+14</td>
											<td>N+15</td>
											<td>N+16</td>
											<td>N+17</td>
											<td>N+18</td>
											<td>N+19</td>
											<td>N+20</td>
										</tr>
										<tr class="row-count-1">
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
											<td>N+21</td>
											<td>N+22</td>
											<td>N+23</td>
											<td>N+24</td>
											<td>N+25</td>
											<td>N+26</td>
											<td>N+27</td>
											<td>N+28</td>
											<td>N+29</td>
											<td>N+30</td>
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
							<th scope="row">생성일자
							<span class="blind">세부 설명</span></a>
								<div class="tooltip hide" style="left: 50px; top: -20px">
									<div class="icon tip_sq" style="left: 20px"></div>
									<div class="tooltip-box" style="width: 440px;">
										• 매년 설정한 일자에 연차휴가가 자동 생성됩니다.<br /> • 휴가 생성 일자를 변경하면 과거 모든 휴가
										생성과 사용 데이터가 초기화됩니다. • 휴가 생성 일자를 변경하기 전에 [휴가관리>직원휴가관리]에서 현재까지의
										사용 내역을 다운로드받으실 수 있습니다.
									</div>
								</div>
							</th>
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


				<div class="bt_left" style="padding-bottom: 0;">
					<button type="button"
						onclick="">적용</button>
				</div>



				<div class="hidden pdt_50">
					<h4 class="fl mgr_20">휴가 종류</h4>
					<a onclick="#"> <span
						class="sms_plus"></span> 추가
					</a>
				</div>
				<table class="tableType01 gon" id="vcTypeTable">
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
					<tbody>
						<tr data-type-value="10" id="vacation_type_value_10"
							data-priority="1" data-type-index=0>
							<td>연차 <span class="vacation-case"> </span>
							</td>
							<td class="C"><select id="vacation_use_0">
									<option value="Y" selected>사용</option>
									<option value="N">사용 안 함</option>
							</select></td>
							<td class="C"><label> <input type="checkbox"
									id="vacation_minus_0" checked="checked"> 연차에서 차감
							</label></td>
						</tr>
						<tr data-type-value="11" id="vacation_type_value_11"
							data-priority="2" data-type-index=1>
							<td>포상 <span class="vacation-case"> </span>
							</td>
							<td class="C"><select id="vacation_use_1">
									<option value="Y" selected>사용</option>
									<option value="N">사용 안 함</option>
							</select></td>
							<td class="C"><label> <input type="checkbox"
									id="vacation_minus_1"> 연차에서 차감
							</label></td>
						</tr>
						<tr data-type-value="21" id="vacation_type_value_21"
							data-priority="3" data-type-index=2>
							<td>훈련 <span class="vacation-case"> <span
									class="icon file_delete"
									onclick="vacationConfig.deleteVacationType(21)"></span>
							</span>
							</td>
							<td class="C"><select id="vacation_use_2">
									<option value="Y" selected>사용</option>
									<option value="N">사용 안 함</option>
							</select></td>
							<td class="C"><label> <input type="checkbox"
									id="vacation_minus_2"> 연차에서 차감
							</label></td>
						</tr>
						<tr data-type-value="22" id="vacation_type_value_22"
							data-priority="4" data-type-index=3>
							<td>교육 <span class="vacation-case"> <span
									class="icon file_delete"
									onclick="vacationConfig.deleteVacationType(22)"></span>
							</span>
							</td>
							<td class="C"><select id="vacation_use_3">
									<option value="Y" selected>사용</option>
									<option value="N">사용 안 함</option>
							</select></td>
							<td class="C"><label> <input type="checkbox"
									id="vacation_minus_3"> 연차에서 차감
							</label></td>
						</tr>
						<tr data-type-value="23" id="vacation_type_value_23"
							data-priority="5" data-type-index=4>
							<td>경조사 <span class="vacation-case"> <span
									class="icon file_delete"
									onclick="vacationConfig.deleteVacationType(23)"></span>
							</span>
							</td>
							<td class="C"><select id="vacation_use_4">
									<option value="Y" selected>사용</option>
									<option value="N">사용 안 함</option>
							</select></td>
							<td class="C"><label> <input type="checkbox"
									id="vacation_minus_4"> 연차에서 차감
							</label></td>
						</tr>
						<tr data-type-value="24" id="vacation_type_value_24"
							data-priority="6" data-type-index=5>
							<td>병가 <span class="vacation-case"> <span
									class="icon file_delete"
									onclick="vacationConfig.deleteVacationType(24)"></span>
							</span>
							</td>
							<td class="C"><select id="vacation_use_5">
									<option value="Y" selected>사용</option>
									<option value="N">사용 안 함</option>
							</select></td>
							<td class="C"><label> <input type="checkbox"
									id="vacation_minus_5" checked="checked"> 연차에서 차감
							</label></td>
						</tr>
					</tbody>
				</table>
				
				<div class="bt_left">
					<button type="button" onclick="vacationConfig.saveVacationType()">저장</button>
				</div>
			</div>
	</div>

</body>
</html>