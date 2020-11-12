<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- CSS style-->
 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/reset.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css">
	
</head>
<body>
	<!-- 수정 수정 -->
  
    <%-- 고정되는 부분입니다.아래 메뉴에 자기부분 채워넣어주세요.^^  --%>
        <!--header -->
        <header>
            <h1 onclick="location.href='${pageContext.request.contextPath }/member'">
                <img src="${pageContext.request.contextPath }/resources/img/common/logo1.png" alt="logo">
           
            </h1>
            <ul class="sideMenu">
                
                  
                <li class="menu">
                    <div>
                         <img src="${pageContext.request.contextPath }/resources/img/common/G1.png" >
                        <a href="#">근태관리</a>
                    </div>
                    <ul class="hideShow side">
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                    </ul>
                </li>
                
                <li class="menu">
                    <div>
                         <img src="${pageContext.request.contextPath }/resources/img/common/G2.png" >
                        <a href="#">전자결제</a>
                    </div>
                    <ul class="hideShow side">
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                    </ul>
                </li>
                <li class="menu">
                    <div>
                          <img src="${pageContext.request.contextPath }/resources/img/common/G3.png" >
                        <a href="#">유저관리</a>
                    </div>
                    <ul class="hideShow side "> 
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                    </ul>
        
                    
                </li>
                <li class="menu">
                    <div>
                          <img src="${pageContext.request.contextPath }/resources/img/common/G4.png" >
                        <a href="#">게시판 관리</a>
                    </div>  
                    <ul class="hideShow side ">   
                   		<li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                	 </ul>
                <li class="menu">
                    <div>
                        <img src="${pageContext.request.contextPath }/resources/img/common/G6.png" >
                        <a href="#">상품관리</a>
                    </div>
                    <ul class="hideShow side">
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                    </ul>
                </li>
                <li class="menu">
                    <div>
                        <img src="${pageContext.request.contextPath }/resources/img/common/G5.png" >
                        <a href="#">재고 관리</a>
                    </div>
                    <ul class="hideShow side">
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                    </ul>
                </li>
             
                
            </ul>      

        </header>

        

    <!-- 변하는 영역입니다. 자기부분에 article생성해서 사용해주세요!  -->
        

        <section class="contents">
            <div class="topmenu">
                <div>
                    
                    <span class="name">김경민</span>
                    <span>님 안녕하세요</span>
                    <a href="#" id="hideMenu">▼</a>
                </div>
                <!-- 아래 화살표 script로 a죽이기-->
                <ul class="hideMenu">
                    <li>WELCOME!</li>
                    <li><a href="#">프로필 정보 수정</a></li>
                    <li><a href="#">비밀번호 변경</a></li>
                    <li class="bar"><a href="#">로그아웃</a></li>
                </ul>
            </div>

            <!-- article 여기부분을 잘라서 사용하세요! -->
            <article>
                <!-- 내용작성을 이곳에서~ -->
                
                <%-- 
                	<div class="conWrap"> 
                		height 값 임의로 주었습니다. 수정해서 사용하세요.
                		스타일이 적용되어있습니다. 
                		div외의 다른 것을 사용하고 싶다면 
                		클래스이름만 가져가시고, hegiht값 수정해서 사용하시면 됩니다.
     
                	</div>
                 --%>

            </article>

        </section>
         <!-- //contents-->


    </div> 
    
    <script>
        $(function(){
            var ht = $(window).height();
            
            /* $("header").height(ht); */
            $(".sideMenu li.menu>a").click(function(){
                $(this).toggleClass('color');
                $('.sideMenu li.menu div>a').removeClass();
                $(this).parent().siblings().children('ul').hide();
            });
            $(".sideMenu li.menu div").click(function(e){
                e.preventDefault();
                $(".sideMenu li.menu").children('li>a').removeClass('color');
                $(".sideMenu li.menu div a").removeClass();
                $(".sideMenu li.menu ul").hide();
    
                $(this).children('div>a').toggleClass('borderB');
                $(this).children('div>a').toggleClass('color');             
                $(".menu a").eq(0).removeClass('borderB');
                $(this).siblings('.hideShow').toggle();             
            });
            $("#hideMenu").click(function(){         
                $(".hideMenu").toggleClass('hideShowMenu');
            });
        });
        
        function enter() {
        	location.href="${pageContext.request.contextPath}selectEnter.ma";
        }
    </script>



</body>
</html>