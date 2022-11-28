<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="team.projectA.vo.*" %>
<%
	List<RoomVO> list = (List<RoomVO>)request.getAttribute("list");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/lodging_css/reset.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/lodging_css/select_style.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/jquery-ui.css">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> <!--XE아이콘-->


<script>
	$(document).ready(function() {
		// 메뉴 접었다 폈다 하는 기능
		$(".select_under").click(function() {
			if ($(this).next(".open_menu").is(":visible")) {
				$(this).next(".open_menu").css("display", "none");
			} else {
				$(".open_menu").css("display","none");
				$(this).next(".open_menu").css("display", "block");
			}
	
		});
		
		/* //전체메뉴숨기기
		$("#select ul li").click(function() {
			if ($(".selectBoth").is(":visible")) {
				$(".selectBoth").css("display", "none");
			} else {
				$(".selectBoth").css("display", "block");
			}
		});
	
		//클릭시 지역텍스트 변경  
		$(".c1").click(function() {
			var jbText = $(this).text();
			$("#select_main p").text(jbText);
			$("#reselect_btn").css("display", "inline-block");
		}); */
	
		//지역 선택됐을때 전체메뉴 접기 기능		
		var area = '${area}';
		
		if(area != ''){
			$(".selectBoth").css("display", "none");
		}		
		// 지역 선택됐을때 전체메뉴 접었다 폈다 하는 기능			
		$("#reselect_btn").click(function() {
			if ($(".selectBoth").is(":visible")) {
				$(".selectBoth").css("display", "none");
			} else {
				$(".selectBoth").css("display", "block");
			}
		});
		
		//검색기능
		$(".search_btn").click(function() {
			$(".search_bar").toggleClass("view");
		});
	
		// swiper slide
		var swiper = new Swiper(".mySwiper", {
			// cssMode: true,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			pagination : {
				el : ".swiper-pagination",
			},
			// mousewheel: true,
			keyboard : true,
		});
	});

	//캘린더
	$(function() {

		//오늘 날짜를 출력
		$("#today").text(new Date().toLocaleDateString());

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		//시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)

			buttonText : "시작일", // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			minDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#toDate').datepicker({
			showOn : "both",

			buttonText : "종료일",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			minDate : 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});
	});

	//필터선택
	var div2 = document.getElementsByClassName("btnbox2");

	function change_btn2(event,type) {
		//console.log(event.target);
		// console.log(this);
		// 콘솔창을 보면 둘다 동일한 값이 나온다
		

		console.log(event.target.classList[1]);

		if (event.target.classList[1] === "active2") {
			event.target.classList.remove("active2");
		} else {
			for (var i = 0; i < div2.length; i++) {
				div2[i].classList.remove("active2");
			}

			event.target.classList.add("active2");
		}
		location.href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?type="+type;
	}

	function init() {
		for (var i = 0; i < div2.length; i++) {
			div2[i].addEventListener("click", change_btn2);
		}
	}

	init();

	//베드필터

	$(function() {
		$('#bed_val li').click(function() {
			$(this).find('p').css('background', 'yellow');

		});
	});

	function change_btn(e) {
		var btns = document.querySelectorAll(".btnbox");
		btns.forEach(function(btn, i) {
			if (e.currentTarget == btn) {
				btn.classList.add("active");
			} else {
				btn.classList.remove("active");
			}
		});
		console.log(e.currentTarget);
	}

	function count(type) {
		// 결과를 표시할 element
		const resultElement = document.getElementById('result');

		// 현재 화면에 표시된 값
		let number = resultElement.innerText;

		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			number = parseInt(number) - 1;
		}

		// 결과 출력
		resultElement.innerText = number;
	}
