<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>main-food.jsp</title>

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


  <!--로그인 팝업창 jquery-->
<script>
    $(document).ready(function(){
      //member-login에 있는 a태그에 click이벤트를 걸어준다.
      $('.member-login').find('a').on('click', function(e){
        e.preventDefault();//하이퍼링크 실행 막기
        //login-box를 띄운다.
        $('.login-box').bPopup({
          modalClose: true, //다른곳 클릭하면 팝업창 닫힘
          speed: 650,
          opacity:0.5,
          transition: 'slideIn', //실행시 동작
           transitionClose: 'slideBack' //실행종료시 동작
        })
      })
      //member-login에 걸은 이벤트 코드종료
<!--로그인 팝업창 jquery-->



<!--회원가입 팝업창 jquery-->
      $("#checkId").on("click", function(){
         var inputId = $("#joinId").val(); //사용자가 입력한 값을 가져온다.
         
         $.ajax({//중괄호 안에선 ;안된다.
            //옵션
            url : "/YYProject/user", //매핑값
            type : "post",
            data : {id : inputId, actionName:"checkId"}, //url로 갈때 가져갈 값
            dateType : "text", //ajax가 처리하고 돌아왔을때(joinAction같은것의(갔다가 dao를 간다) 리턴타입의 자료형) 데이터의 자료형
           //json은 배열, vo객체를 담아줄때 사용한다.
           success : function(result){//url로 갔다가 성공처리되면 실행된다.
                 //중복이면 0 아니면 1
                 //스크립트에선 number로 한다
              if(Number(result)==1){ //숫자로 형변환
                 //중복되지 않음
               alert('사용가능한 아이디입니다.');
              }else if(Number(result)==0){
               alert('중복된 아이디입니다.');  
              }
           }
         })
      })  
      //member-join에 있는 a태그에 click이벤트를 걸어준다.
      $('.member-join').find('a').on('click', function(e){
        e.preventDefault();//하이퍼링크 실행 막기
        //join-box를 띄운다.
        $('.join-box').bPopup({
          modalClose: true, //다른곳 클릭하면 팝업창 닫힘
          speed: 650,
          opacity:0.5,
          transition: 'slideIn', //실행시 동작
          transitionClose: 'slideBack' //실행종료시 동작
        })
      })
      //member-join에 걸은 이벤트 코드종료

      
      //비밀번호 일치 불일치
      var password = $('#password').val;
      var repassword = $('#repassword').val;
      
      $('#repassword').on('keyup', function(){//key가 올라가면
         
       var password = $('#password').val();
       var repassword = $('#repassword').val();
       
       if(password!=repassword){ //일치하지 않는다면
          $('#checkPassword').html('비밀번호 불일치');
          $('#checkPassword').css('color', 'red');   
          $('#checkPassword').css('font-weight', 'bold');
          $('#join-button').attr('disabled', 'disabled'); //불일치하면 가입버튼이 안눌림
       }else if(password==repassword){ //일치한다면
          $('#checkPassword').html('비밀번호 일치');
          $('#checkPassword').css('color', 'green');
          $('#checkPassword').css('font-weight', 'bold');
          $('#join-button').removeAttr('disabled');
       }else{//아무것도 입력되지 않았다면
          $('#checkPassword').html(''); //아무것도 출력하지 않는다.
         $('#checkPassword').css('color', 'black');
          $('#checkPassword').css('font-weight', 'bold');
          $('#join-button').attr('disabled', 'disabled'); //비어있다면 가입버튼이 안눌림
       }
      })
      // 비밀번호 일치 불일치
      
      // search 검색
      $('#search').on('keyup', function(e){	// keyup : 키를 눌렀다 뗐을때발생, keydown : 키를 누를때
			
    	  var keyword = $(this).val();	// val = value
		  var type = $('#type').val();	
    	  
    	  if(e.keyCode == 13){	// keyCode=13 이 엔터. 엔터쳤을 때 보냄.
    	  	 location.href = '/YYProject/user?actionName=search&k='+keyword+'&t='+type;
    	  }
      })
      
      // search icon 클릭 
      $('#searchi').on('click', function(e){	// a 태그는 기본적으로 이벤트를 가지고 있으므로 e에 담아줘야 함 
    	 e.preventDefault();	// a 태그에 있는 이벤트를 지운다 -> a 태그에 이벤트 적용할 때 무조건 사용함! 
      
    	 var keyword = $(this).val();	// val = value
		 var type = $('#type').val();	
    	 
    	 location.href = '/YYProject/user?actionName=search&k='+keyword+'&t='+type;
      })
    })
    

 </script>



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
          	<div class="menu-food-i">
          		<i class="fas fa-check"></i><!-- check 아이콘 -->
          	</div>
			<a href="main-food.jsp"> <img src="img/food.png">
				<p>Food</p>
			</a>
		  </div>
          <!-- menu-food -->

          <!-- menu-cafe -->
          <div class="menu-cafe">
            <a href="main-cafe.html"><img src="img/cafe.png">
            <p>Cafe</p></a>
          </div>
          <!-- menu-cafe -->

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
          <input type="password" name="password" placeholder="password" autocomplete="off">
        </div>
        <div class="join-repassword">
          <i class="fas fa-unlock"></i>
          <input type="password" name="repassword" placeholder="repassword" autocomplete="off">
        </div>
        <div class="join-email">
          <i class="fas fa-envelope"></i>
          <input type="email" name="email" placeholder="e-mail" autocomplete="off">
        </div>
      </div>
      <div class="join-bottom">
        <div class="join-button">
          <input type="submit" value="join">
        </div>
      </div>
    </form>
  </div>
  <!-- join Popup -->

</body>
</html>
