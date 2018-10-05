var loginId = "${sessionID}"; // 전역변수를 선언해준다.
$(document).ready(function() {

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
	$('#find-email').on('keyup', function(e) {

		if (e.keyCode == 13) { // 13 = enter
			var id = $('#find-id').val();
			var email = $('#find-email').val();

			$.ajax({
				url : "/YYProject/user",
				type : "post",
				data : {
					// 변수명(getParameter로 읽을 값) : 실제 들어가있는 변수 값
					// 위에서 지정해준.
					id : id,
					email : email,
					actionName : "findChangeIdEmail"
				},
				dataType : "text", // 값을 돌려받는 타입
				success : function(result) { // 성공했을 때
					// result받아옴
					// data타입이 text라서 Number로 바꿔준다.
					if (Number(result) == 1) {
						$(".find-top2").css("opacity", "1");
					} else {
						alert('아이디와 이메일이 일치하지 않습니다.');
						$(".find-top2").css("opacity", "0");
					}
				}
			})
		}
	})
	// mypage 비밀번호 찾기의 이메일과 아이디가 같은지 확인

// mypage 비밀번호 일치 불일치
	$('#find-repassword').on('keyup',function() {// key가 올라가면

		var find_password = $('#find-password').val();
		var find_repassword = $('#find-repassword').val();

			if (find_password != find_repassword) { // 일치하지 않는다면
				$('#find-checkPassword').html('비밀번호 불일치');
				$('#find-checkPassword').css('color', 'red');
				$('#find-checkPassword').css('font-weight','bold');
				$('#find-button').attr('disabled','disabled'); // 불일치하면 가입버튼이 안눌림
			} else if (find_password == find_repassword) { // 일치한다면
				$('#find-checkPassword').html('비밀번호 일치');
				$('#find-checkPassword').css('color','green');
				$('#find-checkPassword').css('font-weight','bold');
				$('#find-button').removeAttr('disabled');
			} else {// 아무것도 입력되지 않았다면
				$('#find-checkPassword').html(''); // 아무것도 출력하지 않는다.
				$('#find-checkPassword').css('color', 'black');
				$('#find-checkPassword').css('font-weight', 'bold');
				$('#find-button').attr('disabled', 'disabled'); // 비어있다면 가입버튼이 안눌림
			}
		})
	// mypage 비밀번호 일치 불일치

// mypage의 비밀번호 변경, 회원탈퇴 진입막기
	$('#tab_2').on('click', function() {
		if (loginId == "") {
			alert('로그인 바랍니다.');
			location.href = 'mypage.jsp';
		}
	})

	$('#tab_3').on('click', function() {
		if (loginId == "") {
			alert('로그인 바랍니다.');
			location.href = 'mypage.jsp';
		}
	})
	// mypage의 비밀번호 변경, 회원탈퇴 진입막기

// mypage 비밀번호 변경의 원래 비밀번호와 지금 비밀번호가 일치하는지 확인
	$('#change-opass').on('keyup', function(e) {

		if (e.keyCode == 13) { // 13 = enter
			var pass = $('#change-opass').val();

			$.ajax({
				url : "/YYProject/user",
				type : "post",
				data : {
					// 변수명(getParameter로 읽을 값) : 실제 들어가있는 변수 값
					// 위에서 지정해준.
					password : pass,
					actionName : "changePass"
				},
				dataType : "text", // 값을 돌려받는 타입
				success : function(result) { // 성공했을 때
					// result받아옴
					// data타입이 text라서 Number로 바꿔준다.
					if (Number(result) == 1) {
						$(".change-top2").css("opacity", "1");
					} else {
						alert('아이디와 이메일이 일치하지 않습니다.');
						$(".change-top2").css("opacity", "0");
					}
				}
			})
		}
	})

// mypage 비밀번호 변경의 비밀번호 일치 불일치
	$('#change-repass').on('keyup',function() {// key가 올라가면
												// 아래거에 걸어서 위에있는 값과 비교한다.
		var change_password = $('#change-pass').val();
		var change_repassword = $('#change-repass').val();

		if (change_password != change_repassword) { // 일치하지 않는다면
			$('#change-checkPassword').html('비밀번호 불일치');
			$('#change-checkPassword').css('color', 'red');
			$('#change-checkPassword').css('font-weight', 'bold');
			$('#change-button').attr('disabled', 'disabled'); // 불일치하면 가입버튼이 안눌림
		} else if (change_password == change_repassword) { // 일치한다면
			$('#change-checkPassword').html('비밀번호 일치');
			$('#change-checkPassword').css('color', 'green');
			$('#change-checkPassword').css('font-weight', 'bold');
			$('#change-button').removeAttr('disabled');
		} else {// 아무것도 입력되지 않았다면
			$('#change-checkPassword').html(''); // 아무것도 출력하지 않는다.
			$('#change-checkPassword').css(
									'color', 'black');
			$('#change-checkPassword').css(
									'font-weight', 'bold');
			$('#change-button').attr('disabled', 'disabled'); // 비어있다면 가입버튼이 안눌림
		}
	})

// mypage 회원탈퇴의 비밀번호 일치 불일치
	$('#delete-checkpass').on('keyup',function() {// key가 올라가면
													// 아래거에 걸어서 위에있는 값과 비교한다.
		var delete_pass = $('#delete-pass').val();
		var delete_checkpass = $('#delete-checkpass').val();

		if (delete_pass != delete_checkpass) { // 일치하지 않는다면
			$('#delete-checkPassword').html('비밀번호 불일치');
			$('#delete-checkPassword').css('color', 'red');
			$('#delete-checkPassword').css('font-weight', 'bold');
			$('#delete-button').attr('disabled', 'disabled'); // 불일치하면 가입버튼이 안눌림
		} else if (delete_pass == delete_checkpass) { // 일치한다면
			$('#delete-checkPassword').html('비밀번호 일치');
			$('#delete-checkPassword').css('color', 'green');
			$('#delete-checkPassword').css('font-weight', 'bold');
			$('#delete-button').removeAttr('disabled');
		} else {// 아무것도 입력되지 않았다면
			$('#delete-checkPassword').html(''); // 아무것도 출력하지 않는다.
			$('#delete-checkPassword').css('color', 'black');
			$('#delete-checkPassword').css('font-weight', 'bold');
			$('#delete-button').attr('disabled', 'disabled'); // 비어있다면 가입버튼이 안눌림
		}
	})
})