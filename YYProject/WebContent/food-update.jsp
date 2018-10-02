<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>food-write</title>

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
<script src='js/score.js'></script> <!-- 별점 -->
<!--팝업창을 위한 파일-->
<!--로그인 팝업창 jquery-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 우편번호 검색 파일 -->

<script>
   $(document).ready(function() {
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

   })
</script>
<!--로그인 팝업창 jquery-->

<!--회원가입 팝업창 jquery-->
<script>
	$(document).ready(
			function() {

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
				//비밀번호 일치 불일치

				//지역 select-box
				$('#bAdd1').on(
						'change',
						function() {
							var bAdd1 = $(this).val();
							var bAdd2 = $('#bAdd2');

							var seoul = "<option>종로구</option>"
									+ "<option>중구</option>"
									+ "<option>용산구</option>"
									+ "<option>성동구</option>"
									+ "<option>광진구</option>"
									+ "<option>동대문구</option>"
									+ "<option>중랑구</option>"
									+ "<option>성북구</option>"
									+ "<option>강북구</option>"
									+ "<option>도봉구</option>"
									+ "<option>노원구</option>"
									+ "<option>은평구</option>"
									+ "<option>서대문구</option>"
									+ "<option>마포구</option>"
									+ "<option>양천구</option>"
									+ "<option>강서구</option>"
									+ "<option>구로구</option>"
									+ "<option>금천구</option>"
									+ "<option>영등포구</option>"
									+ "<option>동작구</option>"
									+ "<option>관악구</option>"
									+ "<option>서초구</option>"
									+ "<option>강남구</option>"
									+ "<option>송파구</option>"
									+ "<option>강동구</option>"

							var incheon = "<option>중구</option>"
									+ "<option>동구</option>"
									+ "<option>미추홀구</option>"
									+ "<option>연수구</option>"
									+ "<option>남동구</option>"
									+ "<option>부평구</option>"
									+ "<option>계양구</option>"
									+ "<option>서구</option>"
									+ "<option>강화군</option>"
									+ "<option>옹진군</option>"

							var busan = "<option>중구</option>"
									+ "<option>서구</option>"
									+ "<option>동구</option>"
									+ "<option>영도구</option>"
									+ "<option>부산진구</option>"
									+ "<option>동래구</option>"
									+ "<option>남구</option>"
									+ "<option>북구</option>"
									+ "<option>해운대구</option>"
									+ "<option>사하구</option>"
									+ "<option>금정구</option>"
									+ "<option>강서구</option>"
									+ "<option>연제구</option>"
									+ "<option>수영구</option>"
									+ "<option>사상구</option>"
									+ "<option>기장군</option>"

							var jeju = "<option>제주시</option>"
									+ "<option>서귀포시</option>"

							var gyeonggi = "<option>수원시</option>"
									+ "<option>수원시 장안구</option>"
									+ "<option>수원시 권선구</option>"
									+ "<option>수원시 팔달구</option>"
									+ "<option>수원시 영통구</option>"
									+ "<option>성남시</option>"
									+ "<option>성남시 수정구</option>"
									+ "<option>성남시 중원구</option>"
									+ "<option>성남시 분당구</option>"
									+ "<option>의정부시</option>"
									+ "<option>안양시</option>"
									+ "<option>안양시 만안구</option>"
									+ "<option>안양시 동안구</option>"
									+ "<option>부천시</option>"
									+ "<option>평택시</option>"
									+ "<option>광명시</option>"
									+ "<option>동두천시</option>"
									+ "<option>안산시</option>"
									+ "<option>안산시 상록구</option>"
									+ "<option>안산시 단원구</option>"
									+ "<option>고양시</option>"
									+ "<option>고양시 덕양구</option>"
									+ "<option>고양시 일산동구</option>"
									+ "<option>고양시 일산서구</option>"
									+ "<option>과천시</option>"
									+ "<option>구리시</option>"
									+ "<option>남양주시</option>"
									+ "<option>오산시</option>"
									+ "<option>시흥시</option>"
									+ "<option>군포시</option>"
									+ "<option>의왕시</option>"
									+ "<option>하남시</option>"
									+ "<option>용인시</option>"
									+ "<option>용인시 처인구</option>"
									+ "<option>용인시 기흥구</option>"
									+ "<option>용인시 수지구</option>"
									+ "<option>파주시</option>"
									+ "<option>이천시</option>"
									+ "<option>안성시</option>"
									+ "<option>김포시</option>"
									+ "<option>화성시</option>"
									+ "<option>광주시</option>"
									+ "<option>양주시</option>"
									+ "<option>포천시</option>"
									+ "<option>여주시</option>"
									+ "<option>연천군</option>"
									+ "<option>가평군</option>"
									+ "<option>양평군</option>"

							var gyeongsang = "<option>대구광역시</option>"
									+ "<option>포항시</option>"
									+ "<option>포항시 남구</option>"
									+ "<option>포항시 북구</option>"
									+ "<option>경주시</option>"
									+ "<option>김천시</option>"
									+ "<option>안동시</option>"
									+ "<option>구미시</option>"
									+ "<option>영주시</option>"
									+ "<option>영천시</option>"
									+ "<option>상주시</option>"
									+ "<option>문경시</option>"
									+ "<option>경산시</option>"
									+ "<option>군위군</option>"
									+ "<option>의성군</option>"
									+ "<option>청송군</option>"
									+ "<option>영양군</option>"
									+ "<option>영덕군</option>"
									+ "<option>청도군</option>"
									+ "<option>고령군</option>"
									+ "<option>성주군</option>"
									+ "<option>칠곡군</option>"
									+ "<option>예천군</option>"
									+ "<option>봉화군</option>"
									+ "<option>울진군</option>"
									+ "<option>울릉군</option>"

							var jeonla = "<option>광주광역시</option>"
									+ "<option>전주시</option>"
									+ "<option>전주시 완산구</option>"
									+ "<option>전주시 덕진구</option>"
									+ "<option>군산시</option>"
									+ "<option>익산시</option>"
									+ "<option>정읍시</option>"
									+ "<option>남원시</option>"
									+ "<option>김제시</option>"
									+ "<option>완주군</option>"
									+ "<option>진안군</option>"
									+ "<option>무주군</option>"
									+ "<option>장수군</option>"
									+ "<option>임실군</option>"
									+ "<option>순창군</option>"
									+ "<option>고창군</option>"
									+ "<option>부안군</option>"

							var gangwon = "<option>춘천시</option>"
									+ "<option>원주시</option>"
									+ "<option>강릉시</option>"
									+ "<option>동해시</option>"
									+ "<option>태백시</option>"
									+ "<option>속초시</option>"
									+ "<option>삼척시</option>"
									+ "<option>홍천군</option>"
									+ "<option>횡성군</option>"
									+ "<option>영월군</option>"
									+ "<option>평창군</option>"
									+ "<option>정선군</option>"
									+ "<option>철원군</option>"
									+ "<option>화천군</option>"
									+ "<option>양구군</option>"
									+ "<option>인제군</option>"
									+ "<option>고성군</option>"
									+ "<option>양양군</option>"
							
							if (bAdd1 == '서울') {
								bAdd2.empty();
								bAdd2.html(seoul);
							} else if (bAdd1 == '인천') {
								bAdd2.empty();
								bAdd2.html(incheon);
							} else if (bAdd1 == '부산') {
								bAdd2.empty();
								bAdd2.html(busan);
							} else if (bAdd1 == '제주도') {
								bAdd2.empty();
								bAdd2.html(jeju);
							} else if (bAdd1 == '경기도') {
								bAdd2.empty();
								bAdd2.html(gyeonggi);
							} else if (bAdd1 == '경상도') {
								bAdd2.empty();
								bAdd2.html(gyeongsang);
							} else if (bAdd1 == '전라도') {
								bAdd2.empty();
								bAdd2.html(jeonla);
							} else if (bAdd1 == '강원도') {
								bAdd2.empty();
								bAdd2.html(gangwon);
							}
						})
						$('#addHash').on('keyup', function(e){	// 엔터했을 때 안에 있는지 판단해야하니까 e넣어줌 (e안에 어떤 키가 눌렸는지 받아옴)
							if(e.keyCode == 13){	// enter일때 값을 
								var hashTag = $(this).val();	// 해쉬태그에 담음
						
								$('#tags').append('<li>#'+hashTag+'</li>');	// 괄호 안에 있는 내용을 채워주는 함수 append 
																			// -> 아이디가 tags인 ul에 li마다 #을 채워주고 위에 변수에 집어넣은 사용자가 입력한 값을 넣어줌
								$('#tags').append('<input type=hidden name=hashTag value=#'+hashTag+'>');	// 사용자가 입력한 값이 form으로 넘어가야하니깐!!!!									
								$(this).val("");	// 추가되고나서 val값을 공백으로 바꿔줌 -> 입력창 비워지도록
							}
						})	
						
			})
			function captureReturnKey(e){
					if(e.keyCode == 13 && e.srcElement.type != 'textarea')	// textarea에서는 엔터를 칠 수 있어야 함 (가게 소개부분), 모든 input타입에 적용됨
						return false;
				}
</script>
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
