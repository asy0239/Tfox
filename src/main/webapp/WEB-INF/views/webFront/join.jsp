<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<style>

	.header_mid{
		width: 1200px;
		margin:0 auto;
	}
	.mid_img{
		margin:0 auto;
		width: 340px;
		height: 340px;
	}
	#join {
		margin:0 auto;
		padding:0 auto;
	}
	#joinForm {
		position: relative;
    	max-width: 580px;
    	min-height: 520px;
    	margin: 0 auto;
    	padding: 58px 69px 139px;
    	border: 1px solid lightgray;
    	
	}
	label {
		color:gray;
	}
	.input {
	    width: 80%;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	}
	.birth {
	 	
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	}
	#userAddress {
		width: 270px;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	
	}
	#AddressNum, #AddressDetail {
		width: 80%;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	}
	.btn, #idCheck {
		width: 100px;
    	height: 30px;
    	font-size: large;
    	border-radius: 10px/10px;
    	background: white;
    	
    	font-weight: bold;
	}
	
	.subjoin {		
    	margin: 0 auto;
    	padding:100px;
	}
	#phone {
		width: 170px;
    	height: 48px;
    	border-width: 0 0 2px 0;
    	border-color: lightgray;
    	padding: 11px 70px 11px 0;
    	color: #252525;
    	font-size:large;
    	outline: 0;
    	border-radius: 0;
    	box-sizing: border-box;
    	caret-color: gray;
	}

</style>

