<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script src='js/main.js'></script>
<script src='js/user.js'></script>

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
							<form action="/YYProject/user" method="post">
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
							<form action="/YYProject/user" method="post">
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
							<form action="/YYProject/user" method="post">
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
