<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="team.projectA.vo.*" %>
<%
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("list");
	//pageContext.setAttribute(arg0, arg1) //page attribute(이엘; .., request, page, ..)
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
	
	/* var url = location.href; //url얻어오기
	var frm = document.getElementsByTagName("frm");
	console.log("Aaaa"+frm);
	if(frm.submit() == true){
		var params = location.search; //파라미터 추출해서 변수에 담기
		
		//추출한걸 대상링크 뒤에 붙인다
		console.log(url);
		console.log(params);	
	}; */
	
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
		$('#fromDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

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
		$('#toDate').datepicker('setDate', '+1D');
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
		location.href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=${area}&type="+type;
		
		<%-- <%
		String uri = request.getRequestURI();
		
		%>
		
		var uri  = "<%=uri%>";
		
		var btnnn = document.frm.dddd.value;
		
		location.href = uri + "ddd="+btnnn --%>
	}

	function init() {
		for (var i = 0; i < div2.length; i++) {
			div2[i].addEventListener("click", change_btn2);
		}
	}

	init();

	//베드필터
	function change_btn(e, name) {
		var btn = e.currentTarget;
		var imgs = btn.querySelector("img");
		var ps = btn.querySelector("p");
		var checks = btn.querySelector("input");
		
		if (checks.checked == true) {
			ps.classList.add("active");
			imgs.src = "<%=request.getContextPath()%>/resources/images/lodgingList_images/"+name+"_c.jpg";
		} else {
			ps.classList.remove("active");
			imgs.src = "<%=request.getContextPath()%>/resources/images/lodgingList_images/"+name+".jpg";
		}
	}
	
	<%-- function change_btn(e, name) {
		var btn = e.currentTarget;
		var imgs = btn.querySelector("img");
		
		if (btn.classList.contains("active") != true) {
			btn.classList.add("active");
			imgs.src = "<%=request.getContextPath()%>/resources/images/lodgingList_images/"+name+"_c.jpg";
		} else {
			btn.classList.remove("active");
			imgs.src = "<%=request.getContextPath()%>/resources/images/lodgingList_images/"+name+".jpg";
		}
	} --%>
	//인원
	function count(type) {
		// 결과를 표시할 element
		const result = document.querySelector('#result');

		// 현재 화면에 표시된 값
		let number = result.value;
		
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus' && number != 1 ) {
			number = parseInt(number) - 1;
		}
		
		// 결과 출력
		result.value = number;
	}
	
	$(document).ready(function(){
		$("#trueReset").on("click",function(){
			history.replaceState({}, null, location.pathname); //파라미터 전부 지우고 
			location.reload() //페이지 새로고침
			})

		})
</script>
<script>
	//검색창 출력 버튼
	$(function(){
		$(".searchBarOn").click(function() {
		    $("#searchArea").animate({
		        width: "toggle"}, 200, "linear");
		    $(".search_background").toggle();
		    $("#room_val").toggle();
		})
	})
