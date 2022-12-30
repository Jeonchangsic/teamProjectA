<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    level: 10 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>늘품호텔</div>', 
    latlng: new kakao.maps.LatLng(35.817267680722246, 127.15498012062493)
},
{
    content: '<div>전주 한옥호텔 왕의지밀</div>', 
    latlng: new kakao.maps.LatLng(35.800146169437156, 127.17763723339829)
},
{
    content: '<div>쏠비치 진도 호텔</div>', 
    latlng: new kakao.maps.LatLng(34.400707162055234, 126.32799797372923)
},
{
    content: '<div>그랜드 하얏트 제주</div>',
    latlng: new kakao.maps.LatLng(33.485246751712964, 126.48139799712354 )
},
{
    content: '<div>오션스위츠 제주</div>',
    latlng: new kakao.maps.LatLng(33.51815548649971, 126.52308341502813)
},
{
    content: '<div>전주 메이드-HOTEL MADE</div>',
    latlng: new kakao.maps.LatLng(35.83735249121943,  127.16979527803883 )
},
{
    content: '<div>군산 HOTEL PM</div>',
    latlng: new kakao.maps.LatLng(35.962946, 126.6895166)
},
{
    content: '<div>익산 HOTEL G7</div>',
    latlng: new kakao.maps.LatLng(35.9309997, 126.9457523)
},
{
    content: '<div>제주 노블레스 관광호텔</div>',
    latlng: new kakao.maps.LatLng(33.501151082196444, 126.50347212504104)
},
{
    content: '<div>제주 퓨어스테이</div>',
    latlng: new kakao.maps.LatLng(33.50964529135727, 126.48175834419044)
},
{		//여기부터
    content: '<div>해운대 마린케이풀빌라펜션</div>',
    latlng: new kakao.maps.LatLng(35.180605586013655, 129.19920275551945)
},
{
    content: '<div>부산 뷰먼드풀빌라</div>',
    latlng: new kakao.maps.LatLng(35.149226250241405, 129.11480872452412 )
},
{
    content: '<div>부산 타이드어웨이 풀빌라</div>',
    latlng: new kakao.maps.LatLng(35.18216565099639, 129.2085469232981)
},
{
    content: '<div>해운대 송정 오셔너스</div>',
    latlng: new kakao.maps.LatLng(35.177038946625096, 129.19686768887712)
},
{
    content: '<div>부산 씨앤트리풀빌라</div>',
    latlng: new kakao.maps.LatLng(35.177038946625096, 129.19686768887712)
},
{
    content: '<div>홍대 롬바드 게스트하우스</div>',
    latlng: new kakao.maps.LatLng(37.554209186747315, 126.9158032511722)
},
{
    content: '<div>연남 소풍 더 어반 게스트하우스</div>',
    latlng: new kakao.maps.LatLng(37.554209186747315, 126.9158032511722 )
},
{
    content: '<div>야코리아 호스텔 동대문점</div>',
    latlng: new kakao.maps.LatLng(37.55979763775305, 127.013063794380514)
},
{
    content: '<div>이태원 G 게스트하우스</div>',
    latlng: new kakao.maps.LatLng(37.53321878144245, 126.99494548116462)
},
{
    content: '서울숲스테이(Seoul Forest)',
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
    content: positions[i].content // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}
</script>
</body>
</html>