</head>
<body>
	<div id="wrap">
		<!-- 로고 이미지  -->
		<div class="header_mid">
			<div class="mid_img">
				<a>
					<img src="${pageContext.request.contextPath }/resources/img/webFront/webLogo.png"/>
				</a>
			</div>
		</div>
		</div>
	<div id="join">
	<form id="joinForm" action="${pageContext.request.contextPath }/userinsert" method="POST">
	<h2><label>가입정보를 입력해주세요.</label></h2>
	<br>
		<div>
			<h3>
			<label>이름</label>
			</h3>
				<span><input type="text" class="input" id="userName" name="user_name"></span>
				<h3>
			<label class="userId">아이디</label>
			</h3>
				<div>
				<span><input type="text" class="input" id="userId" name="user_loginid"></span>
				<!-- <div class="eheck_font" id="idCheck"></div> -->
				<span><input type="button" class="btn" id="idCheck" value="중복확인"></span>
				</div>
				<h3>
			<label>비밀번호</label>
			</h3>
				<span><input type="password" class="input" id="userPass1" placeholder="비밀번호" name="user_pwd1"></span>
				<div class="ceheck_font" id="Passcheck"></div>
				<br>
				<span><input type="password" class="input" id="userPass2" placeholder="비밀번호 재입력" name="user_pwd2"></span>
				<div class="ceheck_font" id="Passcheck"></div>
				<h3>
				<label>번호</label>
			</h3>
				<span><input type="text"  id="phone" name="phone1"></span>-
				<span><input type="text"  id="phone" name="phone2"></span>-
				<span><input type="text"  id="phone" name="phone3"></span>
				<h3>
			<label>생년월일</label>
			</h3>
				<span><input type="date" class="birth" placeholder="년도" name="user_number"></span>
				<h3>
			<label>이메일</label>
			</h3>
				<span><input type="email" class="input" id="userEmail" name="user_email"></span>
				<h3>
			<label>주소</label>
			</h3>
				<span><input type="text" class="address" id="userAddress" name="userAddress"  placeholder="우편번호"></span>
				<span><input type="button" class="btn" onclick="execPostCode();" value="우편검색"></span>
				<br>
				<span><input type="text" class="address" id="AddressNum" name="AddressNum"  placeholder="도로명 주소"></span>
				<br>
				<span><input type="text" class="address" id="AddressDetail" placeholder="상세주소" name="AddressDetail"></span>
				
		</div>
				<div class="subjoin" align="center">
				<span><button value="" class="btn">취소</button></span>
				<span><button type="submit" class="btn" id="insertUser">가입하기</button></span>
			</div>
				
	</form>
	</div>
	
	
	<script>
	//모든 공백 체크 정규식
	var empJ = /\s/g; 
	//아이디 정규식 
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 

	
	$("#idCheck").on("click", function(){
	
		var userId = $("#userId").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/idCheck",
			type: "post",
			dataType:"json",
			data: {
				"userId" : userId,
			},
			success: function(data) {
				console.log(data);
				if(data == "0") {
					alert("사용 가능한 아이디 입니다");
				} else {
					alert("사용 불가능한 아이디 입니다");
				}
			},
			error: function(err) {
				console.log("실패!");
			}
		});
	});
	
	$('form').on('submit', function() {
		var inval_Arr = new Array(8).fill(false);
		if(idj.test($('#userId').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
		}
		//비밀번호가 같은경우 && 비밀번호 정규식
		if(($('#userPass1').val()==($('#userPass2').val()))
			&& pwJ.test($('#userPass1').val())){
			inval_Arr[1] = true;
		} else {
			inval_Arr[1] = false;
			alert('비밀번호를 확인하세요.');
			return false;
		}
		//이름 정규식
		if(nameJ.test($('#userName').val())) {
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
			alert('이름을 확인하세요.');
			return false;
		}
		//생년월일 정규식
		if(birthJ) {
			console.log(birthJ);
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
			alert('생년월일을 확인하세요.');
			return false;
		}
		// 이메일 정규식
		if (mailJ.test($('#userEmail').val())) { 
			console.log(phoneJ.test($('#userEmail').val()));
			inval_Arr[4] = true; 
			} else { 
				inval_Arr[4] = false; 
				alert('이메일을 확인하세요.');
				return false; 
			} 
		// 휴대폰번호 정규식
		if (phoneJ.test($('#phone').val())) { 
			console.log(phoneJ.test($('#phone').val())); 
			inval_Arr[5] = true; 
			} else {
				inval_Arr[5] = false; 
				alert('휴대폰 번호를 확인하세요.');
				return false; 
				} 
		//주소확인 
		if(address.val() == '') {
			inval_Arr[7] = false; alert('주소를 확인하세요.');
			return false; 
			} else 
				inval_Arr[7] = true; 
			
		//전체 유효성 검사 
		var validAll = true; 
		for(var i = 0; i < inval_Arr.length; i++) { 
			if(inval_Arr[i] == false) { 
				validAll = false; 				
			}  				
		}
		// 유효성 모두 통과 
			if(validAll == true){ 
		 } else { 
			 alert('정보를 다시 확인하세요.') 
			 }
	});
	
	//1~2 패스워드 일치 확인 
	$('#userPass2').blur(function() { 
		if ($('#userPass1').val() != $(this).val()) { 
			$('#Passcheck').text('비밀번호가 일치하지 않습니다.'); 
			$('#Passcheck').css('color', 'red'); 
			} else { 
				$('#Passcheck').text('비밀번호가 일치합니다'); 
				$('#Passcheck').css('color', 'blue');
				} 
		});

	
	
	function execPostCode() {
		new daum.Postcode({ 
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다. 
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
				var fullRoadAddr = data.roadAddress; 
				// 도로명 주소 변수
				var extraRoadAddr = ''; 
				// 도로명 조합형 주소 변수 
				// 법정동명이 있을 경우 추가한다. (법정리는 제외) 
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다. 
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) { 
					extraRoadAddr += data.bname; } 
				// 건물명이 있고, 공동주택일 경우 추가한다. 
				if(data.buildingName !== '' && data.apartment === 'Y') { 
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
					} 
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다. 
				if(extraRoadAddr !== ''){ extraRoadAddr = ' (' + extraRoadAddr + ')'; } 
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다. 
				if(fullRoadAddr !== ''){ fullRoadAddr += extraRoadAddr; } 
				// 우편번호와 주소 정보를 해당 필드에 넣는다. 
				console.log(data.zonecode); 
				console.log(fullRoadAddr); 
				/* var a = console.log(data.zonecode); 
				var b = console.log(fullRoadAddr); 
				if(a == null || b = null){ alert("주소를 확인하세요."); 
				return false; 
				} */ 
				$("[name=userAddress]").val(data.zonecode); 
				$("[name=AddressNum]").val(fullRoadAddr); 
				document.getElementById('userAddress').value = data.zonecode;
				//5자리 새우편번호 사용 
				document.getElementById('AddressNum').value = fullRoadAddr; 
				
				} 
		}).open();
		}

		
	
	
	</script>
</body>
</html>