</script>
</head>
<body>
	<header>
		<div class="inner" class="fixedclear">
			<h1>
				<a href="#"><img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/logo.svg" alt="저긴어때"></a>
			</h1>
			<div id="room_val">호텔</div>
			<ul>
				<li>
					<input type="search" class="search_bar"> 
					<a href="#" class="search_btn"><i class="xi-search xi-1x search"></i></a>
				</li>
				<!-- **검색창 구현**-->
				<li><a href="#" id="login">로그인</a></li>
				<!-- 폰트 스타일 수정-->
			</ul>

		</div>
	</header>
	<!-- end header-->
	<section id="body_inner" class="fixedclear">
		<section id="inner" class="fixedclear">
			<div id="select" class="fixedclear">
				<div id="select_main">
					<p>
						<c:if test="${area ne null and area ne ''}">
							${area}
							<div id="reselect_btn">
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
						</c:if>
						<c:if test="${area eq null or area eq ''}">지역선택</c:if>
					</p>
				</div>
				<div class="selectBoth">
					<div id="select_left">
						<div class="select_under">
							<div>인기지역</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=부산 전체">부산 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=전라 전체">전라 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=제주 전체">제주 전체</a>
							</li>
						</ul>
						<div class="select_under">
							<div>부산</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=부산 전체">부산 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=해운대/마린시티">해운대/마린시티</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=광안리/경성대">광안리/경성대</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=부산역">부산역</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=송정/기장">송정/기장</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=자갈치/남포동/영도">자갈치/남포동/영도</a>
							</li>
						</ul>
						<div class="select_under">
							<div>경기</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=경기 전체">경기 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=수원/화성">수원/화성</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=남양주/구리/성남/분당">남양주/구리/성남/분당</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=용인/동탄">용인/동탄</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=이천/광주/여주/하남">이천/광주/여주/하남</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=가평/청평/양평">가평/청평/양평</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=부천/광명/시흥/안산">부천/광명/시흥/안산</a>
							</li>
						</ul>
						<div class="select_under">
							<div>강원</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=강원 전체">강원 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=속초/양양/고성">속초/양양/고성</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=강릉">강릉</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=평창/정선/영월">평창/정선/영월</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=동해/삼척/태백">동해/삼척/태백</a>
							</li>
						</ul>
						<div class="select_under">
							<div>전라</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=전라 전체">전라 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=전주/완주">전주/완주</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=광주/나주">광주/나주</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=여수">여수</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=순천/광양/담양/보성/화순">순천/광양/담양/보성/화순</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=목포/신안/영광/진도/고흥/영암/완도">목포/신안/영광/진도/고흥/영암/완도</a>
							</li>
						</ul>
					</div>
					<div id="select_right">
						<div class="select_under">
							<div>서울</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=서울 전체">서울 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=강남/역삼/삼성">강남/역삼/삼성</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=서울역/이태원/용산">서울역/이태원/용산</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=여의도">여의도</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=영등포역">영등포역</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=서초/교대/사당">서초/교대/사당</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=건대입구/성수/왕십리">건대입구/성수/왕십리</a>
							</li>
						</ul>
						<div class="select_under">
							<div>제주</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=제주 전체">제주 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=제주시/제주국제공항">제주시/제주국제공항</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=서귀포시">서귀포시</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=애월/한림/협재">애월/한림/협재</a>
							</li>
						</ul>
						<div class="select_under">
							<div>인천</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=인천 전체">인천 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=송도/소래포구">송도/소래포구</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=구읍뱃터/월미">구읍뱃터/월미</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=인천국제공항/강화/을왕리/영종">인천국제공항/강화/을왕리/영종</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=청라/계양/부평">청라/계양/부평</a>
							</li>
						</ul>
						<div class="select_under">
							<div>경상</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=경상 전체">경상 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=경주">경주</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=울산/양산">울산/양산</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=거제/통영">거제/통영</a>
							</li>							
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=포항/영덕/울진/청송">포항/영덕/울진/청송</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=창원/마산/진해/김해">창원/마산/진해/김해</a>
							</li>
						</ul>
						<div class="select_under">
							<div>충청</div>
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
						</div>
						<ul class="open_menu">
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=충청 전체">충청 전체</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=대전/세종">대전/세종</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=천안/아산/도고">천안/아산/도고</a>
							</li>
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=보령/대천/부여/공주/금산">보령/대천/부여/공주/금산</a>
							</li>							
							<li class="c1">
								<a href="<%=request.getContextPath()%>/lodging/lodgingList_hotel.do?area=청주/음성/진천">청주/음성/진천</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="inner1" class="fixedclear">
				<div id="main_filter" class="fixedclear">
					<div class="filter" id="filter_day">날짜</div>
					<form>
						<input type="text" name="fromDate" id="fromDate">
						<input type="text" name="toDate" id="toDate">
					</form>
					
					<div class="filter">베드 타입</div>
					<ul class="btnsBox">
						<li class="btnbox active" onclick="change_btn(event)">
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/single_bed.jpg" alt="single_bed">
							<p>싱글</p>
						</li>
						<li class="btnbox active" onclick="change_btn(event)">
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/double_bed.jpg" alt="single_bed">
							<p>더블</p>
						</li>
						<li class="btnbox active" onclick="change_btn(event)">
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/twin_bed.jpg" alt="single_bed">
							<p>트윈</p></a>
						</li>
						<li class="btnbox active" onclick="change_btn(event)">
							<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/ondol_bed.jpg" alt="single_bed">
							<p>온돌</p>
						</li>
					</ul>
					<div class="filter" id="filter_num">
						인원
						<button type='button' onclick='count("plus")' value='+' class="updown">+</button>
						<span id='result'>2</span>
						<button type='button' onclick='count("minus")' value='-' class="updown">-</button>
					</div>
					<div id="reset">
						<button type="button" onclick="location.href = '#' " name="reset">초기화</button>
						<button type="button" onclick="location.href = '#' " name="set">적용</button>
					</div>
					<div class="filter">공용시설</div>
					<div class="public_in" class="fixedclear">
						<ul id="public_left" class="filter_check">
							<li><input type=checkbox> <label>피트니스</label></li>
							<li><input type=checkbox> <label>사우나</label></li>
							<li><input type=checkbox> <label>레스토랑</label></li>
							<li><input type=checkbox> <label>라운지</label></li>
							<li><input type=checkbox> <label>BBQ</label></li>
							<li><input type=checkbox> <label>공용스파</label></li>
							<li><input type=checkbox> <label>세미나실</label></li>
							<li><input type=checkbox> <label>노래방</label></li>
							<li><input type=checkbox> <label>세탁기</label></li>
							<li><input type=checkbox> <label>탈수기</label></li>
							<li><input type=checkbox> <label>취사가능</label></li>
							<li><input type=checkbox> <label>온천</label></li>
						</ul>
						<ul id="public_right" class="filter_check">
							<li><input type=checkbox> <label>수영장</label></li>
							<li><input type=checkbox> <label>골프장</label></li>
							<li><input type=checkbox> <label>엘레베이터</label></li>
							<li><input type=checkbox> <label>공용PC</label></li>
							<li><input type=checkbox> <label>카페</label></li>
							<li><input type=checkbox> <label>족구장</label></li>
							<li><input type=checkbox> <label>편의점</label></li>
							<li><input type=checkbox> <label>주방/식당</label></li>
							<li><input type=checkbox> <label>건조기</label></li>
							<li><input type=checkbox> <label>주차장</label></li>
							<li><input type=checkbox> <label>공용샤워실</label></li>
							<li><input type=checkbox> <label>스키장</label></li>
						</ul>
					</div>

					<div id="filter_in" class="filter">객실 내 시설</div>
					<div class="public_in">
						<ul id="in_left" class="filter_check">
							<li><input type=checkbox> <label>객실스파</label></li>
							<li><input type=checkbox> <label>와이파이</label></li>
							<li><input type=checkbox> <label>TV</label></li>
							<li><input type=checkbox> <label>냉장고</label></li>
							<li><input type=checkbox> <label>욕조</label></li>
							<li><input type=checkbox> <label>다리미</label></li>
						</ul>
						<ul id="in_right" class="filter_check">
							<li><input type=checkbox> <label>미니바</label></li>
							<li><input type=checkbox> <label>욕실용품</label></li>
							<li><input type=checkbox> <label>에어컨</label></li>
							<li><input type=checkbox> <label>객실샤워실</label></li>
							<li><input type=checkbox> <label>드라이기</label></li>
							<li><input type=checkbox> <label>전기밥솥</label></li>
						</ul>
					</div>
					<div class="filter" id="odd">기타</div>
					<div class="public_in">
						<ul id="odd_left" class="filter_check">
							<li><input type=checkbox> <label>픽업가능</label></li>
							<li><input type=checkbox> <label>프린터사용</label></li>
							<li><input type=checkbox> <label>개인사물함</label></li>
							<li><input type=checkbox> <label>조식포함</label></li>
							<li><input type=checkbox> <label>발렛파킹</label></li>
							<li><input type=checkbox> <label>반려견동반</label></li>
						</ul>
						<ul id="odd_right" class="filter_check">
							<li><input type=checkbox> <label>객실내취사</label></li>
							<li><input type=checkbox> <label>짐보관가능</label></li>
							<li><input type=checkbox> <label>무료주차</label></li>
							<li><input type=checkbox> <label>객실내흡연</label></li>
							<li><input type=checkbox> <label>금연</label></li>
							<li><input type=checkbox> <label>카드결제</label></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="inner2">
				<ul id="up">
					<li>
						<button type="button" onclick="change_btn2(event,5)" id="up5" class="btnbox2">리뷰많은순</button>
					</li>
					<li>
						<button type="button" onclick="change_btn2(event,4)" id="up4" class="btnbox2">별점순</button>						
					</li>
					<li>
						<button type="button" onclick="change_btn2(event,3)" id="up3" class="btnbox2 <c:if test="${type eq '3'}">active2</c:if>">가격높은순</button>
					</li>
					<li>
						<button type="button" onclick="change_btn2(event,2)" id="up2" class="btnbox2  <c:if test="${type eq '2'}">active2</c:if>">가격낮은순</button>
					</li>
					<li>						
						<button type="button" onclick="change_btn2(event,1)" id="up1" class="btnbox2">추천순</button>
					</li>
				</ul>
				<h2>인기추천</h2>					
					<c:forEach var="vo" items="${list}" varStatus="status">
						<!-- break를 위한 boolean변수 doneLoop 선언 -->
						<c:set var="doneLoop" value="false" />
						<!-- doneLoop 논리값이 반대가 되면 break -->							
						<c:if test="${doneLoop ne true}">
							<a href="<%=request.getContextPath() %>/lodging/lodgingView.do?lidx=${vo.lidx}">
								<div class="imgbor">
									<div class="img_left">
										<ul>
											<li class="up_img">
												<h3>${vo.lodgingname}</h3>
												<p>${vo.satis}</p>
												<p>${vo.lodgingaddr}</p>
											</li>
										</ul>
									</div>
									<div class="img_right">
										<div>남은 객실 ${vo.rnum}개</div>
										<div>
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.rprice}" />
											원
										</div>
									</div>
									<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${vo.limagename}">
								</div>
							</a>
							<!-- doneLoop 논리값 반대 설정 = break -->
							<c:set var="doneLoop" value="true" />
						</c:if>						
					</c:forEach>
			</div>
		</section>

		<footer class="fixedclear">
			<div id="foot">
				<br> <br>
				<div id="copy">
					(주)저긴어때 l 대표이사 : 홍이젠 l 사업자 등록번호 : 104-14-100400 l 메일 :
					Whatdoyouthink@naver.com <br> 주소 : 전라북도 전주시 덕진구 금암1동 667-52 5층
					l 전화번호 : 063-104-1004 (오전 9시 ~ 오후 5시)<br> <br> Copyright
					WD COMPANY Corp. All rights reserved. <br> <br>

				</div>
			</div>
		</footer>
	</section>
</body>
</html>