<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>PPick : 전국 맛집 사이트</title>

  <!-- Reset.css -->
  <link rel="stylesheet" href="css/reset.css">
  <!-- MainStyle.css -->
  <link rel="stylesheet" href="css/main-food-style.css">
  <!-- Member.css -->
  <link rel="stylesheet" href="css/member-style.css">
  <!-- fontawesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

  <!-- Font -->
  <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">
  <!-- Point Font -->
  <link href="https://fonts.googleapis.com/css?family=Baloo+Tammudu" rel="stylesheet">

  <script src='js/jquery-3.3.1.min.js'></script>  <!-- jquery 먼저 선언 -->
  <script src='js/jquery.bpopup.min.js'></script>	<!-- 팝업창을 위한 파일 -->
  <script src='js/main.js'></script>

</head>
<body>
  <!-- Wrap -->
  <div id="wrap">

    <!-- Container -->
    <div id="container">

      <!-- Header -->
      <div class="header">

        <!-- menu -->
        <div class="menu">

          <!-- menu-food -->
          <div class="menu-food">
			<a href="main-food.jsp"> <img src="img/food.png">
				<p>Food</p>
			</a>
		  </div>
          <!-- menu-food -->

        </div>
        <!-- menu -->

        <!-- logo -->
        <div class="logo">
          <a href="main-food.jsp"><p>PPick!</p></a>
        </div>
        <!-- logo -->

        <!-- member -->
        <%
        	String sessionID = (String)session.getAttribute("sessionID");

        	if(sessionID != null){
        %>
        <!-- sessionID가 있을 경우  → 로그인 했을 경우 -->
       		<div class="member2">
               <div class="member-user">
                  <a href="mypage.jsp">
                     <p>${sessionID}'s </p>
                  </a>
               </div>
               <!--로그아웃-->
               <div class="member-logout">
                  <a href="/YYProject/user?actionName=userLogout" ><img src="img/logout.png">
                     <p>Logout</p>
                  </a>
               </div>
            </div>

        <%
        	} else{
        %>
        <!-- sessionID가 없을 경우 -->
        <div class="member">
          <!-- member-login -->
          <div class="member-login">
            <a href="#"><img src="img/login.png">
            <p>Login</p></a>
          </div>
          <!-- member-login -->

          <!-- member-join -->
          <div class="member-join">
            <a href="#"><img src="img/join.png">
            <p>Join</p></a>
          </div>
          <!-- member-join -->

        </div>
        <%
        	}
        %>
        <!-- member -->

      </div>
      <!-- Header -->

      <!-- Contents -->
      <div class="contents">

        <!-- bar -->
        <div class="bar">
		  
		  <!-- search-type -->
		  <div class="search-type">
		  	<select name="type" id="type">
		  		<option value="tbName">가게명</option>
		  		<option value="tbLocation">주소</option>
		  		<option value="tbHash">#</option>
		  	</select>
		  </div>
		  <!-- search-type -->
          
          <!-- search-bar -->
          <div class="search-bar">
            <input type="text" name="search" id="search" placeholder="검색어를 입력하세요.">
            <a href="#" id="searchi"><i class="fas fa-search"></i></a>
          </div>
          <!-- search-bar -->

          <!-- hash -->
          <div class="hash">
            <a href="/YYProject/user?actionName=search&t=tbHash&k=데이트">
            	<p>#데이트</p>
            </a>
            <a href="/YYProject/user?actionName=search&t=tbHash&k=분위기깡패">
           		<p>#분위기깡패</p>
            </a>
            <a href="/YYProject/user?actionName=search&t=tbHash&k=친구랑">
            	<p>#친구랑</p>
            </a>
            <a href="/YYProject/user?actionName=search&t=tbHash&k=인스타감성">
            	<p>#인스타감성</p>
            </a>
          </div>
          <!-- hash -->

        </div>
        <!-- bar -->

        <!-- container -->
        <div class="container">

          <!-- Seoul -->
          <div class="seoul">
            <a href="/YYProject/user?actionName=list&l=서울">
              <div class="box-title">
                <h1>서울</h1>
              </div>
              <img src="img/seoul.JPG">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>서울</h1>
              </div>
            </a>
          </div>
          <!-- Seoul -->

          <!-- Incheon -->
          <div class="incheon">
            <a href="/YYProject/user?actionName=list&l=인천">
              <div class="box-title">
                <h1>인천</h1>
              </div>
              <img src="img/incheon.jpg">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>인천</h1>
              </div>
            </a>
          </div>
          <!-- Incheon -->

          <!-- Busan -->
          <div class="busan">
            <a href="/YYProject/user?actionName=list&l=부산">
              <div class="box-title">
                <h1>부산</h1>
              </div>
              <img src="img/busan.jpg">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>부산</h1>
              </div>
            </a>
          </div>
          <!-- Busan -->

          <!-- Jeju -->
          <div class="jeju">
            <a href="/YYProject/user?actionName=list&l=제주도">
              <div class="box-title">
                <h1>제주도</h1>
              </div>
              <img src="img/jeju.JPG">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>제주도</h1>
              </div>
            </a>
          </div>
          <!-- Jeju -->

          <!-- Gyeonggi -->
          <div class="gyeonggi">
            <a href="/YYProject/user?actionName=list&l=경기도">
              <div class="box-title">
                <h1>경기도</h1>
              </div>
              <img src="img/gyeonggi.jpg">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>경기도</h1>
              </div>
            </a>
          </div>
          <!-- Gyeonggi -->

          <!-- Gyeongsang -->
          <div class="gyeongsang">
            <a href="/YYProject/user?actionName=list&l=경상도">
              <div class="box-title">
                <h1>경상도</h1>
              </div>
              <img src="img/gyeongsang.jpg">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>경상도</h1>
              </div>
            </a>
          </div>
          <!-- Gyeongsang -->

          <!-- Jeonla -->
          <div class="jeonla">
            <a href="/YYProject/user?actionName=list&l=전라도">
              <div class="box-title">
                <h1>전라도</h1>
              </div>
              <img src="img/jeonla.jpg">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>전라도</h1>
              </div>
            </a>
          </div>
          <!-- Jeonla -->

          <!-- Gangwon -->
          <div class="gangwon">
            <a href="/YYProject/user?actionName=list&l=강원도">
              <div class="box-title">
                <h1>강원도</h1>
              </div>
              <img src="img/gangwon.jpg">
              <div class="cover">

              </div>
              <div class="cover-title">
                <h1>강원도</h1>
              </div>
            </a>
          </div>
          <!-- Gangwon -->

        </div>
        <!-- container -->

      </div>
      <!-- Contens -->

      <!-- Footer -->
      <div class="footer">

        <!-- footer-top -->
        <div class="footer-top">
          <p>PPick!</p>
        </div>
        <!-- footer-top -->

        <!-- footer-bottom -->
        <div class="footer-bottom">
          <p>
            (주)YYcompany<br>
          	 박아영 a01259@naver.com / 이유진 dnfldkqkalsk@naver.com<br>
            Copyright© 2018-09-03       Park A young, Lee yu jin
          </p>
        </div>
        <!-- footer-bottom -->

      </div>
      <!-- Footer -->

    </div>
    <!--container-->

  </div>
  <!-- Wrap -->

  <!-- login Popup -->
  <div class="login-box">
    <form action="/YYProject/user" method="post">
	<input type="hidden" name="actionName" value="userLogin">
      <div class="login-top">
        <h1>LOGIN</h1>
      </div>
      <div class="login-middle">
        <div class="login-id">
          <i class="fas fa-user"></i>
          <input type="text" name="id" placeholder="id" autocomplete="off" id="userId" autofocus="autofocus">
          <!-- autocomplete="off" : 자동완성 x -->
        </div>
        <div class="login-password">
          <i class="fas fa-unlock"></i>
          <input type="password" name="password" placeholder="password" autocomplete="off" id="userPwd">
        </div>
      </div>
      <div class="login-bottom">
        <div class="login-button">
          <input type="submit" value="login">
        </div>
        <div class="forget-pwd">
          <a href="mypage.jsp"><p>forget password?</p></a>
        </div>
      </div>

    </form>
  </div>
  <!-- login Popup -->

  <!-- join Popup -->
  <div class="join-box">
    <form action="/YYProject/user" method="post">
    <input type="hidden" name="actionName" value="userJoin">
      <div class="join-top">
        <h1>JOIN</h1>
      </div>
      <div class="join-middle">
        <div class="join-name">
          <i class="fas fa-user"></i>
          <input type="text" name="name" placeholder="name" autocomplete="off" autofocus="autofocus">
        </div>
        <div class="join-id">
          <i class="fas fa-user"></i>
          <input type="text" name="id" id="joinId" placeholder="id" autocomplete="off">
      	  <a href="#" id="checkId">check id</a>
        </div>
        <div class="join-password">
          <i class="fas fa-unlock"></i>
          <input type="password" name="password" id="password" placeholder="password" autocomplete="off">
        </div>
        <div class="join-repassword">
          <i class="fas fa-unlock"></i>
          <input type="password" name="repassword" id="repassword" placeholder="repassword" autocomplete="off">
          <p id="checkPassword"></p> <!-- 비밀번호 일치or불일치 나타남 -->
        </div>
        <div class="join-email">
          <i class="fas fa-envelope"></i>
          <input type="email" name="email" placeholder="e-mail" autocomplete="off">
        </div>
      </div>
      <div class="join-bottom">
        <div class="join-button">
          <input type="submit" value="join" id="join-button" disabled><!-- 작동 or 작동x -->
        </div>
      </div>
    </form>
  </div>
  <!-- join Popup -->

</body>
</html>
