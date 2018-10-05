$(document).ready(function() {

//지역 select-box
	$('#bAdd1').on('change', function() {
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