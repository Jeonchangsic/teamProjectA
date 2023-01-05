<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="team.projectA.vo.*" %>
<%
	Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");
	List<RoominVO> list = (List<RoominVO>)request.getAttribute("list");
	//숙소 슬라이더에 객실 이미지 삽입하기 (for문 및 배열 사용) //for문으로 모든 이미지 담기
	String total_img = (String)map.get("limagename"); 
	for(int i=0; i<list.size(); i++){
		String imgss = list.get(i).getRimage1()+","
						+list.get(i).getRimage2()+","
						+list.get(i).getRimage3()+","
						+list.get(i).getRimage4()+","
						+list.get(i).getRimage5();
		
		total_img = total_img +","+ imgss.replaceAll(",null", "");
	}
	//out.println(total_img);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소상세페이지</title>
    
	<link href="<%= request.getContextPath() %>/resources/images/lodgingView_images/favicon.jpg" rel="shortcut icon">

    <link href="<%= request.getContextPath() %>/resources/css/lodging_css/lodging_reset.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/lodging_css/lodgingView_style.css" rel="stylesheet"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!--XE아이콘-->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/css/jquery-3.6.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/jquery-ui.css">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    
    <script>
        //info_detail
        $(document).ready(function(){
            $(".category").click(function(){
                if($(this).next(".info_detail").is(":visible")){
                    $(this).next(".info_detail").css("display", "none");
                }else{
                    $(this).next(".info_detail").css("display", "block");
                }
            });
            

        });//---info.detail

        //modal
        $(document).on('click', '.room_info', function(){            
            $(this).prev('.modal').css({'display':'block'});
            $('html, body').css({'overflow': 'hidden'}); //모달팝업 중 html,body의 scroll을 hidden시킴
            });
        
        $(document).on('click', '.modal_close', function(){            
            $('.modal').css({'display':'none'});
            $('html, body').css({'overflow': 'auto'}); //scroll hidden 해제
            });//---modal---
            
    	//숙소메뉴버튼
        $(document).ready(function(){
            $(".btn_room").click(function(){	   	
                $(".review, .detail_info").css("display", "none");      
                $(".room_contents").css("display", "block");
                $(".btn_room").css({"border-bottom":"3px solid rgb(86, 19, 241)", "color":"rgb(86, 19, 241)","font-weight":"bold"});
                $(".btn_info, .btn_review").css({"border":"none", "color":"rgba(0, 0, 0, 0.626)","font-weight":"normal"});
            });
            $(".btn_info").click(function(){
                $(".room_contents, .review").css("display", "none");
                $(".detail_info").css("display", "block");     
                $(".btn_info").css({"border-bottom":"3px solid rgb(86, 19, 241)", "color":"rgb(86, 19, 241)","font-weight":"bold"});           
                $(".btn_room, .btn_review").css({"border":"none", "color":"rgba(0, 0, 0, 0.626)","font-weight":"normal"});         
            });
            $(".btn_review").click(function(){
            	          	
                $(".room_contents, .detail_info").css("display", "none");
                $(".review").css("display", "block");                
                $(".btn_review").css({"border-bottom":"3px solid rgb(86, 19, 241)", "color":"rgb(86, 19, 241)","font-weight":"bold"});
                $(".btn_room, .btn_info").css({"border":"none", "color":"rgba(0, 0, 0, 0.626)","font-weight":"normal"});
                
            });
            
            //다시 접속했을때 page에 번호가 있으면 css를 새롭게 보여준다 (a링크 누르는 순간 다시 접속되는 것)
            let query = window.location.search; //주소를 얻고
            let param = new URLSearchParams(query); //url에서파라미터를 찾아
            let area = param.get('page'); //특정 파라미터만 구한다
            
            if(area >=1){
            $(".room_contents, .detail_info").css("display", "none");
            $(".review").css("display", "block");                
            $(".btn_review").css({"border-bottom":"3px solid rgb(86, 19, 241)", "color":"rgb(86, 19, 241)","font-weight":"bold"});
            $(".btn_room, .btn_info").css({"border":"none", "color":"rgba(0, 0, 0, 0.626)","font-weight":"normal"});
            
            }

        });
        //캘린더
		$(function(){
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
    <%@ include file="/WEB-INF/common/Header.jsp" %>
                <!-- end header-->

    <main>
        <section class="lodging_view">
            <div class="lodging_slider box1">
                <!-- Swiper -->
                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper2">
                    <div class="swiper-wrapper">                        
                    <%	//배열 선언해서 배열값 for문으로 가져오기
                    String[] strArray = total_img.split(",");                    	
                    for(int i=0; i<strArray.length; i++){
                    	//out.println(strArray[i]);
                    %>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodging_images/<%=strArray[i] %>" alt="숙소 이미지">
                        </div>
                    <%} %>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                    <%		                                     	
	                    for(int i=0; i<strArray.length; i++){                    	
                    %>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodging_images/<%=strArray[i] %>" alt="숙소 이미지">
                        </div>
                    <%} %>
                    </div>
                </div>
                <!-- Swiper JS -->
                <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

                 <!-- Initialize Swiper -->
                <script>
                    var swiper = new Swiper(".box1 .mySwiper", {
                        loop: true,
                        spaceBetween: 10,
                        slidesPerView: 4,  
                        freeMode: true,
                        watchSlidesProgress: true,
                    });
                    var swiper2 = new Swiper(".box1 .mySwiper2", {
                        loop: true,
                        spaceBetween: 10,
                        navigation: {
                        nextEl: ".box1 .swiper-button-next",
                        prevEl: ".box1 .swiper-button-prev",
                        },
                        thumbs: {
                        swiper: swiper,
                        },
                    });
                </script>
            </div><!--//lodging_slider-->
            <div class="right">
                <div class="lodging_info">
                    <h2><%=map.get("lodgingname") %></h2>
                    <p class="lodging_address"><%=map.get("lodgingaddr") %></p>
                </div><!--//lodging_info-->
                <div class="lodging_intro">
                    <h4>숙소 소개</h4>
                    <p><%=map.get("intro") %></p>
                </div>
            </div><!--//right-->
        </section><!--//lodging_view-->
        <div class="lodging_lnb">
            <button class="lodging_btn btn_room">객실선택/예약</button>
            <button class="lodging_btn btn_info">숙소안내</button>
            <button class="lodging_btn btn_review">리뷰</button>
        </div><!--//lodging_lnb-->

        <article class="room_contents">
        	<form name="frm" action="lodgingView.do" method="get">
	            <div class="btn_datePsn">
                   	<input type="hidden" name="lidx" value="<%=map.get("lidx")%>">
	                <div class="date_btn">
		                <div>
		                    <div class="date_view">
		                        <input type="text" name="fromDate" id="fromDate" value="${fromDate}">
								<input type="text" name="toDate" id="toDate" value="${toDate}">
		                    </div>
		                </div>
	                </div>
	                <div class="psn_btn">
	                    <span class="psn_view">
	                        <button type='button' onclick='count("minus")' value='-' class="updown">-</button>
							<input id="result" name="men" value="<c:if test='${men == null || men == 0}'>2</c:if><c:if test='${men != null}'>${men}</c:if>" readonly />
							<button type='button' onclick='count("plus")' value='+' class="updown">+</button>
	                    </span>
	                </div>
                    <button>적용</button>
	            </div><!--//btn_datePsn-->

	            <div class="room_list">            
	                <c:forEach var="vo2" items="${list}" varStatus="status">
		                <div class="room">
		                    <div class="room_slider box2">
		                        <!-- Swiper -->
		                        <div class="swiper mySwiper">
	                        		<div class="swiper-wrapper">
		                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodging_images/${vo2.rimage1}" alt="객실 이미지"></div>
		                                <c:if test="${vo2.rimage2 != null}">
		                                	<div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodging_images/${vo2.rimage2}" alt="객실 이미지"></div>
		                                </c:if>
		                                <c:if test="${vo2.rimage3 != null}">
			                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodging_images/${vo2.rimage3}" alt="객실 이미지"></div>
			                            </c:if>
			                            <c:if test="${vo2.rimage4 != null}">
			                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodging_images/${vo2.rimage4}" alt="객실 이미지"></div>
			                            </c:if>
			                            <c:if test="${vo2.rimage5 != null}">
			                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodging_images/${vo2.rimage5}" alt="객실 이미지"></div>                        
		                            	</c:if>
		                            </div>
		                            <div class="swiper-button-next"></div>
		                            <div class="swiper-button-prev"></div>
		                            <div class="swiper-pagination"></div>
		                        </div>
		                    
		                        <!-- Swiper JS -->
		                        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
		                    
		                        <!-- Initialize Swiper -->
		                        <script>
		                            var swiper = new Swiper(".box2 .mySwiper", {
		                            pagination: {
		                                el: ".swiper-pagination",
		                                type: "fraction",
		                            },
		                            navigation: {
		                                nextEl: ".box2 .swiper-button-next",
		                                prevEl: ".box2 .swiper-button-prev",
		                            },
		                            });
		                        </script>
		                    </div><!--//room_slider-->
		                    <div class="room_name">${vo2.rtype}</div>
		                    <div class="room_price">
		                        <p>가격</p>
		                        <div> 
		                            <p class="room_amount"><c:if test="${vo2.spareroom < 6}">남은 객실${vo2.spareroom}개</c:if></p>
		                            <p><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo2.rprice}" />원</p>
		                        </div>
		                    </div><!--//room_price-->
		                    <div class="modal">
		                        <div class="modal_body">
		                            <h3>객실 이용 안내</h3>
		                            <div class="modal_close"><i class="xi-close"></i></div>
		                            <div class="modal_info">
		                                <div>
		                                    <h4>기본정보</h4>
		                                        <ul>
		                                            <li>${vo2.stdmen}인 기준 최대 ${vo2.maxmen}인</li>
		                                            <c:if test="${vo2.bed eq 'single_bed'}">
		                                            	<li>싱글베드 1개</li>
		                                            </c:if>
		                                            <c:if test="${vo2.bed eq 'double_bed'}">
		                                            	<li>더블베드 1개</li>
		                                            </c:if>
		                                            <c:if test="${vo2.bed eq 'twin_bed'}">
		                                            	<li>싱글베드 2개</li>
		                                            </c:if>
		                                            <c:if test="${vo2.bed eq 'ondol_bed'}">
		                                            	<li>온돌방</li>
		                                            </c:if>
		                                        </ul>                
		                                </div>  
		                                <div>      
		                                    <h4>편의시설</h4>
		                                        <ul>
		                                            <li>
		                                            	<c:if test="${vo2.tv == 'Y'}">TV</c:if>
		                                            	<c:if test="${vo2.refri == 'Y'}">, 냉장고</c:if>
		                                            	<c:if test="${vo2.aircon == 'Y'}">, 에어컨</c:if>
		                                            	<c:if test="${vo2.wifi == 'Y'}">, wifi</c:if>
		                                            	<c:if test="${vo2.shower == 'Y'}">, 객실샤워실</c:if>
		                                            	<c:if test="${vo2.bathitem == 'Y'}">, 욕실용품</c:if>
		                                            	<c:if test="${vo2.bath == 'Y'}">, 욕조</c:if>
		                                            	<c:if test="${vo2.dryer == 'Y'}">, 드라이기</c:if>
		                                            	<c:if test="${vo2.roomspa == 'Y'}">, 객실스파</c:if>
		                                            	<c:if test="${vo2.iron == 'Y'}">, 다리미</c:if>
		                                            	<c:if test="${vo2.minibar == 'Y'}">, 미니바</c:if>
		                                            	<c:if test="${vo2.ricecooker == 'Y'}">, 전기밥솥</c:if>
		                                            </li>
		                                        </ul>
		                                </div>      
		                                <div>
		                                    <h4>추가정보</h4>
		                                        <ul>
		                                            <li>${vo2.addinfo1}</li>
		                                            <li>${vo2.addinfo2}</li>
		                                            <li>${vo2.addinfo3}</li>
		                                            <li>${vo2.addinfo4}</li>
		                                            <li>${vo2.addinfo5}</li>
		                                        </ul>                
		                                </div>    
		                            </div>
		                        </div>
		                    </div><!--//modal-->
		                    <button type="button" class="room_info">객실 이용 안내</button>
		                    <c:if test="${vo2.spareroom != 0 }">
			                    <a href="<%=request.getContextPath()%>/reserv/reserv.do?ridx=${vo2.ridx}&fromDate=${fromDate}&toDate=${toDate}&men=${men}" >
			                    	<button type="button" class="room_booking">예약</button>
		                    	</a>
		                    </c:if>
		                    <c:if test="${vo2.spareroom == 0 }">
		                    	<button type="button" class="none_booking">판매완료</button>
		                    </c:if>
		                </div><!--//room-->
	                </c:forEach>
	            </div><!--//room_list-->
            </form>
        </article><!--//room_contents-->
   
        <article class="detail_info">
            <button type="button" id="basic_info_tab" class="category">
                <h3>기본 정보</h3>
            </button>
            <section class="basic_info info_detail">
                <h4>주변 정보</h4>
                    <ul>
                        <li>${map.area1}</li>
                        <li>${map.area2}</li>
                        <li>${map.area3}</li>
                        <li>${map.area4}</li>
                        <li>${map.area5}</li>
                    </ul>
                <h4>기본 정보</h4>
                    <ul>
                        <li>${map.basic1}</li>
                        <li>${map.basic2}</li>
                        <li>${map.basic3}</li>
                        <li>${map.basic4}</li>
                        <li>${map.basic5}</li>
                    </ul>
                <h4>취소 및 환불 규정</h4>
                    <ul>
                        <li>체크인일 기준 1일 전 18시까지 : 100% 환불</li>
                        <li>체크인일 기준 1일 전 18시 이후~당일 및 No-show : 환불불가</li>
                        <li>취소,환불 시 수수료가 발생할 수 있습니다</li>
                    </ul>
                <h4>확인 사항 및 기타</h4>
                    <ul>
                        <li>${map.odd1}</li>
                        <li>${map.odd2}</li>
                        <li>${map.odd3}</li>
                        <li>${map.odd4}</li>
                        <li>${map.odd5}</li>
                    </ul>
            </section>
            <button type="button" id="service_info_tab" class="category">
                <h3>시설 및 서비스</h3>
            </button>
            <section class="service_info info_detail">
                <ul>
                    <c:if test="${map.fitness == 'Y'}"><li>피트니스</li></c:if>                    
                    <c:if test="${map.sauna == 'Y'}"><li>사우나</li></c:if> 
                    <c:if test="${map.restaurant == 'Y'}"><li>레스토랑</li></c:if> 
                    <c:if test="${map.lounge == 'Y'}"><li>라운지</li></c:if> 
                    <c:if test="${map.bbq == 'Y'}"><li>BBQ</li></c:if> 
                    <c:if test="${map.publicspa == 'Y'}"><li>공용스파</li></c:if> 
                    <c:if test="${map.seminar == 'Y'}"><li>세미나실</li></c:if> 
                    <c:if test="${map.singing == 'Y'}"><li>노래방</li></c:if> 
                    <c:if test="${map.washingmachine == 'Y'}"><li>세탁기</li></c:if> 
                    <c:if test="${map.dehydrator == 'Y'}"><li>탈수기</li></c:if> 
                    <c:if test="${map.cooking == 'Y'}"><li>취사가능</li></c:if> 
                    <c:if test="${map.spa == 'Y'}"><li>온천</li></c:if> 
                    <c:if test="${map.poll == 'Y'}"><li>수영장</li></c:if> 
                    <c:if test="${map.golf == 'Y'}"><li>골프장</li></c:if> 
                    <c:if test="${map.elevator == 'Y'}"><li>엘레베이터</li></c:if> 
                    <c:if test="${map.pc == 'Y'}"><li>공용PC</li></c:if> 
                    <c:if test="${map.cafe == 'Y'}"><li>카페</li></c:if> 
                    <c:if test="${map.footvolleyball == 'Y'}"><li>족구장</li></c:if> 
                    <c:if test="${map.store == 'Y'}"><li>편의점</li></c:if> 
                    <c:if test="${map.dining == 'Y'}"><li>주방/식당</li></c:if> 
                    <c:if test="${map.dryer == 'Y'}"><li>건조기</li></c:if> 
                    <c:if test="${map.parking == 'Y'}"><li>주차장</li></c:if> 
                    <c:if test="${map.publicshower == 'Y'}"><li>공용샤워실</li></c:if> 
                    <c:if test="${map.ski == 'Y'}"><li>스키장</li></c:if> 
                    <c:if test="${map.pickup == 'Y'}"><li>픽업가능</li></c:if> 
                    <c:if test="${map.printer == 'Y'}"><li>프린터사용</li></c:if> 
                    <c:if test="${map.locker == 'Y'}"><li>개인사물함</li></c:if> 
                    <c:if test="${map.breakfast == 'Y'}"><li>조식포함</li></c:if> 
                    <c:if test="${map.valetparking == 'Y'}"><li>발렛파킹</li></c:if> 
                    <c:if test="${map.dog == 'Y'}"><li>반려견동반</li></c:if> 
                    <c:if test="${map.inroomcooking == 'Y'}"><li>객실내취사</li></c:if> 
                    <c:if test="${map.keepluggage == 'Y'}"><li>짐보관가능</li></c:if> 
                    <c:if test="${map.freeparking == 'Y'}"><li>무료주차</li></c:if> 
                    <c:if test="${map.inroomsmoking == 'Y'}"><li>객실내흡연</li></c:if> 
                    <c:if test="${map.nosmoking == 'Y'}"><li>금연</li></c:if> 
                    <c:if test="${map.creditcard == 'Y'}"><li>카드결제</li></c:if> 
                </ul>
            </section>
        </article>

        <article class="review">
            <div class="review_grade">
                <h3>리뷰 (${rvvo.countrv})</h3>
                <div class="star_grade">
					만족도
                    <p><strong>${rvvo.avgrv}</strong> /10.0</p>
                </div>
            </div><!--//review_grade-->
            <ul>
            <c:forEach var="vo3" items="${list2}" varStatus="status">
                <li>
                    <div class="guest">
                        <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/ico_21.png">
                        <strong>${vo3.rvTitle}</strong>
                        <div class="review_star"><p>만족도 ${vo3.rvSatisfaction} /10.0</p></div>
                        <div class="review_txt">${vo3.rvContent}</div>
                        <div class="review_date">${vo3.rvDate}</div>
                    </div><!--//guest-->
                </li>
			</c:forEach>                
            </ul>
            <div id="pagination">
                <div class="paging">
					<c:if test="${pageMaker.prev}">
						<span><a href="<%=request.getContextPath() %>/lodging/lodgingView.do${pageMaker.makeQuery2(pageMaker.startPage - 1)}&lidx=${map.lidx}&fromDate=${fromDate}&toDate=${toDate}&men=${men}">이전</a></span>
					</c:if>   
					    
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<span>
							<c:if test="${select != idx}">
								<a href="<%=request.getContextPath() %>/lodging/lodgingView.do${pageMaker.makeQuery2(idx)}&lidx=${map.lidx}&fromDate=${fromDate}&toDate=${toDate}&men=${men}">${idx}</a>
							</c:if>
							<c:if test="${select == idx}">
								<b>${idx}</b>
							</c:if>
						</span>
					</c:forEach>
					      
					<c:if test="${pageMaker.next}">
						<span><a href="<%=request.getContextPath() %>/lodging/lodgingView.do${pageMaker.makeQuery2(pageMaker.endPage + 1)}&lidx=${map.lidx}&fromDate=${fromDate}&toDate=${toDate}&men=${men}">다음</a></span>
					</c:if>
                </div>
            </div>
        </article><!--//review>-->
    </main><!--//main-->
    
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