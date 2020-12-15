<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/product/modal.css">

<title>상품관리 메인</title>
<style>



#top>div:nth-child(n) {
	float: left;
}

#top>div:nth-child(1) {
	
}

#btSubmit{
	margin-top : 30px;
	margin-left: 900px;
	height: 31px;
	width: 78px;
	color: white;
	background-color:black;
	border-radius: 12px;
}

#top>span {
	color: #5E5E5E ;
	position: relative;
	bottom: 8px;
	margin-left: 30px;
	font-size: 25px;
	
}

#mid-1 {
	width: 1000px;
	height: 950px;
	margin-top: 100px;
	border: 1px solid black;
	margin-left: 40px;
	padding-bottom: 10px;
}

#mid-2 {
	width: 1000px;
	height: 254px;
	margin-top: 100px;
	border: 1px solid black;
	margin-left: 40px;
	padding-bottom: 10px;
}

#mid-3 {
	width: 1000px;
	height: 380px;
	margin-top: 100px;
	border: 1px solid black;
	margin-left: 40px;
	padding-bottom: 10px;
}

.mid>div:nth-child(2) {
	margin-left: 50px;
	margin-top: 10px;
	width: 900px;
}

#mid-1>div {
	height: 890px
}

#mid-2>div {
	height: 194px
}

#mid-3>div {
	height: 320px
}

table, th, td {
	border-collapse: collapse;
	border: 1px solid black;
}

tr>td:nth-child(1) {
	height: 45px;
	width: 130px;
}

table  tr:nth-child(7) {
	height: 290px;
}

table  tr:nth-child(6) {
	height: 280px;
}

input {
	height: 20px;
	width: 300px;
}

#mid-2 table td:nth-child(2) {
	height: 50px;
	width: 700px;
}

#mid-3 table td:nth-child(2) {
	height: 50px;
	width: 700px;
}

.m2 {
	height: 50px;
}

#buttom {
	height: 200px;
}

button {
	height: 30px;
	width: 50px;
	background: white;
	border: 2px solid #555555;
}

.bt {
	border: 1px solid black;
}

#date {
	height: 30px;
	width: 150px;
}

.t {
	height: 15px;
	width: 90px;
}

.ph {
	padding-left: 10px;
	height: 340px;
	width: 300px;
	padding-right: 10px;
}

#titleImgArea {
	height: 300px;
	width: 300px;
}

#contentImgArea1, #contentImgArea2 {
	height: 100px;
	width: 100px;
}

#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover {
	cursor: pointer
}


</style>

</head>

