$(document).ready(function(){

/* main-food */
	
// 로그인 팝업창 jquery
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
	
// 회원가입 팝업창 jquery
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
      
// 비밀번호 일치 불일치
      
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
	
/* location-food */

// 클릭 시 detail나오게
      $('.list > .list-view').on('click', function(){
    	var listNum = $(this).find('#listNum').val();	// 게시물 넘버를 가지고 온다.
    	var detailView = $(this).next('.list-detail-'+listNum);		// next : 형제(같은라인에 있는) 노드(태그)를 선택, find : 자식 노드를 선택, children : 바로 아래의 자식 노드만 찾음, parent : 부모 노드 찾음
    	
    	if(detailView.hasClass('open')){
	detailView.removeClass('open');
    		detailView.addClass('close');
    		detailView.css('display', 'none');	// display라는 속성을 none으로 수정
    	}else if(detailView.hasClass('close')){
    		detailView.removeClass('close');
    		detailView.addClass('open');
    		detailView.css('display', 'block');	// display라는 속성을 none으로 수정
    	}
      })
      
// 지도마커를 바꾸기 위해 위치를 아예 열린 상태로 실행한 후, 코드를 실행시키면서 display=none으로 바꾼다.
      $('.list-detail').css('display', 'none');
      
      $('#comment-maxlength').on('keyup', function(){	
    	  if($(this).val().length > 100){
    		  alert('글자수 제한길이 초과');
    		  $(this).val($(this).val().substring(0,100));
    	  }
      });
      
      $('.comment-maxlength').on('click', function(){
    	  var userId = '${sessionID}';	// 로그인된 아이디
    	  
    	  if(userId == ''){
    		  alert('로그인 바랍니다.');
    		  $(this).blur();	// focus의 반대 (올라가있는 커서 지우도록)
    	  }
      })
      
// 별점 score위한 script
	$('.one').on('click', function(){	// 다섯개 작성하는 이유는 다섯개를 줬다가 하나만 클릭할 수도 있으니깐 전체 변경되도록 하기위해서
		$('.score').val('1');	// 1번째 꺼 클릭했으니까 1이라는 값을 넣어줌
		$('.one').css('font-weight', 'bold');
		$('.two').css('font-weight', 'normal');
		$('.three').css('font-weight', 'normal');
		$('.four').css('font-weight', 'normal');
		$('.five').css('font-weight', 'normal');
	})
	$('.two').on('click', function(){
		$('.score').val('2');
		$('.one').css('font-weight', 'bold');
		$('.two').css('font-weight', 'bold');
		$('.three').css('font-weight', 'normal');
		$('.four').css('font-weight', 'normal');
		$('.five').css('font-weight', 'normal');
	})
	$('.three').on('click', function(){
		$('.score').val('3');
		$('.one').css('font-weight', 'bold');
		$('.two').css('font-weight', 'bold');
		$('.three').css('font-weight', 'bold');
		$('.four').css('font-weight', 'normal');
		$('.five').css('font-weight', 'normal');		
	})
	$('.four').on('click', function(){
		$('.score').val('4');
		$('.one').css('font-weight', 'bold');
		$('.two').css('font-weight', 'bold');
		$('.three').css('font-weight', 'bold');
		$('.four').css('font-weight', 'bold');
		$('.five').css('font-weight', 'normal');		
	})
	$('.five').on('click', function(){
		$('.score').val('5');
		$('.one').css('font-weight', 'bold');
		$('.two').css('font-weight', 'bold');
		$('.three').css('font-weight', 'bold');
		$('.four').css('font-weight', 'bold');
		$('.five').css('font-weight', 'bold');		
	})
	
	
});