<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/manager_css/regAll.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b23836480d7dc75442616ec6a0c8f5be"></script>
        <script>
	        window.onload = function () {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(${vo.ftLatitude},${vo.ftLongitude}), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(${vo.ftLatitude},${vo.ftLongitude}); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
	        };
		</script>
</head>
<body>
    <header>
        <div id="header_view">${vo.ftName}</div>
    </header>
    <main>
        <img src="<%=request.getContextPath() %>/resources/images/manager_images/${vo.ftImgName}"/>
        <h4>${vo.ftName}</h4>
        <p>${vo.ftMainContent}</p>
        <br>
        <br>
        <br>
        <div id="map"></div>
    </main>
    <footer>
        <a href="${vo.ftLink}">${vo.ftName}&nbsp;구경하러 가기</a>
    </footer>
</body>
</html>
