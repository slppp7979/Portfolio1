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
<!-- SeoulStyle.css -->
<link rel="stylesheet" href="css/food-write-style.css">
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
<script src='js/jquery.bpopup.min.js'></script>
<script src='js/main.js'></script>
<script src='js/write.js'></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 우편번호 검색 파일 -->

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
			
			<!-- food-write -->
			<form action="/YYProject/UpdateServlet" method="post" name="foodWrite" enctype="multipart/form-data" onkeydown="return captureReturnKey(event)">
			<!-- bNum 세팅해줌 -->
			<input type="hidden" name="bNum" value="${list.getbNum() }">
			<!-- 매핑값 foodWrite을 가지고 있는 FoodWriteServlet으로 간다.-->
			<div class="food-write">

				<!-- write-title -->
				<div class="write-title">
					<h1>글 수정</h1>
				</div>
				<!-- write-title -->

				<!-- write-left -->
				<div class="write-left">

					<div class="bName">
						<p>가게명</p>
					</div>

					<div class="bTel">
						<p>전화번호</p>
					</div>

					<div class="bTime">
						<p>영업시간</p>
					</div>

					<div class="bImg">
						<p>대표 이미지</p>
					</div>

					<div class="bAdd">
						<p>지역</p>
					</div>

					<div class="bLocation">
						<p>주소</p>
					</div>

					<div class="bKind">
						<p>음식 종류</p>
					</div>

					<div class="bMenu">
						<p>메뉴</p>
					</div>

					<div class="bInfo">
						<p>소개</p>
					</div>

					<div class="bHash">
						<p>해시태그</p>
					</div>
					
					<div class="bStar">
						<p>관리자평점</p>
					</div>

				</div>
				<!-- write-left -->
				
     	        <!-- servlet에서 여기 있는 actionName의 값으로 구분하기 때문에 servlet을 구분할 필요없다. -->
				
				<!-- write-right -->
				<div class="write-right">

					<div class="bName">
						<input type="text" name="bName" placeholder="가게명을 입력하세요." value="${list.getbName() }" required>
					</div>

					<div class="bTel">
						<input type="text" name="bTel" placeholder="0000-0000" value="${list.getbTel() }" required>
					</div>

					<div class="bTime">
						<input type="text" name="bTime" placeholder="00:00 ~ 00:00" value="${list.getbTime() }" required>
					</div>

					<div class="bImg">
						<input type="file" name="bImg" value="${list.getbImg() }"required>
					</div>

					<!-- selectBox -->
					<div class="bAdd">
						<select name="bAdd1" onchange="addChange()" id="bAdd1">
							<option>--도.시--</option>
							<option value='서울'>서울</option>
							<option value='인천'>인천</option>
							<option value='부산'>부산</option>
							<option value='제주도'>제주도</option>
							<option value='경기도'>경기도</option>
							<option value='경상도'>경상도</option>
							<option value='전라도'>전라도</option>
							<option value='강원도'>강원도</option>
							<option value='${list.getbAdd1() }' selected>${list.getbAdd1() }</option>
						</select> 
						<select name="bAdd2" id="bAdd2">
							<option>--시.군--</option>
							<option value='${list.getbAdd2() }' selected>${list.getbAdd2() }</option>
						</select>
					</div>

						<div class="bLocation">
							<input type="text" id="sample4_roadAddress" name="bLocation" placeholder="도로명주소"> 
							<input type="button" class="bLocationBtn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<span id="guide" style="color: #999"></span>

							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
								//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
								function sample4_execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
													var extraRoadAddr = ''; // 도로명 조합형 주소 변수

													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraRoadAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraRoadAddr += (extraRoadAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraRoadAddr !== '') {
														extraRoadAddr = ' ('
																+ extraRoadAddr
																+ ')';
													}
													// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
													if (fullRoadAddr !== '') {
														fullRoadAddr += extraRoadAddr;
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById('sample4_roadAddress').value = fullRoadAddr;

													// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
													if (data.autoRoadAddress) {
														//예상되는 도로명 주소에 조합형 주소를 추가한다.
														var expRoadAddr = data.autoRoadAddress
																+ extraRoadAddr;
														document
																.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
																+ expRoadAddr
																+ ')';

													} else {
														document
																.getElementById('guide').innerHTML = '';
													}
												}
											}).open();
								}
							</script>
						</div>
						<!-- bLocation -->
					
					<div class="bKind">
						<input type="checkbox" name="bKind" value="한식">한식 
		                <input type="checkbox" name="bKind" value="양식">양식 
		                <input type="checkbox" name="bKind" value="중식">중식 
		                <input type="checkbox" name="bKind" value="일식">일식<br> 
		                  
		                <input type="checkbox" name="bKind" value="이태리음식">이태리음식 
		                <input type="checkbox" name="bKind" value="남미음식">남미음식
		                <input type="checkbox" name="bKind" value="아시아음식">아시아음식
		                <input type="checkbox" name="bKind" value="동남아음식">동남아음식<br>
		                  
		                <input type="checkbox" name="bKind" value="레스토랑">레스토랑 
		                <input type="checkbox" name="bKind" value="맥주,호프">맥주,호프 
		                <input type="checkbox" name="bKind" value="바">바
		                <input type="checkbox" name="bKind" value="브런치">브런치<br> 
					</div>

					<div class="bMenu">
						<div class="bMenu1">
							<div class="bMenu1-Img">
								<input type="file" name="bMenu1-Img" required>
							</div>
							<div class="bMenu1-Detail">
								<input type="text" name="bMenu1-Detail"
									placeholder="메뉴명(가격)을 입력하세요." value="${list.getbMenu1_Detail() }"required>
							</div>
						</div>
						<div class="bMenu2">
							<div class="bMenu2-Img">
								<input type="file" name="bMenu2-Img" required>
							</div>
							<div class="bMenu2-Detail">
								<input type="text" name="bMenu2-Detail"
									placeholder="메뉴명(가격)을 입력하세요." value="${list.getbMenu2_Detail() }" required>
							</div>
						</div>
						<div class="bMenu3">
							<div class="bMenu3-Img">
								<input type="file" name="bMenu3-Img" required>
							</div>
							<div class="bMenu3-Detail">
								<input type="text" name="bMenu3-Detail"
									placeholder="메뉴명(가격)을 입력하세요." value="${list.getbMenu3_Detail() }" required>
							</div>
						</div>
					</div>

					<div class="bInfo">
						<textarea name="bInfo" rows="9" cols="100" placeholder="소개글을 입력하세요." required>${list.getbInfo() }</textarea>
					</div>

					<div class="bHash">
						<input type="text" id="addHash" placeholder="#해시태그" autocomplete="off">
						<ul id="tags">	<!-- jquery -->
						</ul>
					</div>
					
					<div class="bStar">
						<input type="hidden" name="bStar" class="score" value="0">
						<i class="far fa-star one"></i>
						<i class="far fa-star two"></i>
						<i class="far fa-star three"></i>
						<i class="far fa-star four"></i>
						<i class="far fa-star five"></i>	
					</div>
				</div>
				<!-- write-right -->
				

			</div>
			<!-- food-write -->
			
			<!-- bWriteBtn -->
			<div class="bWriteBtn">
				<input type="submit" value="작성하기">
				<!-- <a href="#" id="writeBtn"><i class="fas fa-pencil-alt"></i> 작성</a> -->
			</div>
			<!-- bWriteBtn -->
			
			</form>

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
					<input type="submit" value="forget password?">
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
