<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/index_css/MainTripInfo.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b23836480d7dc75442616ec6a0c8f5be"></script>
        <script>
	        window.onload = function () {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(${vo.tLatitude},${vo.tLongitude}), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(${vo.tLatitude},${vo.tLongitude}); 
				
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
        <div id="header_view">
            <a href="<%=request.getContextPath()%>/index/index.do">&#60;</a>
            ${vo.tName}
        </div>
    </header>
                            <!--end header-->

    <main>
        <img src="<%=request.getContextPath() %>/resources/images/manager_images/${vo.tImgName}"/>
        <h4>${vo.tName}</h4>
        <p>${vo.tMainContent}</p>
        <br>
        <br>
        <br>
        <div id="map"></div>
    </main>
                            <!--end main-->
    <footer>
        <a href="${vo.tLink}" target="_blank">${vo.tName}&nbsp;구경하러 가기</a>
    </footer>
                            <!-- end footer-->
</body>
</html>