</script>
</head>
<body>
	<header>
        <div id="inner">
            <h1>
            	<a href="<%=request.getContextPath()%>/index/index.do">
            		<img src="<%=request.getContextPath() %>/resources/images/index_images/logo.svg" alt="저긴어때">
            	</a>
            </h1>
            <div id="room_val">GH</div>
            <ul>
	            <div class="search_background">
	            </div>
	                <li id="searchArea">
	                    <select name="searchType" class="search_bar font_Style" id="search_bar">
	                     	<option value="n"<c:out value="${searchType == null ? 'selected' : ''}"/>>-----</option>
	                     	<option value="ln"<c:out value="${searchType eq 'ln' ? 'selected' : ''}"/>>숙소명</option>
	                     	<option value="la"<c:out value="${searchType eq 'la' ? 'selected' : ''}"/>>지역</option>
	                     </select>
	                     <input type="text" name="keyword" id="keywordInput" class="font_Style" value="${keyword}"/>
	                	   	 <button class="btn-1 font_Style" type="button" id="searchBtn">검색</button>
	                </li>
                <li>
                	<a class="searchBarOn">
                		<i class="xi-search"></i>
                	</a>
                </li>
                <li>
                	<c:if test="${login == null }">
                		<a href="<%=request.getContextPath() %>/login/login.do" id="login" class="font_Style">로그인</a>
                	</c:if> 
                	<c:if test="${login.userType.equals('일반회원')}">
						<a href="<%=request.getContextPath() %>/logout/logout.do" class="logout font_Style">로그아웃</a>
						<a href="<%=request.getContextPath() %>/mypage/info.do" id="mypage" class="font_Style">마이페이지</a>
					</c:if> 
					 <c:if test="${login.userType.equals('판매자')}">
						<a href="<%=request.getContextPath() %>/logout/logout.do" class="logout font_Style">로그아웃</a>
						<a href="<%=request.getContextPath() %>/seller/sellerInfo.do" id="seller" class="font_Style">판매자페이지</a>
					</c:if>
					<c:if test="${login.userType.equals('관리자')}">
						<a href="<%=request.getContextPath() %>/logout/logout.do" class="logout font_Style" >로그아웃</a>
						<a href="<%=request.getContextPath() %>/manager/managerUser.do" id="manager" class="font_Style">관리자페이지</a>
					</c:if>
                </li>          <!-- 폰트 스타일 수정-->
            </ul>
        </div>
    </header>
    
    <main>			
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
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=부산 전체">부산 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=전라 전체">전라 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=제주 전체">제주 전체</a>
								</li>
							</ul>
							<div class="select_under">
								<div>부산</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=부산 전체">부산 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=해운대/마린시티">해운대/마린시티</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=광안리/경성대">광안리/경성대</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=부산역">부산역</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=송정/기장">송정/기장</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=자갈치/남포동/영도">자갈치/남포동/영도</a>
								</li>
							</ul>
							<div class="select_under">
								<div>경기</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=경기 전체">경기 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=수원/화성">수원/화성</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=남양주/구리/성남/분당">남양주/구리/성남/분당</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=용인/동탄">용인/동탄</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=이천/광주/여주/하남">이천/광주/여주/하남</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=가평/청평/양평">가평/청평/양평</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=부천/광명/시흥/안산">부천/광명/시흥/안산</a>
								</li>
							</ul>
							<div class="select_under">
								<div>강원</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=강원 전체">강원 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=속초/양양/고성">속초/양양/고성</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=강릉">강릉</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=평창/정선/영월">평창/정선/영월</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=동해/삼척/태백">동해/삼척/태백</a>
								</li>
							</ul>
							<div class="select_under">
								<div>전라</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=전라 전체">전라 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=전주/완주">전주/완주</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=광주/나주">광주/나주</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=여수">여수</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=순천/광양/담양/보성/화순">순천/광양/담양/보성/화순</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=군산/익산">군산/익산</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=목포/신안/영광/진도/고흥/영암/완도">목포/신안/영광/진도/고흥/영암/완도</a>
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
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=서울 전체">서울 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=홍대/신촌/마포">홍대/신촌/마포</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=북촌/인사동/종로/동대문">북촌/인사동/종로/동대문</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=명동/남산/중구">명동/남산/중구</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=강남/잠실/삼성/서초">강남/잠실/삼성/서초</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=이태원/서울역/용산">이태원/서울역/용산</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=영등포/신림/김포공항">영등포/신림/김포공항</a>
								</li>
							</ul>
							<div class="select_under">
								<div>제주</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=제주 전체">제주 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=제주시/제주국제공항">제주시/제주국제공항</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=서귀포시">서귀포시</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=애월/한림/협재">애월/한림/협재</a>
								</li>
							</ul>
							<div class="select_under">
								<div>인천</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=인천 전체">인천 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=송도/소래포구">송도/소래포구</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=구읍뱃터/월미">구읍뱃터/월미</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=인천국제공항/강화/을왕리/영종">인천국제공항/강화/을왕리/영종</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=청라/계양/부평">청라/계양/부평</a>
								</li>
							</ul>
							<div class="select_under">
								<div>경상</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=경상 전체">경상 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=경주">경주</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=울산/양산">울산/양산</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=거제/통영">거제/통영</a>
								</li>							
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=포항/영덕/울진/청송">포항/영덕/울진/청송</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=창원/마산/진해/김해">창원/마산/진해/김해</a>
								</li>
							</ul>
							<div class="select_under">
								<div>충청</div>
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
							</div>
							<ul class="open_menu">
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=충청 전체">충청 전체</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=대전/세종">대전/세종</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=천안/아산/도고">천안/아산/도고</a>
								</li>
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=보령/대천/부여/공주/금산">보령/대천/부여/공주/금산</a>
								</li>							
								<li class="c1">
									<a href="<%=request.getContextPath()%>/lodging/lodgingList_gh.do?area=청주/음성/진천">청주/음성/진천</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="inner1" class="fixedclear">
					<div id="main_filter" class="fixedclear">
						<form name="frm" action="lodgingList_gh.do" method="get">
							<div class="filter" id="filter_day">날짜</div>
							<div>
								<input type="text" name="fromDate" id="fromDate" value="${fromDate}">
								<input type="text" name="toDate" id="toDate" value="${toDate}">
							</div>
							<input type="hidden" name="area" value="${area}" />
							<input type="hidden" name="type" value="${type}" />
							<div class="filter">베드 타입</div>
							<ul class="btnsBox">
								<%
								String[] bedArr  = request.getParameterValues("bedArr");								
							
								String str1 = "<li class='btnbox' onclick='change_btn(event, \"single_bed\")'><label>"
												+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/single_bed.jpg' alt='single_bed'><p>싱글</p>"
												+"<input type='checkbox' name='bedArr' value='single_bed'></label></li>";
								String str2 = "<li class='btnbox' onclick='change_btn(event, \"double_bed\")'><label>"
												+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/double_bed.jpg' alt='double_bed'><p>더블</p>"
												+"<input type='checkbox' name='bedArr' value='double_bed'></label></li>";
								String str3 = "<li class='btnbox' onclick='change_btn(event, \"twin_bed\")'><label>"
												+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/twin_bed.jpg' alt='twin_bed'><p>트윈</p>"
												+"<input type='checkbox' name='bedArr' value='twin_bed'></label></li>";
								String str4 = "<li class='btnbox' onclick='change_btn(event, \"ondol_bed\")'><label>"
												+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/ondol_bed.jpg' alt='ondol_bed'><p>온돌</p>"
												+"<input type='checkbox' name='bedArr' value='ondol_bed'></label></li>";
								
								if(bedArr != null){
									for (String pbed : bedArr){
										if (pbed.equals("single_bed")){
											str1 = "<li class='btnbox' onclick='change_btn(event, \"single_bed\")'><label>"
													+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/single_bed_c.jpg' alt='single_bed'><p class='active'>싱글</p>"
													+"<input type='checkbox' name='bedArr' value='single_bed' checked></label></li>";
										}
										if (pbed.equals("double_bed")){
											str2 = "<li class='btnbox' onclick='change_btn(event, \"double_bed\")'><label>"
													+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/double_bed_c.jpg' alt='double_bed'><p class='active'>더블</p>"
													+"<input type='checkbox' name='bedArr' value='double_bed' checked></label></li>";
										}
										if (pbed.equals("twin_bed")){
											str3 = "<li class='btnbox' onclick='change_btn(event, \"twin_bed\")'><label>"
													+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/twin_bed_c.jpg' alt='twin_bed'><p class='active'>트윈</p>"
													+"<input type='checkbox' name='bedArr' value='twin_bed' checked></label></li>";
										}
										if (pbed.equals("ondol_bed")){
											str4 = "<li class='btnbox' onclick='change_btn(event, \"ondol_bed\")'><label>"
													+"<img src='"+request.getContextPath()+"/resources/images/lodgingList_images/ondol_bed_c.jpg' alt='ondol_bed'><p class='active'>온돌</p>"
													+"<input type='checkbox' name='bedArr' value='ondol_bed' checked></label></li>";
										}
									}
								}
								
								out.println(str1);
								out.println(str2);
								out.println(str3);
								out.println(str4);
								%>				
								
								<%-- <li class="btnbox" onclick="change_btn(event,'single_bed')">
									<label>
										<c:if test="${empty paramValues.bed}">
											<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/single_bed.jpg" alt="single_bed">
											<p>싱글</p>
											<input type="checkbox" name="bed" value="single_bed">
										</c:if>
										<c:if test="${not empty paramValues.bed}">
											<c:choose>
												<c:when test="">
													<c:forEach var="pbed" items="${paramValues.bed}" varStatus="status">
															<c:if test="${pbed eq 'single_bed'}">
																<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/single_bed_c.jpg" alt="single_bed">
																<p class="active">싱글</p>
																<input type="checkbox" name="bed" value="single_bed" checked>
															</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/single_bed.jpg" alt="single_bed">
													<p>싱글</p>
													<input type="checkbox" name="bed" value="single_bed">
												</c:otherwise>
											</c:choose>
										</c:if>
									</label>								
								</li>
								<li class="btnbox" onclick="change_btn(event,'double_bed')">
									<label>
										<c:if test="${empty paramValues.bed}">
											<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/double_bed.jpg" alt="double_bed">
											<p>더블</p>
											<input type="checkbox" name="bed" value="double_bed">
										</c:if>
										<c:if test="${not empty paramValues.bed}">
											<c:forEach var="pbed" items="${paramValues.bed}" varStatus="status">
												<c:choose>
													<c:when test="${pbed eq 'double_bed'}">
														<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/double_bed_c.jpg" alt="double_bed">
														<p class="active">더블</p>
														<input type="checkbox" name="bed" value="double_bed" checked>
													</c:when>
													<c:otherwise>
														<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/double_bed.jpg" alt="double_bed">
														<p>더블</p>
														<input type="checkbox" name="bed" value="double_bed">
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
									</label>								
								</li>
								<li class="btnbox" onclick="change_btn(event,'twin_bed')">
									<label>
										<c:if test="${empty paramValues.bed}">
											<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/twin_bed.jpg" alt="twin_bed">
											<p>트윈</p>
											<input type="checkbox" name="bed" value="twin_bed">
										</c:if>
										<c:if test="${not empty paramValues.bed}">
											<c:forEach var="pbed" items="${paramValues.bed}" varStatus="status">
												<c:choose>
													<c:when test="${pbed eq 'double_bed'}">
														<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/twin_bed_c.jpg" alt="twin_bed">
														<p class="active">트윈</p>
														<input type="checkbox" name="bed" value="double_bed" checked>
													</c:when>
													<c:otherwise>
														<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/twin_bed.jpg" alt="twin_bed">
														<p>트윈</p>
														<input type="checkbox" name="bed" value="twin_bed">
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
									</label>								
								</li>
								<li class="btnbox" onclick="change_btn(event,'ondol_bed')">
									<label>
										<c:if test="${empty paramValues.bed}">
											<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/ondol_bed.jpg" alt="ondol_bed">
											<p>온돌</p>
											<input type="checkbox" name="bed" value="ondol_bed">
										</c:if>
										<c:if test="${not empty paramValues.bed}">
											<c:forEach var="pbed" items="${paramValues.bed}" varStatus="status">
												<c:choose>
													<c:when test="${pbed eq 'ondol_bed'}">
														<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/ondol_bed_c.jpg" alt="ondol_bed">
														<p class="active">온돌</p>
														<input type="checkbox" name="bed" value="ondol_bed" checked>
													</c:when>
													<c:otherwise>
														<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/ondol_bed.jpg" alt="ondol_bed">
														<p>온돌</p>
														<input type="checkbox" name="bed" value="ondol_bed">
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
									</label>								
								</li> --%>
							</ul>
							<div class="filter" id="filter_num">
								인원
								<button type='button' onclick='count("minus")' value='-' class="updown">-</button>
								<input id="result" name="men" value="<c:if test='${men == null}'>2</c:if><c:if test='${men != null}'>${men}</c:if>" readonly />
								<button type='button' onclick='count("plus")' value='+' class="updown">+</button>
							</div>
							<div id="reset" >
								<input type="reset" id = "trueReset">						
								<input type="submit" value="적용">
								
							</div>
							<div class="public_in" class="fixedclear">
								<ul id="public_left" class="filter_check">
									<li><label><input type="checkbox" name="fitness" <c:if test="${linvo.fitness eq 'on'}">checked</c:if>>피트니스</label></li>
			    					<li><label><input type="checkbox" name="sauna" <c:if test="${linvo.sauna eq 'on'}">checked</c:if>>사우나</label></li>
			    					<li><label><input type="checkbox" name="restaurant" <c:if test="${linvo.restaurant eq 'on'}">checked</c:if>>레스토랑</label></li>
			    					<li><label><input type="checkbox" name="lounge" <c:if test="${linvo.lounge eq 'on'}">checked</c:if>>라운지</label></li>
			    					<li><label><input type="checkbox" name="bbq" <c:if test="${linvo.bbq eq 'on'}">checked</c:if>>BBQ</label></li>
			    					<li><label><input type="checkbox" name="publicspa" <c:if test="${linvo.publicspa eq 'on'}">checked</c:if>>공용스파</label></li>
			    					<li><label><input type="checkbox" name="seminar" <c:if test="${linvo.seminar eq 'on'}">checked</c:if>>세미나실</label></li>
			    					<li><label><input type="checkbox" name="singing" <c:if test="${linvo.singing eq 'on'}">checked</c:if>>노래방</label></li>
			    					<li><label><input type="checkbox" name="washingmachine" <c:if test="${linvo.washingmachine eq 'on'}">checked</c:if>>세탁기</label></li>
			    					<li><label><input type="checkbox" name="dehydrator" <c:if test="${linvo.dehydrator eq 'on'}">checked</c:if>>탈수기</label></li>
			    					<li><label><input type="checkbox" name="cooking" <c:if test="${linvo.cooking eq 'on'}">checked</c:if>>취사가능</label></li>
			    					<li><label><input type="checkbox" name="spa" <c:if test="${linvo.spa eq 'on'}">checked</c:if>>온천</label></li>
								</ul>
								<ul id="public_right" class="filter_check">
									<li><label><input type="checkbox" name="pool" <c:if test="${linvo.pool eq 'on'}">checked</c:if>>수영장</label></li>
									<%-- <li><label><input type="checkbox" name="pool" <% 
									String str = request.getParameter("pool");
									if (str == null) str = "";
									if (str.equals("on")) {%> checked <%} %>>수영장</label></li> --%>
			    					<li><label><input type="checkbox" name="golf" <c:if test="${linvo.golf eq 'on'}">checked</c:if>>골프장</label></li>
			    					<li><label><input type="checkbox" name="elevator" <c:if test="${linvo.elevator eq 'on'}">checked</c:if>>엘리베이터</label></li>
			    					<li><label><input type="checkbox" name="pc" <c:if test="${linvo.pc eq 'on'}">checked</c:if>>공용PC</label></li>
			    					<li><label><input type="checkbox" name="cafe" <c:if test="${linvo.cafe eq 'on'}">checked</c:if>>카페</label></li>
			    					<li><label><input type="checkbox" name="footvolleyball" <c:if test="${linvo.footvolleyball eq 'on'}">checked</c:if>>족구장</label></li>
			    					<li><label><input type="checkbox" name="store" <c:if test="${linvo.store eq 'on'}">checked</c:if>>편의점</label></li>
			    					<li><label><input type="checkbox" name="dining" <c:if test="${linvo.dining eq 'on'}">checked</c:if>>주방/식당</label></li>
			    					<li><label><input type="checkbox" name="dryer" <c:if test="${linvo.dryer eq 'on'}">checked</c:if>>건조기</label></li>
			    					<li><label><input type="checkbox" name="parking" <c:if test="${linvo.parking eq 'on'}">checked</c:if>>주차장</label></li>
			    					<li><label><input type="checkbox" name="publicshower" <c:if test="${linvo.publicshower eq 'on'}">checked</c:if>>공용샤워실</label></li>
			    					<li><label><input type="checkbox" name="ski" <c:if test="${linvo.ski eq 'on'}">checked</c:if>>스키장</label></li>
								</ul>
							</div>
		
							<div id="filter_in" class="filter">객실 내 시설</div>
							<div class="public_in">
								<ul id="in_left" class="filter_check">
									<li><label><input type=checkbox name="roomspa" <c:if test="${rinvo.roomspa eq 'on'}">checked</c:if>> 객실스파</label></li>
									<li><label><input type=checkbox name="wifi" <c:if test="${rinvo.wifi eq 'on'}">checked</c:if>> 와이파이</label></li>
									<li><label><input type=checkbox name="tv" <c:if test="${rinvo.tv eq 'on'}">checked</c:if>> TV</label></li>
									<li><label><input type=checkbox name="refri" <c:if test="${rinvo.refri eq 'on'}">checked</c:if>> 냉장고</label></li>
									<li><label><input type=checkbox name="bath" <c:if test="${rinvo.bath eq 'on'}">checked</c:if>> 욕조</label></li>
									<li><label><input type=checkbox name="iron" <c:if test="${rinvo.iron eq 'on'}">checked</c:if>> 다리미</label></li>
								</ul>
								<ul id="in_right" class="filter_check">
									<li><label><input type=checkbox name="minibar" <c:if test="${rinvo.minibar eq 'on'}">checked</c:if>> 미니바</label></li>
									<li><label><input type=checkbox name="bathitem" <c:if test="${rinvo.bathitem eq 'on'}">checked</c:if>> 욕실용품</label></li>
									<li><label><input type=checkbox name="aircon" <c:if test="${rinvo.aircon eq 'on'}">checked</c:if>> 에어컨</label></li>
									<li><label><input type=checkbox name="shower" <c:if test="${rinvo.shower eq 'on'}">checked</c:if>> 객실샤워실</label></li>
									<li><label><input type=checkbox name="dryer" <c:if test="${rinvo.dryer eq 'on'}">checked</c:if>> 드라이기</label></li>
									<li><label><input type=checkbox name="ricecooker" <c:if test="${rinvo.ricecooker eq 'on'}">checked</c:if>> 전기밥솥</label></li>
								</ul>
							</div>
							<div class="filter" id="odd">기타</div>
							<div class="public_in">
								<ul id="odd_left" class="filter_check">
									<li><label><input type="checkbox" name="pickup" <c:if test="${linvo.pickup eq 'on'}">checked</c:if>>픽업가능</label></li>
		    						<li><label><input type="checkbox" name="printer" <c:if test="${linvo.printer eq 'on'}">checked</c:if>>프린터사용</label></li>
		    						<li><label><input type="checkbox" name="locker" <c:if test="${linvo.locker eq 'on'}">checked</c:if>>개인사물함</label></li>
		    						<li><label><input type="checkbox" name="breakfast" <c:if test="${linvo.breakfast eq 'on'}">checked</c:if>>조식포함</label></li>
		    						<li><label><input type="checkbox" name="valetparking" <c:if test="${linvo.valetparking eq 'on'}">checked</c:if>>발렛파킹</label></li>
		    						<li><label><input type="checkbox" name="dog" <c:if test="${linvo.dog eq 'on'}">checked</c:if>>반려견동반</label></li>
								</ul>
								<ul id="odd_right" class="filter_check">
									<li><label><input type="checkbox" name="inroomcooking" <c:if test="${linvo.inroomcooking eq 'on'}">checked</c:if>>객실내취사</label></li>
		    						<li><label><input type="checkbox" name="keepluggage" <c:if test="${linvo.keepluggage eq 'on'}">checked</c:if>>짐보관가능</label></li>
		    						<li><label><input type="checkbox" name="freeparking" <c:if test="${linvo.freeparking eq 'on'}">checked</c:if>>무료주차</label></li>    						
		    						<li><label><input type="checkbox" name="inroomsmoking" <c:if test="${linvo.inroomsmoking eq 'on'}">checked</c:if>>객실내흡연</label></li>
		    						<li><label><input type="checkbox" name="nosmoking" <c:if test="${linvo.nosmoking eq 'on'}">checked</c:if>>금연</label></li>
		    						<li><label><input type="checkbox" name="creditcard" <c:if test="${linvo.creditcard eq 'on'}">checked</c:if>>카드결제</label></li>
								</ul>
							</div>
						</form>
					</div>
				</div>
				<div id="inner2">
					<ul id="up">
						<li>
							<button type="button" onclick="change_btn2(event,5)" id="up5" class="btnbox2  <c:if test="${type eq '5'}">active2</c:if>">리뷰많은순</button>
						</li>
						<li>
							<button type="button" onclick="change_btn2(event,4)" id="up4" class="btnbox2  <c:if test="${type eq '4'}">active2</c:if>">만족도순</button>						
						</li>
						<li>
							<button type="button" onclick="change_btn2(event,3)" id="up3" class="btnbox2 <c:if test="${type eq '3'}">active2</c:if>">가격높은순</button>
						</li>
						<li>
							<button type="button" onclick="change_btn2(event,2)" id="up2" class="btnbox2  <c:if test="${type eq '2'}">active2</c:if>">가격낮은순</button>
						</li>
						<li>						
							<button type="button" onclick="change_btn2(event,1)" id="up1" class="btnbox2  <c:if test="${type eq '1'}">active2</c:if>">최근등록순</button>
						</li>
					</ul>
					<h2>인기추천</h2>		
						<c:if test="${empty list}">
							<div class="empty">
								<p>현재 조건에 맞는 숙소가 없습니다.</p>
								 지역을 변경하거나
								<br>
								일정, 상세조건을 재설정해 보세요.
							</div>
						</c:if>			
						<c:forEach var="vo" items="${list}" varStatus="status">
							<!-- break를 위한 boolean변수 doneLoop 선언 -->
							<c:set var="doneLoop" value="false" />
							<!-- doneLoop 논리값이 반대가 되면 break -->
							<c:if test="${doneLoop ne true}">
								<a href="<%=request.getContextPath() %>/lodging/lodgingView.do?lidx=${vo.lidx}&fromDate=${fromDate}&toDate=${toDate}&men=${men}">
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
											<div><c:if test="${vo.spareroom < 6}">남은 객실 ${vo.spareroom}개</c:if></div>
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
		</main>

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