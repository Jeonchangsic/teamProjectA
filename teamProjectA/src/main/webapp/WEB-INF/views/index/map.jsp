<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>저긴어때</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16ae71cd4551db2b12f4ba87ec120fc2&libraries=services"></script>
	<link href="<%=request.getContextPath() %>/resources/css/index_css/map.css" rel="stylesheet"/>

</head>
<body>
	
<div id="map" style="width:800px; height:500px;"></div>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(35.84027668135863, 127.1324807871931), // 지도의 중심좌표
    level: 9 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(37.566535,126.9779692); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다          
        

        displayMarker(locPosition);
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(35.84027668135863, 127.1324807871931);
    displayMarker(locPosition);
}


//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
	content: '<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_1.jpg"></div>'+
				'<div id="modalR">'+
					'<div>전북 전주시 <br> 완산구 기린대로 9</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">늘품호텔</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.817267680722246, 127.15498012062493)
},
{
    content: '<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_2.jpg"></div>'+
				'<div id="modalR">'+
					'<div>전북 전주시<br> 완산구 대성동 1-1</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">전주 한옥호텔 <br> 왕의지밀</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.800146169437156, 127.17763723339829)
},
{
    content:'<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_3.jpg"></div>'+
				'<div id="modalR">'+
					'<div>전남 진도군 <br> 의신면 초사리 <br> 산 287-6</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">쏠비치 진도 호텔</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(34.400707162055234, 126.32799797372923)
},
{
    content: '<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeju_1.jpg"></div>'+
				'<div id="modalR">'+
					'<div>제주도 제주시 <br>노형동 925</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">그랜드 하얏트 제주</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(33.485246751712964, 126.48139799712354 )
},
{
    content: '<div style="padding:5px; width: 240px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeju_2.jpg"></div>'+
				'<div id="modalR">'+
					'<div>제주특별자치도 <br> 제주시 삼도이동 <br> 1260-1</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">오션 스위츠 제주</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(33.51815548649971, 126.52308341502813)
},
{
    content: '<div style="padding:5px; width: 240px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_4.jpg"></div>'+
				'<div id="modalR">'+
					'<div>전북 전주시 <br> 덕진구 산정동 871-2</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">전주 메이드-<Br>HOTEL MADE</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.83735249121943,  127.16979527803883 )
},
{
    content: '<div style="padding:5px; width: 200px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_5.jpg"></div>'+
				'<div id="modalR">'+
					'<div>전북 군산시<br> 나운동 850-6</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">군산 호텔 PM</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.962946, 126.6895166)
},
{
    content:'<div style="padding:5px; width: 220px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_6.jpg"></div>'+
				'<div id="modalR">'+
					'<div>전북 익산시 <br> 인화동1가 168-3</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">익산 호텔 G7</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.9309997, 126.9457523)
},
{
    content: '<div style="padding:5px; width: 270px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeju_3.jpg"></div>'+
				'<div id="modalR">'+
					'<div>제주특별자치도 <br>제주시 용담이동<br> 2761</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">제주 노블레스 관광호텔</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(33.501151082196444, 126.50347212504104)
},
{
    content:'<div style="padding:5px; width: 220px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/jeju_4.jpg"></div>'+
				'<div id="modalR">'+
					'<div>제주특별자치도 <br>제주시 연동 301-3</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">제주 퓨어 스테이</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(33.50964529135727, 126.48175834419044)
},
{		//여기부터
    content:'<div style="padding:5px; width: 200px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/busan_1.jpg"></div>'+
				'<div id="modalR">'+
					'<div>부산 해운대구 <br> 송정동 159-5</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">해운대 마린케이<br>풀빌라펜션</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.180605586013655, 129.19920275551945)
},
{
    content: '<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/busan_2.jpg"></div>'+
				'<div id="modalR">'+
					'<div>부산 수영구<br> 광안동 201-9</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">부산 뷰먼드풀빌라</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.149226250241405, 129.11480872452412 )
},
{
    content: '<div style="padding:5px; width: 250px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/busan_3.jpg"></div>'+
				'<div id="modalR">'+
					'<div>부산 기장군 <br>기장읍 시랑리 615-5</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">부산 타이드어웨이<br> 풀빌라</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.18216565099639, 129.2085469232981)
},
{
    content: '<div style="padding:5px; width: 200px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/busan_4.jpg"></div>'+
				'<div id="modalR">'+
					'<div>부산 해운대구<br> 송정동 437-1</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">해운대 송정 오셔너스</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.177038946625096, 129.19686768887712)
},
{
    content: '<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/busan_5.jpg"></div>'+
				'<div id="modalR">'+
					'<div>부산 기장군<br> 일광읍 문동리 4</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">부산 씨앤트리풀빌라</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(35.177038946625096, 129.19686768887712)
},
{
    content: '<div style="padding:5px; width: 200px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/seoul_1.jpg"></div>'+
				'<div id="modalR">'+
					'<div>서울특별시 마포구<br> 서교동 466-6 4F</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">홍대 롬바드 게스트하우스</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(37.554209186747315, 126.9158032511722)
},
{
    content: '<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/seoul_2.jpg"></div>'+
				'<div id="modalR">'+
					'<div>서울 마포구 <br>연남동 227-17</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">연남 소풍 더 어반<br> 게스트하우스</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(37.554209186747315, 126.9158032511722 )
},
{
    content: '<div style="padding:5px; width: 230px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/seoul_3.jpg"></div>'+
				'<div id="modalR">'+
					'<div>서울특별시 중구<br> 신당동 308-5</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">야코리아 호스텔 <br>동대문점</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(37.55979763775305, 127.013063794380514)
},
{
    content:'<div style="padding:5px; width: 250px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/seoul_4.jpg"></div>'+
				'<div id="modalR">'+
					'<div>서울특별시 용산구 <br>이태원동 131-11</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">이태원 G 게스트하우스</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(37.53321878144245, 126.99494548116462)
},
{
    content: '<div style="padding:5px; width: 290px">'+
				'<div id="modalImg"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/seoul_5.jpg"></div>'+
				'<div id="modalR">'+
					'<div>서울특별시 성동구<Br> 성수동1가 656-1066 2,<Br> 3층 서울숲 스테이</div>'+
					'<a class="modalinfo" href="http://localhost:8080/A/lodging/lodgingView.do?lidx=261" target="_blank">서울숲스테이(Seoul Forest)</a>'+
				'</div>'+
			'</div>',
    latlng: new kakao.maps.LatLng(37.5472976, 127.0447623)
}
];



for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content, // 인포윈도우에 표시할 내용
        removable : true //클릭했을때 닫을 수 있는 기능


    });


    //geolocation
     function displayMarker(locPosition) {
 
    	
    	 map.setCenter(locPosition);    
    }

     // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
     // 이벤트 리스너로는 클로저를 만들어 등록합니다 
     // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다   
    kakao.maps.event.addListener(marker, 'click', makeClick(map, marker, infowindow));

   
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeClick(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
    

}



</script>
</body>
</html>