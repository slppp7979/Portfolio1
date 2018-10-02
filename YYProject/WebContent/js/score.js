$(document).ready(function(){
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