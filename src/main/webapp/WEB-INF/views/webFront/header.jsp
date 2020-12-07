<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	a { 
		text-decoration:none;
		color: black; 
	} 

	.header{
		width:1200px;
	}
	.header_top_wrap{
		width: 1200px;
		height: 45px;
		margin:0 auto;
		border-bottom: 1px solid;
		border-bottom-color: #a0a0a0;
	}
	.header_top_left{
		width: 50%;
		height: 45px;
		float: left;
	}
	.header_top_right{
		width:50%;
		height: 45px;
		float: right;
	}
	.header_top_rightbar{
		margin-left: 150px;
	}
	.header_top_leftbar li{
		list-style-type: none;
		float: left; 
		margin-right: 20px;
	}

	.header_top_rightbar li{
		list-style-type: none;
		float: left;
		margin-left: 20px;
	} 
	.header_top_rightbar li a{
		width: 30px;
		height: 50px;
	}
	.header_top_rightbar li a img{
		position: absolute;
    	margin-top: -5px;
	}
	
	
	
	.header_mid{
		width: 1200px;
		margin:0 auto;
	}
	.mid_img{
		margin:0 auto;
		width: 340px;
		height: 340px;
	}
	
	.header_main {
		width: 1200px;
		height: 50px;
		margin:0 auto;
		border-top: 1px solid;
		border-bottom: 1px solid;
		border-bottom-color: #a0a0a0;
		
	}
	.header_mainMenu{
		float: left;
	}
	
	.menu1{
		list-style-type: none;
		float: left;
		margin-right: 60px;
		position: relative;
	}
	.menu2{
		list-style-type: none;
		padding-left:0px;
		display: none;
    	margin-block-start: 0px;
    	margin-block-end: 0px;
	}

	
	
</style>
</head>
<body>	
	<!-- 상단바  -->
	<div id="header">
		<!-- 상단바 _ top 메뉴 -->
		<div class="header_top_wrap">
			<div class="header_top_left">
				<ul class="header_top_leftbar">
					<li><a href="center">CENTER</a></li>
					<li><a href="">REVIEW</a></li>
				</ul>
			</div>
			<div class="header_top_right">
			<c:if test="${ empty sessionScope.loginUser }">
				<ul class="header_top_rightbar">
					<li><a href="${pageContext.request.contextPath }/webFront/login">LOGIN</a></li>
					<li><a href="${pageContext.request.contextPath }/webFront/join">JOIN</a></li>
					<li><a href="">MY PAGE</a></li>
					<li><a href="">ORDER</a></li>
					<li><a href=""><img src="${pageContext.request.contextPath }/resources/img/webFront/bb.PNG" alt="장바구니"/></a></li>
				</ul>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<ul class="header_top_rightbar">
					<li><a href=""><c:out value="${ sessionScope.loginUser.user_name }"/> 님</a></li>
					<li><a href="${pageContext.request.contextPath }/webFront/logout">LOGOUT</a></li>
					<li><a href="">MY PAGE</a></li>
					<li><a href="">ORDER</a></li>
					<li><a href=""><img src="${pageContext.request.contextPath }/resources/img/webFront/bb.PNG" alt="장바구니"/></a></li>
				</ul>
			</c:if>
			</div>
	
		</div>
		<!-- 로고 이미지  -->
		<div class="header_mid">
			<div class="mid_img">
				<a>
					<img src="${pageContext.request.contextPath }/resources/img/webFront/webLogo.png"/>
				</a>
			</div>
		</div>
		<!-- 쇼핑몰 메뉴 -->
		<div class="header_main">
			<div class="header_mainMenu">
				<ul class="header_mainMenubar">
					<li class="menu1">
						<a href="">BEST</a>
					</li>
					<li class="menu1">
						<a href="">TOP</a>
						<ul class="menu2">
							<li><a href="">맨투맨 & 후드티</a></li>
							<li><a href="">니트</a></li>
							<li><a href="">긴팔티</a></li>
							<li><a href="">반팔티</a></li>
							<li><a href="">나시</a></li>
						</ul>
					</li>
					<li class="menu1">
						<a href="">PANTS</a>
						<ul class="menu2">
							<li><a href="">슬랙스</a></li>
							<li><a href="">면바지</a></li>
							<li><a href="">청바지</a></li>
							<li><a href="">반바지</a></li>
						</ul>
					</li>
					<li class="menu1">
						<a href="">SHIRTS</a>
						<ul class="menu2">
							<li><a href="">베이직</a></li>
							<li><a href="">청남방</a></li>
							<li><a href="">체크&남방</a></li>
							<li><a href="">스트라이프</a></li>
						</ul>
					</li>
					<li class="menu1">
						<a href="">OUTER</a>
						<ul class="menu2">
							<li><a href="">패딩</a></li>
							<li><a href="">코트</a></li>
							<li><a href="">자켓</a></li>
							<li><a href="">가디건&조끼</a></li>
							<li><a href="">후드&집업</a></li>
						</ul>
					</li>
					<li class="menu1">
						<a href="">SHOES</a>
						<ul class="menu2">
							<li><a href="">스니커즈</a></li>
							<li><a href="">로퍼&구두</a></li>
							<li><a href="">슬리퍼&샌들</a></li>
						</ul>
					</li>
					<li class="menu1">
						<a href="">BAG</a>
						<ul class="menu2">
							<li><a href="">백팩</a></li>
							<li><a href="">토트&숄더백</a></li>
							<li><a href="">클러치</a></li>
						</ul>
					</li>
					<li class="menu1"><input type="text"/></li>					
					<li class="menu1">
						<div>
							<a><img src="" alt="검색이미지"/></a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	
	</div>
 <script type="text/javascript">

	jQuery('.menu1').hover(
						function() {
		   	 				jQuery('.menu2', this).stop().slideDown(200);
		 				},
		 				function() {
		    				jQuery('.menu2', this).stop().slideUp(200);
		 				}
	);
 
</script> 

</body>
</html>