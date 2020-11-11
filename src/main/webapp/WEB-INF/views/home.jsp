<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
	div#context {
	height: 600px; width: 950px; 

	margin : auto;
	margin-top : 15%;
	
	background-color: white;
	
	}
	#frame {
	border: 1px solid white;
	height : 1000px;
	width: 1400px;
	margin: auto;

	background-image: url('resources/img/login/background.png');

	}
	
	table{
	margin: auto; text-align:center;;
	}

	
	#context > div:nth-child(2){
		hight: 130px;
		wiidth: 150px;
	}
	
	.flot{
		float: left;	
	}
	.clear{
		clear:both;
	}
	table,tr, td {
		border-collapse:collapse;
		
		text-align:center;
	
	}
#top{

	height: 100px;
}
#top-a{
	height: 150px;
}
#mid{
	height: 30px;
}

button{
  background-color: #5A5B68;
		color: white;
	height: 92px;
	border-radius:0.7em;
	width: 95px;
}
input{
	 text-align:center; width:160px; height:30px; letter-spacing: 1.5px
}

button:hover{
	background-color: white;
	color: #5A5B68;
	
}
.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  left: -5px;
  transition: 0.5s;
}

.button:hover span {
  padding-left: 15px;
}

.button:hover span:after {
  opacity: 1;
  left: 0;
}
span{
	font-size: 20px;
}

</style>
<body>
<form name='homeForm' method="get" action="member">
	<div id="top"></div>
	<div id="frame" style="text-align:center; margin:0 auto;">
		<div id="context">
			<div id="top-a"></div>
			<div class="clear">
				<img src="resources/img/login/main.png">
			</div>
			<div id="mid"></div>
			<div>
			
			
				
				<table>
					<tr>
						<td width="50" height="50"><b>ID</b> </td> 
						<td width="170"><input type="text"></td>
						<td rowspan="2"><button class="button"><span><b>Login</b></span></button></td>
					</tr>
					<tr>
						<td width="50" height="50"> <b>PW</b> </td>
						<td><input type="text"></td>
					</tr>
				</table>		
				
			</div>
		</div>
	</div>	
</form>	
</body>