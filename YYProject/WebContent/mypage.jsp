<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>mypage.jsp</title>

<!-- Reset.css -->
<link rel="stylesheet" href="css/reset.css">
<!-- MainStyle.css -->
<link rel="stylesheet" href="css/main-food-style.css">
<!-- Mypage.css -->
<link rel="stylesheet" href="css/mypage-style.css">
<!-- Member.css -->
<link rel="stylesheet" href="css/member-style.css">
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!-- Font -->
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding"
	rel="stylesheet">
<!-- Point Font -->
<link href="https://fonts.googleapis.com/css?family=Baloo+Tammudu"
	rel="stylesheet">

<script src='js/jquery-3.3.1.min.js'></script>
<!-- jquery 먼저 선언 -->
<script src='js/jquery.bpopup.min.js'></script>
<!-- 팝업창을 위한 파일 -->


<!--로그인 팝업창 jquery-->
<script>
	var loginId = "${sessionID}";	// 전역변수를 선언해준다.
	$(document)
			.ready(
					function() {
						
						//member-login에 있는 a태그에 click이벤트를 걸어준다.
						$('.member-login').find('a').on('click', function(e) {
							e.preventDefault();//하이퍼링크 실행 막기
							//login-box를 띄운다.
							$('.login-box').bPopup({
								modalClose : true, //다른곳 클릭하면 팝업창 닫힘
								speed : 650,
								opacity : 0.5,
								transition : 'slideIn', //실행시 동작
								transitionClose : 'slideBack' //실행종료시 동작
							})
						})
						//member-login에 걸은 이벤트 코드종료
						//로그인 팝업창 jquery

						//회원가입 팝업창 jquery
						$("#checkId").on("click", function() {
							var inputId = $("#joinId").val(); //사용자가 입력한 값을 가져온다.

							$.ajax({//중괄호 안에선 ;안된다.
								//옵션
								url : "/YYProject/user", //매핑값
								type : "post",
								data : {
									id : inputId,
									actionName : "checkId"
								}, //url로 갈때 가져갈 값
								dateType : "text", //ajax가 처리하고 돌아왔을때(joinAction같은것의(갔다가 dao를 간다) 리턴타입의 자료형) 데이터의 자료형
								//json은 배열, vo객체를 담아줄때 사용한다.
								success : function(result) {//url로 갔다가 성공처리되면 실행된다.
									//중복이면 0 아니면 1
									//스크립트에선 number로 한다
									if (Number(result) == 1) { //숫자로 형변환
										//중복되지 않음
										alert('사용가능한 아이디입니다.');
									} else if (Number(result) == 0) {
										alert('중복된 아이디입니다.');
									}
								}
							})
						})
						//member-join에 있는 a태그에 click이벤트를 걸어준다.
						$('.member-join').find('a').on('click', function(e) {
							e.preventDefault();//하이퍼링크 실행 막기
							//join-box를 띄운다.
							$('.join-box').bPopup({
								modalClose : true, //다른곳 클릭하면 팝업창 닫힘
								speed : 650,
								opacity : 0.5,
								transition : 'slideIn', //실행시 동작
								transitionClose : 'slideBack' //실행종료시 동작
							})
						})
						//member-join에 걸은 이벤트 코드종료

						//비밀번호 일치 불일치
						var password = $('#password').val;
						var repassword = $('#repassword').val;

						$('#repassword').on('keyup', function() {//key가 올라가면

							var password = $('#password').val();
							var repassword = $('#repassword').val();

							if (password != repassword) { //일치하지 않는다면
								$('#checkPassword').html('비밀번호 불일치');
								$('#checkPassword').css('color', 'red');
								$('#checkPassword').css('font-weight', 'bold');
								$('#join-button').attr('disabled', 'disabled'); //불일치하면 가입버튼이 안눌림
							} else if (password == repassword) { //일치한다면
								$('#checkPassword').html('비밀번호 일치');
								$('#checkPassword').css('color', 'green');
								$('#checkPassword').css('font-weight', 'bold');
								$('#join-button').removeAttr('disabled');
							} else {//아무것도 입력되지 않았다면
								$('#checkPassword').html(''); //아무것도 출력하지 않는다.
								$('#checkPassword').css('color', 'black');
								$('#checkPassword').css('font-weight', 'bold');
								$('#join-button').attr('disabled', 'disabled'); //비어있다면 가입버튼이 안눌림
							}
						})
						// 비밀번호 일치 불일치

						// search 검색
						$('#search')
								.on(
										'keyup',
										function(e) { // keyup : 키를 눌렀다 뗐을때발생, keydown : 키를 누를때

											var keyword = $(this).val(); // val = value
											var type = $('#type').val();

											if (e.keyCode == 13) { // keyCode=13 이 엔터. 엔터쳤을 때 보냄.
												location.href = '/YYProject/user?actionName=search&k='
														+ keyword
														+ '&t='
														+ type;
											}
										})

						// search icon 클릭 
						$('#searchi')
								.on(
										'click',
										function(e) { // a 태그는 기본적으로 이벤트를 가지고 있으므로 e에 담아줘야 함 
											e.preventDefault(); // a 태그에 있는 이벤트를 지운다 -> a 태그에 이벤트 적용할 때 무조건 사용함! 

											var keyword = $(this).val(); // val = value
											var type = $('#type').val();

											location.href = '/YYProject/user?actionName=search&k='
													+ keyword + '&t=' + type;
										})

						// tap메뉴 구현 jquery
						$(document).ready(function() {

							$('ul.tabs li').click(function() {
								var tab_id = $(this).attr('data-tab');

								$('ul.tabs li').removeClass('current');
								$('.tab-content').removeClass('current');

								$(this).addClass('current');
								$("#" + tab_id).addClass('current');
							})
						})
						// tap메뉴 구현 jquery

						// mypage 비밀번호 찾기의 이메일과 아이디가 같은지 확인
						$('#find-email').on('keyup', function(e){
							
							if(e.keyCode==13){	// 13 = enter
								var id = $('#find-id').val();
								var email = $('#find-email').val();
								
								$.ajax({
									url : "/YYProject/foodWrite",
									type : "post",
									data : {
										// 변수명(getParameter로 읽을 값) : 실제 들어가있는 변수 값 위에서 지정해준.
										id : id,
										email : email,
										actionName : "findChangeIdEmail"
									},
									dataType : "text", 	// 값을 돌려받는 타입
									success : function(result){	// 성공했을 때 result받아옴
										// data타입이 text라서 Number로 바꿔준다.
										if(Number(result) == 1){
											$(".find-top2").css("opacity", "1");
										}else {
											alert('아이디와 이메일이 일치하지 않습니다.');
											$(".find-top2").css("opacity", "0");
										}
									}
								})
							}
						})
						// mypage 비밀번호 찾기의 이메일과 아이디가 같은지 확인
						
						// mypage 비밀번호 일치 불일치
						$('#find-repassword').on('keyup', function() {//key가 올라가면

							var find_password = $('#find-password').val();
							var find_repassword = $('#find-repassword').val();

							if (find_password != find_repassword) { //일치하지 않는다면
								$('#find-checkPassword').html('비밀번호 불일치');
								$('#find-checkPassword').css('color', 'red');
								$('#find-checkPassword').css('font-weight', 'bold');
								$('#find-button').attr('disabled', 'disabled'); //불일치하면 가입버튼이 안눌림
							} else if (find_password == find_repassword) { //일치한다면
								$('#find-checkPassword').html('비밀번호 일치');
								$('#find-checkPassword').css('color', 'green');
								$('#find-checkPassword').css('font-weight', 'bold');
								$('#find-button').removeAttr('disabled');
							} else {//아무것도 입력되지 않았다면
								$('#find-checkPassword').html(''); //아무것도 출력하지 않는다.
								$('#find-checkPassword').css('color', 'black');
								$('#find-checkPassword').css('font-weight', 'bold');
								$('#find-button').attr('disabled', 'disabled'); //비어있다면 가입버튼이 안눌림
							}
						})
						// mypage 비밀번호 일치 불일치
						
						// mypage의 비밀번호 변경, 회원탈퇴 진입막기
						$('#tab_2').on('click', function(){
							if(loginId == ""){
								alert('로그인 바랍니다.');
								location.href='mypage.jsp';
							}
						})
						
						$('#tab_3').on('click', function(){
							if(loginId == ""){
								alert('로그인 바랍니다.');
								location.href='mypage.jsp';
							}
						})
						// mypage의 비밀번호 변경, 회원탈퇴 진입막기
						
						// mypage 비밀번호 변경의 원래 비밀번호와 지금 비밀번호가 일치하는지 확인
						$('#change-opass').on('keyup', function(e){
							
							if(e.keyCode==13){	// 13 = enter
								var pass = $('#change-opass').val();
								
								$.ajax({
									url : "/YYProject/foodWrite",
									type : "post",
									data : {
										// 변수명(getParameter로 읽을 값) : 실제 들어가있는 변수 값 위에서 지정해준.
										password : pass,
										actionName : "changePass"
									},
									dataType : "text", 	// 값을 돌려받는 타입
									success : function(result){	// 성공했을 때 result받아옴
										// data타입이 text라서 Number로 바꿔준다.
										if(Number(result) == 1){
											$(".change-top2").css("opacity", "1");
										}else {
											alert('아이디와 이메일이 일치하지 않습니다.');
											$(".change-top2").css("opacity", "0");
										}
									}
								})
							}
						})
						
						//mypage 비밀번호 변경의  비밀번호 일치 불일치
            $('#change-repass').on('keyup', function() {//key가 올라가면
               //아래거에 걸어서 위에있는 값과 비교한다.
               
               var change_password = $('#change-pass').val();
               var change_repassword = $('#change-repass').val();

               if (change_password != change_repassword) { //일치하지 않는다면
                  $('#change-checkPassword').html('비밀번호 불일치');
                  $('#change-checkPassword').css('color', 'red');
                  $('#change-checkPassword').css('font-weight', 'bold');
                  $('#change-button').attr('disabled', 'disabled'); //불일치하면 가입버튼이 안눌림
               } else if (change_password == change_repassword) { //일치한다면
                  $('#change-checkPassword').html('비밀번호 일치');
                  $('#change-checkPassword').css('color', 'green');
                  $('#change-checkPassword').css('font-weight', 'bold');
                  $('#change-button').removeAttr('disabled');
               } else {//아무것도 입력되지 않았다면
                  $('#change-checkPassword').html(''); //아무것도 출력하지 않는다.
                  $('#change-checkPassword').css('color', 'black');
                  $('#change-checkPassword').css('font-weight', 'bold');
                  $('#change-button').attr('disabled', 'disabled'); //비어있다면 가입버튼이 안눌림
               }
            })
            
            //mypage 회원탈퇴의  비밀번호 일치 불일치
            $('#delete-checkpass').on('keyup', function() {//key가 올라가면
               //아래거에 걸어서 위에있는 값과 비교한다.
               
               var delete_pass = $('#delete-pass').val();
               var delete_checkpass = $('#delete-checkpass').val();

               if (delete_pass != delete_checkpass) { //일치하지 않는다면
                  $('#delete-checkPassword').html('비밀번호 불일치');
                  $('#delete-checkPassword').css('color', 'red');
                  $('#delete-checkPassword').css('font-weight', 'bold');
                  $('#delete-button').attr('disabled', 'disabled'); //불일치하면 가입버튼이 안눌림
               } else if (delete_pass == delete_checkpass) { //일치한다면
                  $('#delete-checkPassword').html('비밀번호 일치');
                  $('#delete-checkPassword').css('color', 'green');
                  $('#delete-checkPassword').css('font-weight', 'bold');
                  $('#delete-button').removeAttr('disabled');
               } else {//아무것도 입력되지 않았다면
                  $('#delete-checkPassword').html(''); //아무것도 출력하지 않는다.
                  $('#delete-checkPassword').css('color', 'black');
                  $('#delete-checkPassword').css('font-weight', 'bold');
                  $('#delete-button').attr('disabled', 'disabled'); //비어있다면 가입버튼이 안눌림
               }
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
							<i class="fas fa-check"></i>
							<!-- check 아이콘 -->
						</div>
						<a href="main-food.jsp"> <img src="img/food.png">
							<p>Food</p>
						</a>
					</div>
					<!-- menu-food -->

					<!-- menu-cafe -->
					<div class="menu-cafe">
						<a href="main-cafe.jsp"><img src="img/cafe.png">
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
					String sessionID = (String) session.getAttribute("sessionID");

					if (sessionID != null) {
				%>
				<!-- sessionID가 있을 경우  → 로그인 했을 경우 -->
				<div class="member2">
					<div class="member-user">
						<a href="#">
							<p>${sessionID}'s</p>
						</a>
					</div>
					<!--로그아웃-->
					<div class="member-logout">
						<a href="/YYProject/user?actionName=userLogout"><img
							src="img/logout.png">
							<p>Logout</p> </a>
					</div>
				</div>

				<%
					} else {
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


			<!-- Contents3 -->
			<div class="contents3">
				<form action="/YYProject/user" method="post">
					<!-- container3 -->
					<div class="container3">

						<!-- tabs -->
						<ul class="tabs">
							<li class="tab-link current" data-tab="tab-1">비밀번호 찾기</li>
							<li class="tab-link" data-tab="tab-2" id="tab_2">비밀번호 변경</li>
							<li class="tab-link" data-tab="tab-3" id="tab_3">회원탈퇴</li>
						</ul>
						<!-- tabs -->

						<!-- tab-content -->
						<!-- 비밀번호 찾기 -->
						<div id="tab-1" class="tab-content current">
							<p></p>
							<div class="find-top">
								<div class="find-id">
									<i class="far fa-user"></i> <input type="text" name="id"
										placeholder="아이디" autocomplete="off" required="required"
										id="find-id">
								</div>
								<div class="find-email">
									<i class="far fa-envelope"></i> <input type="email"
										name="email" placeholder="이메일" autocomplete="off"
										required="required" id="find-email">
								</div>
							</div>

							<!-- 숨겨져 있다가 비밀번호를 보여주는 칸 -->
							<form action="/YYProject/foodWrite" method="post">
								<input type="hidden" name="actionName" value="findChangePass">
								<div class="find-top2">
									<div class="find-newPassword1">
										<i class="fas fa-unlock"></i> <input type="password"
											name="password" placeholder="새 비밀번호" autocomplete="off"
											id="find-password">
									</div>
									<div class="find-newPassword2">
										<i class="fas fa-unlock"></i> <input type="password"
											name="repassword" placeholder="새 비밀번호 확인" autocomplete="off"
											id="find-repassword">
										<p id="find-checkPassword"></p>
									</div>
								</div>
								<!-- find-top2 -->

								<div class="find-bottom">
									<div class="find-button">
										<input type="submit" value="find" id="find-button"
											disabled="disabled">
									</div>
								</div>
							</form>
						</div>
						<!-- 비밀번호 찾기 -->


						<!-- 비밀번호 변경 -->
						<div id="tab-2" class="tab-content">
							<p>${sessionID }</p>
							<div class="change-top">
								<div class="unchange-password">
									<i class="fas fa-lock"></i> <input type="password"
										name="password" placeholder="비밀번호" autocomplete="off"
										id="change-opass">
								</div>
								<!-- 위에 #change-opass ajax를 걸어주었다. -->
								<!-- ajax를 사용하는 이유는 동기식으로 바로 나타나야 하기 때문이다. -->
							</div>
							<form action="/YYProject/foodWrite" method="post">
								<input type="hidden" name="actionName" value="changePassCheck">
								<div class="change-top2">
									<div class="change-password">
										<i class="fas fa-unlock"></i> <input type="password"
											name="password" placeholder="새 비밀번호" autocomplete="off"
											id="change-pass">
									</div>
									<div class="change-repassword">
										<i class="fas fa-unlock"></i> <input type="password"
											name="repassword" placeholder="새 비밀번호 확인" autocomplete="off"
											id="change-repass">
										<p id="change-checkPassword"></p>
									</div>
								</div>
								<div class="change-bottom">
									<div class="change-button">
										<input type="submit" value="change" id="change-button"
											disabled="disabled">
									</div>
								</div>
							</form>
						</div>
						<!-- 비밀번호 변경 -->




						<!-- 회원 탈퇴 -->
						<div id="tab-3" class="tab-content">
							<p>${sessionID }</p>
							<form action="/YYProject/foodWrite" method="post">
								<input type="hidden" name="actionName" value="deletePassCheck">
								<div class="delete-top">
									<div class="delete-password">
										<i class="fas fa-lock"></i> <input type="password"
											name="password" placeholder="비밀번호" autocomplete="off"
											id="delete-pass">
									</div>
									<div class="delete-repassword">
										<i class="fas fa-lock"></i> <input type="password"
											name="repassword" placeholder="비밀번호 확인" autocomplete="off"
											id="delete-checkpass">
										<p id="delete-checkPassword"></p>
									</div>
								</div>
								<div class="delete-bottom">
									<div class="delete-button">
										<input type="submit" value="delete" id="delete-button"
											disabled="disabled">
									</div>
								</div>
							</form>
						</div>
						<!-- 회원 탈퇴 -->



					</div>
					<!-- container3 -->
				</form>
			</div>
			<!-- Contens3 -->

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
						(주)YYcompany<br> 박아영 a01259@naver.com / 이유진
						dnfldkqkalsk@naver.com<br> Copyright© 2018-09-03 Park A
						young, Lee yu jin
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
					<i class="fas fa-user"></i> <input type="text" name="id"
						placeholder="id" autocomplete="off" id="userId"
						autofocus="autofocus">
					<!-- autocomplete="off" : 자동완성 x -->
				</div>
				<div class="login-password">
					<i class="fas fa-unlock"></i> <input type="password"
						name="password" placeholder="password" autocomplete="off"
						id="userPwd">
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
					<i class="fas fa-user"></i> <input type="text" name="name"
						placeholder="name" autocomplete="off" autofocus="autofocus">
				</div>
				<div class="join-id">
					<i class="fas fa-user"></i> <input type="text" name="id"
						id="joinId" placeholder="id" autocomplete="off"> <a
						href="#" id="checkId">check id</a>
				</div>
				<div class="join-password">
					<i class="fas fa-unlock"></i> <input type="password"
						name="password" placeholder="password" autocomplete="off">
				</div>
				<div class="join-repassword">
					<i class="fas fa-unlock"></i> <input type="password"
						name="repassword" placeholder="repassword" autocomplete="off">
				</div>
				<div class="join-email">
					<i class="fas fa-envelope"></i> <input type="email" name="email"
						placeholder="e-mail" autocomplete="off">
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
