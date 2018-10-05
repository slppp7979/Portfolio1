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
  <!-- LocationStyle.css -->
  <link rel="stylesheet" href="css/location-food-style.css">
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

	  <!-- 관리자접속 -->
			<%
				String sessionID2 = (String) session.getAttribute("sessionID");
				if ("admin".equals(sessionID2)) {
			%>
	  <!-- 관리자로 접속시만 보이는 글작성 버튼 -->
			<div class="writeAdmin">
				<a href="food-write.jsp" id="writeAdminBtn">
				<i class="fas fa-pencil-alt"></i>작성</a>
			</div>
	  <!-- 관리자로 접속하지 않았다면 -->
			<%		
				}else{}
			%>		
	  <!-- 관리자접속 -->

      <!-- Contents2 -->
      <div class="contents2">

        <!-- container2 -->
        <div class="container2">

          <!-- title -->
          <div class="title">
            	<h1> < ${title } ${keyword } 맛집 리스트 > </h1>
          </div>
          <!-- title -->
		<c:set var="i" value="1"/> <!-- 변수 선언! -->
		  <c:forEach items="${list }" var = "vo" begin = "0" end = "4"><!-- for문 -->
          <!-- list -->
          <div class="list" id="list1">
            <!-- list-view -->
            <div class="list-view">
			  <input type="hidden" name="listNum" id="listNum" value="${vo.getbNum() }">	<!-- 게시물에 중복안되는 유일한 요소인 bNum를 줘서 클릭했을 때 같은 번호를 찾아서 열도록 함 -->
					<!-- CommentWriteAction에서 사용하기위해 name값 줌 -->
              <!-- list-img -->
              <div class="list-img">
                <img src="upload/${vo.getbImg() }">
              </div>
              <!-- list-img -->

              <!-- list-intro -->
              <div class="list-intro">

                <!-- list-intro-top -->
                <div class="list-intro-top">

                  <div class="top-name">
                    <p>${vo.getbName() }</p>
                  </div>
                  <%
                  	String sessionID3 = (String)session.getAttribute("sessionID");
                  	if("admin".equals(sessionID3)){
                  %>
                  <div class="top-manage">
	                  <div class="board-modify">
	                  	<a href="/YYProject/user?bNum=${vo.getbNum() }&actionName=boardUpdateForm"><p>수정</p></a>
	                  	<!-- Form안에서 다시 actionName=boardUpdate 만들어야됨 -->
	                  </div>
	                  
	                  <div class="board-delete">
	                  	<a href="/YYProject/user?bNum=${vo.getbNum() }&actionName=boardDelete&l=${title}"><p>삭제</p></a>
	                  </div>
                  </div>
                  <%
                  	}else{}
                  %>
					<div class="top-star">
						<div class="top-star-admin">
							<div class="star-admin">
								<h6>관리자평점</h6>
							</div>

							<div class="admins-star">
								<c:forEach begin = "1" end="${vo.getbStar() }">		<!-- 1로 시작해서 end까지 한바퀴돌면 begin이 1씩 올라감 만약 3점이면 3번 돌고 끝남 -->
									<i class="fas fa-star"></i>
								</c:forEach>
								
								<c:forEach begin = "1" end="${5 - vo.getbStar() }">	<!-- 5에서 체크한 평점만큼 뺌 -->
									<i class="far fa-star"></i>
								</c:forEach>
							</div>

							<div class="admins-star-avg">
								<h6>${vo.getbStar() }</h6>
							</div>
						</div>

						<div class="top-star-user">
							<div class="star-user">
								<h6>사용자평점</h6>
							</div>

							<div class="users-star">
								<c:forEach begin = "1" end="${vo.getcStar() }">		<!-- 1로 시작해서 end까지 한바퀴돌면 begin이 1씩 올라감 만약 3점이면 3번 돌고 끝남 -->
									<i class="fas fa-star"></i>
								</c:forEach>
								
								<c:forEach begin = "1" end="${5 - vo.getcStar() }">	<!-- 5에서 체크한 평점만큼 뺌 -->
									<i class="far fa-star"></i>
								</c:forEach>
							</div>
							<div class="users-star-avg">
								<h6>${vo.getcStar() }</h6>
							</div>
						</div>
					</div>
					<!-- 별점 -->

				</div>
                <!-- list-intro-top -->

                <!-- list-intro-bottom -->
                <div class="list-intro-bottom">
					  	
                  <!-- bottom-intro -->
                  <div class="bottom-intro">
					
                    <!-- bottom-kind -->
                    <div class="bottom-kind">
                    <c:forEach items = "${vo.getbKind() }" var="kind">
                      <P>${kind }</P>                    
                    </c:forEach>
                      <!--<c:forEach items = "${kindList }" var= "kind" begin="0" end="9">
                      	<p>${kind }</p>
                      </c:forEach> -->
                    </div>
                    <!-- bottom-kind -->

                    <!-- bottom-location -->
                    <div class="bottom-location">
                      <P>${vo.getbAdd1() } ${vo.getbAdd2() }</P>
                    </div>
                    <!-- bottom-location -->

                    <!-- bottom-arrow -->
                    <div class="bottom-arrow">
                      <i class="fas fa-arrow-circle-down"></i>
                    </div>
                    <!-- bottom-arrow -->

                  </div>
                  <!-- bottom-intro -->

                  <div class="bottom-hash">
                    <P>${vo.getbHash() }</P>
                  </div>

                </div>
                <!-- list-intro-bottom -->

              </div>
              <!-- list-intro -->

            </div>
            <!-- list-view -->

            <!-- list-detail -->
            <div class="list-detail list-detail-${vo.getbNum() } close">

              <!-- detail-intro -->
              <div class="detail-intro">
				
				<!-- intro-detail -->
				<div class="intro-detail">	
				
	                <!-- intro-intro -->
	                <div class="intro-intro">
	                  <span>
	                    <p><i class="fas fa-map-marker-alt"></i>${vo.getbLocation() }</p>
	                    <p><i class="fas fa-phone"></i>${vo.getbTel() }</p>
	                    <p><i class="far fa-clock"></i>${vo.getbTime() }</p>
	                  </span>
	                </div>
	                <!-- intro-intro -->
	                
		            <!-- intro-contents -->
		            <div class="intro-contents">
		            	<h1>Introduce</h1>
		                <p>${vo.getbInfo() }</p>
		            </div>
		            <!-- intro-contents -->
		            
				</div>
				<!-- intro-detail -->
				
                <!-- intro-map -->
                <!-- intro-map -->
               
                           <!-- intro-map -->
                           <div class="intro-map">
                              <div id="map${i}" style="width: 100%; height: 100%;"></div>

                              <script type="text/javascript"
                                 src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6f008212e1529b1308588e7741ffd94&libraries=services"></script>
                              <script>
                                 var mapContainer = document
                                       .getElementById('map${i}'), // 지도를 표시할 div 
                                 mapOption = {
                                    center : new daum.maps.LatLng(
                                          33.450701, 126.570667), // 지도의 중심좌표
                                    level : 3
                                 // 지도의 확대 레벨
                                 };

                                 // 지도를 생성합니다    
                                 var map${i} = new daum.maps.Map(
                                       mapContainer, mapOption);

                                 // 주소-좌표 변환 객체를 생성합니다
                                 var geocoder = new daum.maps.services.Geocoder();

                                 // 주소로 좌표를 검색합니다
                                 geocoder
                                       .addressSearch(
                                             '${vo.getbLocation() }',
                                             function(result,
                                                   status) {

                                                // 정상적으로 검색이 완료됐으면 
                                                if (status === daum.maps.services.Status.OK) {

                                                   var coords = new daum.maps.LatLng(
                                                         result[0].y,
                                                         result[0].x);

                                                   // 결과값으로 받은 위치를 마커로 표시합니다
                                                   var marker${i} = new daum.maps.Marker(
                                                         {
                                                            map : map${i},
                                                            position : coords
                                                         });

                                                   // 인포윈도우로 장소에 대한 설명을 표시합니다
                                                   var infowindow = new daum.maps.InfoWindow(
                                                         {
                                                            content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.getbName() }</div>'
                                                         });
                                                   infowindow
                                                         .open(
                                                               map${i},
                                                               marker${i});

                                                   // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                                   map${i}
                                                         .setCenter(coords);
                                                }
                                             });
                                 
                                          /* $(document).ready(function(){
                                             $('.list > .list-view').on('click', function(){
                                                map${i}.relayout();
                                             })
                                          }) */
                              </script>
                           </div>
                           <!-- intro-map -->
              <!-- intro-map -->
				
              </div>
              <!-- detail-intro -->


              <!-- detail-menu -->
              <div class="detail-menu">
				<h1>Menu</h1>
                <div class="menu1">
                	<img src="upload/${vo.getbMenu1_Img() }">
                    <h6>${vo.getbMenu1_Detail() }</h6>
                </div>
                <div class="menu2">
                    <img src="upload/${vo.getbMenu2_Img() }">
                    <h6>${vo.getbMenu2_Detail() }</h6>
                </div>
                <div class="menu3">
                    <img src="upload/${vo.getbMenu3_Img() }">
                    <h6>${vo.getbMenu3_Detail() }</h6>
                </div>
			  </div>

              <!-- detail-menu -->
			  
			  <!-- comment -->
	            <div class="detail-reply"> 
	               <form action="/YYProject/user" method="post">
	               <input type="hidden" name="actionName" value="commentWrite">
	               <input type="hidden" name="listNum" id="listNum" value="${vo.getbNum() }"> <!-- 댓글창에서 해당 게시글넘버 불러오기위해서 -->
	               <input type="hidden" name="l" value="${title }">	<!-- 해당 타이틀 댓글로 띄워줘야되니까 -->
	                  
	                  <!-- 댓글작성란 -->
	                  <div class="reply-write">
	                     <div class="r-write-star">
	                       	<input type="hidden" name="cStar" class="score" value="0">
							<i class="far fa-star one"></i>
							<i class="far fa-star two"></i>
							<i class="far fa-star three"></i>
							<i class="far fa-star four"></i>
							<i class="far fa-star five"></i>	
	                     </div>
	                     <div class="r-write-comment">
	                        <!-- 최대 입력 글자수 100 -->
	                        <input type="text" name="cContent" class="comment-maxlength" maxlength="100" placeholder="댓글을 입력하세요. 최대 한글 100자까지 가능합니다.">
	                     </div>
	                     <div class="r-write-button">
	                        <input type="submit" value="등록">
	                     </div>
	                  </div>
	                  <!-- 댓글작성란 -->
	                  
	               </form>
	                  <!-- 댓글보이는곳 -->
	                  <div class="reple">
	                     <ul>
	                     <!-- 댓글1 -->
	                     <c:forEach items = "${clist }" var = "cVo">	<!-- items : 뭘 뿌려줄지 정함  var : 이름 -->
	                     	<c:if test = "${vo.getbNum() == cVo.getcReg_flag() }">
	                     		
	                     	
	                        <li>
	                           <div class="reple-star">
									<c:forEach begin = "1" end="${cVo.getcStar() }">		<!-- 1로 시작해서 end까지 한바퀴돌면 begin이 1씩 올라감 만약 3점이면 3번 돌고 끝남 -->
									<i class="fas fa-star"></i>
									</c:forEach>
									
									<c:forEach begin = "1" end="${5 - cVo.getcStar() }">	<!-- 5에서 체크한 평점만큼 뺌 -->
										<i class="far fa-star"></i>
									</c:forEach>	
	                           </div>                                       
	                           <div class="reple-content">
	                              <div class="content-reple">
	                             	 <p>${cVo.getcContent() }</p>
	                              </div>
	                              <div class="content-reple-user">
	                                 <div class="reple-id">
	                                 	<p>${cVo.getcId() }</p>
	                                 </div>
	                                 <div class="reple-date">
	                                 	<p>${cVo.getcReg_date() }</p>
	                                 </div>
	                              </div>
	                           </div>                                    
	                           <div class="reple-button">
	                           	  <c:if test="${sessionID.equals(cVo.getcId()) }">
		                              <div class="reple-delete">
		                                 <a href="/YYProject/user?actionName=commentDelete&c=${cVo.getcNum() }&l=${title }">삭제</a>
		                              </div>
	                              </c:if>
	                           </div>
	                           
	                        </li>
	                        </c:if>
						</c:forEach>
	                  
	                     </ul>                                       
	                  </div>
	                  <!-- 댓글보이는곳 -->
	            </div>
	            <!-- comment -->
				  
            </div>
            <!-- list-detail -->

          </div>
          <!-- list -->
          <c:set var="i" value="${i+1 }"/>
		  </c:forEach>
		  
        </div>
        <!-- container2 -->

      </div>
      <!-- Contens2 -->

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
