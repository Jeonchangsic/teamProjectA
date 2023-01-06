<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/index_css/index.css" rel="stylesheet"/>
    
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    
    <!---- jQuery ---->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <!--스와이퍼-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/> 
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <!--XE아이콘-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> 
    <!--지도-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16ae71cd4551db2b12f4ba87ec120fc2&libraries=services"></script>
    
    <!---- js --->
     
       <script>
        $(document).ready(function(){
           
            // swiper slide
            var swiper = new Swiper(".mySwiper", {
                // cssMode: true,
                navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
                },
                pagination: {
                el: ".swiper-pagination",
                },
                // mousewheel: true,
                keyboard: true,
            });
        });
        //검색기능
        $(function(){
    		$("#searchBtn").click(function(){
    			var stype = $("select option:selected").val();
    		//	var kword = encodeURIcomponent($("#keywordInput").val());
    			var kword = $("#keywordInput").val();
    			var type =1;
    			
    			document.location.href = "<%=request.getContextPath()%>/lodging/lodgingList_search.do?searchType="+stype+"&keyword="+kword+"&type="+type;
    			return;
    		});
    	})
    </script>
    <script>
		//검색창 출력 버튼
		$(function(){
			$(".searchBarOn").click(function() {
			    $("#searchArea").animate({
			        width: "toggle"}, 200, "linear");
			    $(".search_background").toggle();
			    $(".lodgingKind").toggle();
			})
		})
    </script>
