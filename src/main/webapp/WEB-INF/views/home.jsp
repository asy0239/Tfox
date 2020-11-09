<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
	div#context {
	height: 45%; width: 420px; border:1px solid ;

	margin : auto;
	margin-top : 13%;
	
	background-color: white;
	
	}
	#frame {
	border: 1px solid white;
	height : 1300px;
	width : 90%;

	margin-left : 5%;
	background-image: url('resources/img/login/bar.png');
	background-size: contain;
	
	background-repeat:no-repeat;
	background-size: 80% 100% ; 
	
	
	
	
	}
	#context > div:first-child img{
		height: 130px;
		width: 420px;
	}
	
	#context > div:nth-child(2){
		hight: 130px;
		wiidth: 150px;
	}
	

</style>
<body>
<div id="frame">
	<div id="context">
		<div>
			<img src="resources/img/login/cover.png">
		</div>
		<div>
			<input type="text">
		</div>
		<div>
			<input type="text">
		</div>
	</div>
</div>		<!-- <img src="resources/img/bar.png"> -->
	
</body>