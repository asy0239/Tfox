<jsp:directive.page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
* {
	box-sizing: border-box
}

/* 슬라이드쇼 컨테이너의 디자인 */
.slideshow-container {
	max-width: 1200px;
	position: relative;
	margin: 10px auto;
}

/* 이미지를 숨기는데 사용 */
.mySlides {
	display: none;
}

/* 다음, 이전 버튼 */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

/* "다음 버튼"을 오른쪽에 위치 */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* 마우스를 올리면 배경색을 변경 */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* 캡션 부분 */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* 숫자 부분 위에 적은 (1/3) <-- 이런거 */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* 하단의 점들 */
.dot {
	cursor: pointer;
	height: 10px;
	width: 10px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease; 
}

.active, .dot:hover {
	background-color: #717171;
}

/* 페이드 효과 */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}
}
</style>
</head>
<body>
	<div>
		<%@ include file="/WEB-INF/views/webFront/header.jsp"%>
		<div class="slideshow-container">

			<!-- 숫자와 캡션이 있는 이미지 -->
			<div class="mySlides fade" align="center">
				<div class="numbertext">1 / 3</div>
				<img src="${pageContext.request.contextPath }/resources/img/webFront/main1.PNG" style="width: 100%; height: 600px;">
				<div class="text">첫 번째 사진</div>
			</div>

			<div class="mySlides fade">
				<div class="numbertext">2 / 3</div>
				<img src="${pageContext.request.contextPath }/resources/img/webFront/main2.PNG" style="width: 100%; height: 600px;">
				<div class="text">두 번째 사진</div>
			</div>

			<div class="mySlides fade">
				<div class="numbertext">3 / 3</div>
				<img src="${pageContext.request.contextPath }/resources/img/webFront/main3.PNG" style="width: 100%; height: 600px;">
				<div class="text">세 번째 사진</div>
			</div>

			<!-- 다음, 이전 이미지 버튼 -->
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>
		</div>

		<!-- 현재 이미지를 알려주는 하단의 점 -->
		<div style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span>
		</div>
	</div>
	<br>
	<h1 align="center"> BEST </h1>
	
	<div> </div>
	<script type="text/javascript">
		var slideIndex = 1;
		showSlides(slideIndex);

		// 다음, 이전 제어
		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		// 사진 제어
		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
	</script>





</body>
</html>