</head>
<body>
   	<%@ include file="/WEB-INF/common/Header.jsp" %>
                <!-- end header-->
    <main>
        <nav id="gnb">
            <ul>
                <li>
                	<a href="<%=request.getContextPath() %>/lodging/lodgingList_motel.do" class="aTag_Hover">
                		<i class="xi-building"></i>
                		<p>모텔</p>
                	</a>
                </li>               
                <li>
               		<a href="<%=request.getContextPath() %>/lodging/lodgingList_hotel.do" class="aTag_Hover">
               			<i class="xi-city"></i>
               			<p>호텔</p>
           			</a>
       			</li>        
                <li>
                	<a href="<%=request.getContextPath() %>/lodging/lodgingList_villa.do" class="aTag_Hover">
	                	<i class="xi-beach"></i>
	                	<p>펜션/풀빌라</p>
                	</a>
                </li>             
                <li>
                	<a href="<%=request.getContextPath() %>/lodging/lodgingList_gh.do" class="aTag_Hover">
	                	<i class="xi-home-o"></i>
	                	<p>게스트하우스</p>
                	</a>
               	</li>        
                <li>
                	<button type="button" id="cursor_Style" class="btn-open-popup aTag_Hover" >
	                	<i class="xi-maker-drop"></i>
	                	<p>내주변</p>
                	</button>
                </li>              
            </ul>
        </nav>
        <section id="main_img">
            <img src="<%=request.getContextPath() %>/resources/images/index_images/Main_img.png">
        </section>
        <div id="modal">
     		<div class="modal_content">
     		<div id="map" style="width:100%;height:500px;"></div>
     		    <script>
    
					$(function(){
						$(".btn-open-popup").click(function(){
				       		document.getElementById("modal").style.display="block";
				       		document.body.style.overflow = "hidden";
				       		//모달시 지도 안나오는 문제 해결
				       		
				       		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 8 // 지도의 확대 레벨 
			    }; 
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			        
			        // 마커와 인포윈도우를 표시합니다
			        displayMarker(locPosition);
			            
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
			    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

			        
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
			    // 다중 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng // 마커의 위치
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content, // 인포윈도우에 표시할 내용
			        removable : true //클릭했을때 닫을 수 있는 기능


			     }); 
				//클릭이벤트	   
			    kakao.maps.event.addListener(marker, 'click', makeClick(map, marker, infowindow));

			}

			//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeClick(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			    

			}
			// 지도에 마커와 인포윈도우를 표시하는 함수입니다
			function displayMarker(locPosition) {
			
			    // 지도 중심좌표를 접속위치로 변경합니다
			    map.setCenter(locPosition);      
			}    
				//동적으로 변경된 지도 새로 적용
				 map.relayout();
			
						});
						
						$(".odal_close_btn").click(function(){
				       		document.getElementById("modal").style.display="none";
				       		document.body.style.overflow = "auto";
						});
					})
			
			    </script>
     			<button type="button" class="odal_close_btn">창닫기</button>
     		</div>
     		<div class="modal_layer"></div>
  		</div>

        <div class="white"></div>
        <section id="slide_list">                                           
            <h4>숙소추천</h4>
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <c:forEach items="${list}" var="list" varStatus="cnt">
                    	<c:if test="${cnt.count % 6 == 1}">
		                    <div class="swiper-slide">
		                        <ul>
	                    </c:if>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do?lidx=${list.lidx}&fromDate=${fromDate}&toDate=${toDate}" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/${list.limagename}" alt="숙소이미지">
                                    <div class="text_left">
                                        <p class="lod_name font_Style">${list.lodgingname}</p>
                                       	<p class="lod_rtype font_Style">[${list.rtype}]</p>
                                       	<div>
	                                     	<c:choose>
					                            <c:when test="${list.avgrv == 5.0}">
			                                      	<p class="star font_Style">&#9733;&#9733;&#9733;&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:when test="${list.avgrv == 4.9 ||list.avgrv == 4.8||list.avgrv == 4.7||list.avgrv == 4.6||list.avgrv == 4.5||list.avgrv == 4.4||list.avgrv == 4.3||list.avgrv == 4.2||list.avgrv == 4.1||list.avgrv == 4.0}">
			                                      	<p class="star font_Style">&#9733;&#9733;&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:when test="${list.avgrv == 3.9 ||list.avgrv == 3.8||list.avgrv == 3.7||list.avgrv == 3.6||list.avgrv == 3.5||list.avgrv == 3.4||list.avgrv == 3.3||list.avgrv == 3.2||list.avgrv == 3.1||list.avgrv == 3.0}">
			                                      	<p class="star font_Style">&#9733;&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:when test="${list.avgrv == 2.9 ||list.avgrv == 2.8||list.avgrv == 2.7||list.avgrv == 2.6||list.avgrv == 2.5||list.avgrv == 2.4||list.avgrv == 2.3||list.avgrv == 2.2||list.avgrv == 2.1||list.avgrv == 2.0}">
			                                      	<p class="star font_Style">&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:otherwise>
					                        		<p class="star font_Style">&#9733;</p> 
					                        	</c:otherwise>
			                        		</c:choose>               	
	                                    <p class="lod_satisfaction font_Style" >(${list.avgrv}점)</p>
                                       	</div>
                                       	<div class="lod_price font_Style">
                                       		<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.rprice}" />원
                                     	</div>
                                    </div>
                                </a>
                            </li>
	                    <c:if test="${cnt.count % 6 == 0}">
		                    </div>
		                        </ul>
	                    </c:if>
                     </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
        <div id="bg_w1"class="white"></div>
        <section class="slide_list">                                                    
            <h4>Festival</h4>
            <div id="festival_content" class="swiper mySwiper">  
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
	                    <ul>
	                        <li>
	                           <a href="<%=request.getContextPath() %>/festival/NamgangYudeung.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival1.jpg" alt="축제이미지">
	                                <div class="description">
	                                    <p id="hover1" class="festival_name">[진주]남강유등축제</p>
	                                    <p class="festival_text">"역사가 담긴 빛축제"</p>
	                                </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath() %>/festival/YeosuFireworks.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival2.jpg" alt="축제이미지">
	                                <div class="description">
		                                <p class="festival_name">[여수]밤바다불꽃축제</p>
		                                <p class="festival_text">"밤바다 야경과 불꽃축제의 조화"</p>
	                                </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath() %>/festival/Chunhyang.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival3.jpg" alt="축제이미지">
	                                <div class="description">
		                                <p class="festival_name">[남원]춘향제</p>
		                                <p class="festival_text">"역사를 자랑하는 전통축제"</p>
		                            </div>
	                            </a>
	                        </li> 
	                    </ul>
                    </div>
                    <div class="swiper-slide">
	                    <ul>
	                        <li>
	                            <a href="<%=request.getContextPath() %>/festival/Chunhyang.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival3.jpg" alt="축제이미지">
	                                <div class="description">
	                                    <p class="festival_name">[남원]춘향제</p>
	                                    <p class="festival_text">"역사를 자랑하는 전통축제"</p>
	                                </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath() %>/festival/YeosuFireworks.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival2.jpg" alt="축제이미지">
	                                <div class="description">
		                                <p class="festival_name">[여수]밤바다불꽃축제</p>
		                                <p class="festival_text">"밤바다 야경과 불꽃축제의 조화"</p>
	                                </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath() %>/festival/NamgangYudeung.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival1.jpg" alt="축제이미지">
	                                <div class="description">
		                                <p class="festival_name">[진주]남강유등축제</p>
		                                <p class="festival_text">"역사가 담긴 빛축제"</p>
	                                </div>
	                            </a>
	                        </li> 
	                    </ul>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>

        <div id="bg_w2"class="white bg_w"></div>

        <section id="best_item" class="slide_list">                                                        
            <h4>인기 여행지</h4>
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
	                    <ul>
	                        <li>
	                            <a href="<%=request.getContextPath()%>/trip/Nature.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip1.jpg" alt="즐길거리 이미지">
	                                <div class="description">
		                                <p class="trip_name">[청주]자연휴양림</p>
		                                <p class="trip_text">"캠핑과 휴양을 동시에!"</p>
		                            </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath()%>/trip/HanokVillage.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip2.jpg" alt="즐길거리 이미지">
	                                <div class="description">
		                                <p class="trip_name">[전주]한옥마을</p>
		                                <p class="trip_text">"전주 여행에 빠질 수 없는 코스"</p>
	                                </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath()%>/trip/DeokjinPark.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip3.jpg" alt="즐길거리 이미지">
	                                <div class="description">
		                                <p class="trip_name">[전주]덕진공원</p>
		                                <p class="trip_text">"수많은 연꽃을 보고싶을때"</p>
	                                </div>
	                            </a>
	                        </li> 
	                    </ul>
                    </div>
                    <div class="swiper-slide">
	                    <ul>
	                        <li>
	                            <a href="<%=request.getContextPath()%>/trip/DeokjinPark.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip3.jpg"alt="즐길거리 이미지">
	                                <div class="description">
		                                <p class="trip_name">[전주]덕진공원</p>
		                                <p class="trip_text">"수많은 연꽃을 보고싶을때"</p>
		                            </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath()%>/trip/Nature.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip1.jpg" alt="즐길거리 이미지">
	                                <div class="description">
		                                <p class="trip_name">[청주]자연휴양림</p>
		                                <p class="trip_text">"캠핑과 휴양을 동시에!"</p>
		                            </div>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath()%>/trip/HanokVillage.do">
	                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip2.jpg"alt="즐길거리 이미지">
	                                <div class="description">
		                                <p class="trip_name">[전주]한옥마을</p>
		                                <p class="trip_text">"전주 여행에 빠질 수 없는 코스"</p>
	                                </div>
	                            </a>
	                        </li>
	                    </ul>
                    </div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
    </main>
                    <!-- end main-->
    <footer>
        <div id="foot">
            
            <br>
            <br>
            <div id="copy">
                (주)저긴어때 l 
                대표이사 : 홍이젠 l
                사업자 등록번호 : 104-14-100400 l
                메일 : Whatdoyouthink@naver.com <br>
                주소 : 전라북도 전주시 덕진구 금암1동 667-52 5층 l
                전화번호 : 063-104-1004 (오전 9시 ~ 오후 5시)<br>
                <br>
                Copyright WD COMPANY Corp. All rights reserved.
                <br>
                <br>
                
            </div>
        </div>
    </footer>
</body>
</html>