<body onload="init(this.form);">
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<%@ include file="modal_Manufacturer.jsp"%>
	<%@ include file="modal_Supplier.jsp"%>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

			<section class="contents">
				<article>
	<form action="insert" method="POST" name="form" enctype="multipart/form-data" >
					<div class="conWrap">

						<div id="top">
							<img
								src="${pageContext.request.contextPath }/resources/img/common/G6.png">

							<span>상품관리 > 상품등록</span>
						</div>
						<div id="mid-1" class="mid">
							<img
								src="${pageContext.request.contextPath }/resources/img/product/mid-1.png">
							<div>
								<table>
									<tr>
										<td>&nbsp; 상품명</td>
										<td colspan="2">&nbsp; &nbsp;<input type="text" name="pro_name">
										</td>
									</tr>
									<tr>
										<td>&nbsp; 판매가</td>
										<td colspan="2">&nbsp; &nbsp;<input type="text" name="pro_price"></td>

									</tr>
									<tr>
										<td>&nbsp; 자체 상품코드</td>
										<td colspan="2">&nbsp; &nbsp;<input type="text" name="st_id"></td>

									</tr>
									<tr>
										<td>&nbsp; 상품 요약설명</td>
										<td colspan="2">&nbsp; &nbsp;<input type="text" name="pro_summary"></td>

									</tr>
									<tr>
										<td>&nbsp; 상품 분류</td>
										<td colspan="2">&nbsp; &nbsp; 
										
										 <select  id="first"  name="pro_bigcate" style="width: 70px;" onchange="itemChange(this.form);"></select>
      									  <select id="second" name="pro_smallcate" style="width: 70px;"></select>
      		
										색상&nbsp;<input type="text" class="t" name="pro_color"> 사이즈&nbsp;<input
											type="text" name="pro_size" class="t"> 수량&nbsp;<input
											type="number" name="pro_ea" class="t">

										</td>

									</tr>

									<tr>
										<td>&nbsp; 상품 상세설명</td>
										<td colspan="2"><div class="toast-custom-editor" >
									
										</div></td>

									</tr>
									<tr>
										<td>&nbsp;이미지</td>
										<td class="ph">
											<div id="titleImgArea">
												<img id="titleImg"  name="im1" width="300" height="300">
											</div>
										</td>
										<td class="ph">

											<div id="contentImgArea1" class="photoC">
												<img id="contentImg1" name="im2" width="120" height="100">
											</div>
											<div id="contentImgArea2" class="photoC">
												<img id="contentImg2" name="im3" width="120" height="100">
											</div>
										</td>
									</tr>
								</table>
								<div id="fileArea">
									<!-- onchange 요소가 바뀌면 동작 this를 function에 전달 자기 자신 -->
									<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this, 1)"> 
									<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this, 2)"> 
									<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this, 3)">

								</div>


							</div>

						</div>

						<div id="mid-2" class="mid">
							<img
								src="${pageContext.request.contextPath }/resources/img/product/mid-2.png">
							<div>
								<div class="m2"></div>
								<table>
									<tr>
										<td>&nbsp;공급가</td>
										<td>&nbsp;&nbsp;<input type="number" name="st_price"  ></td>
									</tr>
									<tr>
										<td>&nbsp;소비자가</td>
										<td>&nbsp;&nbsp;<input type="number" name="pro_conprice" ></td>
									</tr>

								</table>
							</div>
						</div>
						<div id="mid-3" class="mid">
							<img
								src="${pageContext.request.contextPath }/resources/img/product/mid-3.png">
							<div>
								<div class="m2"></div>

								<table>
									<tr>
										<td>&nbsp;공급사</td>
										<td>&nbsp; <select name="st_company" id="supply">
												<c:forEach var="supplier" items="${sup}">
													<option id="ownsu">${supplier.sup_name}</option>
												</c:forEach>
										</select> &nbsp;
											<input class="bt" id="myBtn2" type="button" value="등록" style="width:100px; height:30px">
										</td>
									</tr>


									<tr>


										<td>&nbsp;제조사</td>
										<td>&nbsp; <select name="st_factory" id="made">

												<c:forEach var="manuf" items="${list}">
													<option id="ownmd">${manuf.manu_name}</option>
												</c:forEach>
										</select> &nbsp;
											<input class="bt" id="myBtn" value="등록" type="button" style="width:100px; height:30px" >
										</td>
									</tr>
									<tr>
										<td>&nbsp;제조일자</td>
										<td>&nbsp;&nbsp;<input type="date" id="date" name="st_date"></td>
									</tr>

									<tr>
										<td>&nbsp;원산지</td>
										<td>&nbsp; <select id="select1" name="a" onchange="itemChange();">
												<option>국내</option>
												<option>국외</option>

										</select> &nbsp; <select id="select2" name="b">
												<option>선택하시오</option>
												<option>서울특별시</option>
												<option>부산광역시</option>
												<option>대구광역시</option>
												<option>인천광역시</option>
												<option>광주광역시</option>
												<option>대전광역시</option>
												<option>울산광역시</option>
												<option>세종특별자치시</option>
												<option>경기도</option>
												<option>강원도</option>
												<option>충청북도</option>
												<option>충청남도</option>
												<option>전라북도</option>
												<option>전라남도</option>
												<option>경상북도</option>
												<option>경상남도</option>
												<option>제주특별자치도</option>
										</select>
										</td>
									</tr>
								</table>

							</div>

						</div>
							<button id="btSubmit"  type="submit" >상품 등록</button>
							<input  type="hidden" id="h" name="pro_detail"  >
							<input  type="hidden"  name="pro_status"  value="N"  >
						</div>
	</form>
				</article>
			</section>
	</div>
	



	<script>
		function itemChange() {

			var korea = [ "서울특별시", "부산광역시", "대구광역시", "인천광역시", "인천광역시", "광주광역시",
					"대전광역시", "울산광역시", "세종특별자치시", "경기도", "강원도", "충청남도", "충청북도",
					"전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도" ];

			var abroad = [ "아시아", "아메리카", "유럽", "아프리카", "오세아니아" ];
			var selectItem = $("#select1").val();

			var changeItem;

			if (selectItem == "국내") {
				changeItem = korea;
			} else if (selectItem == "국외") {
				changeItem = abroad;
			}
			$('#select2').empty();

			for (var count = 0; count < changeItem.length; count++) {
				var option = $("<option>" + changeItem[count] + "</option>");
				$('#select2').append(option);

			}

		}

		$(function() {
			$("#fileArea").hide();

			$("#titleImgArea").click(function() {
				$("#thumbnailImg1").click();
			});
			$("#contentImgArea1").click(function() {
				$("#thumbnailImg2").click();
			});
			$("#contentImgArea2").click(function() {
				$("#thumbnailImg3").click();
			});
		});

		function loadImg(value, num) {
			//객체가 존재하는가 true files 여러개 올릴 수 있음 그중0번째 file을 올리면 files 값 존재
			if (value.files && value.files[0]) {
				var reader = new FileReader();

				//reader onload 되면 function 실행
				reader.onload = function(e) {

					switch (num) {
					case 1:
						$("#titleImg").attr("src", e.target.result);
						break;
					case 2:
						$("#contentImg1").attr("src", e.target.result);
						break;
					case 3:
						$("#contentImg2").attr("src", e.target.result);
						break;
					}
					//사진을 보여줄 곳에
					//이미지가 발생한 곳의 result src 속성값을 바꿈
					//e.target.result 무엇이기에 src를 바꾸는가..
					//$("#titleImg").attr("src",e.target.result)
					//사진데이터를 문자열로 바꿈 01010 base64 인코딩 방식으로
					//console.log(e.target.result);
					//e.target.result 사진을 문자로 바꿔서 임시로 브라우저에서 가지고 있는 것
				}

				//읽어드림 읽어드리면서 위 function 동작
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>



	<script>
		const editor = new toastui.Editor({
			el : document.querySelector(".toast-custom-editor"),
			initialEditType:'wysiwyg'
			
			
			
			
		});
		$("#btSubmit").on('click',function(){
			var test = editor.getMarkdown();
			var hidden = $("#h");
			hidden.val(test);
					
		});
		// Get the modal
		var modal = document.getElementById('myModal');
		var modal2 = document.getElementById('myModal2');

		// Get the button that opens the modal
		var btn1 = document.getElementById("myBtn");
		var btn2 = document.getElementById("myBtn2");
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		var span2 = document.getElementById("ww");

		// When the user clicks on the button, open the modal 
		btn1.onclick = function() {

			modal.style.display = "block";
		}

		btn2.onclick = function() {
			modal2.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span2.onclick = function() {

			modal2.style.display = "none";
		}
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			} else if (event.target == modal2) {
				modal2.style.display = "none";
			}

		}

		function cancle() {
			modal.style.display = "none";
		}
		function cancle2() {
			modal2.style.display = "none";
		}
		

	</script>
	<script>
    var f_selbox = new Array ('top' , 'pants' , 'shirts' , 'outer','shoes','bag');
    var s_selbox = new Array();
    s_selbox[0] = new Array('맨투맨 & 후드티','니트','긴팔티' , '반팔티' , '나시');
    s_selbox[1] = new Array('슬랙스','면바지','청바지','반바지');
    s_selbox[2] = new Array('베이직','청남방' , '체크&남방','스트라이프');
    s_selbox[3]  = new Array('패딩','코트','자켓' ,'가디건 & 조끼','후드&집업');
    s_selbox[4]  = new Array('스니커즈','로퍼&구두','슬리퍼&샌들');
    s_selbox[5]  = new Array('백팩','토트&숄더백','클러치' );
    function init (f){
        var f_sel = f.first;
        var s_sel = f.second;

        f_sel.options[0] = new Option("선택" , "");
        s_sel.options[0] = new Option("선택" ,"");

        for(var i =0; i<f_selbox.length; i++){
            f_sel.options[i+1] = new Option(f_selbox[i], f_selbox[i]);
        }
    }


    function itemChange(f){
        var f_sel = f.first;
        var s_sel = f.second;

        var sel = f_sel.selectedIndex;
      
        for(var i = s_sel.length; i>=0; i--){
            s_sel.options[i] = null;
        }
        s_sel.options[0] = new Option("선택" ,"");
        if(sel != 0){
           
                    for(var i=0; i<s_selbox[sel-1].length; i++){
                        s_sel.options[i+1] = new Option(s_selbox[sel-1][i] ,s_selbox[sel-1][i]);
                    }
                

            }
        }


    
    </script>


</body>
</html>