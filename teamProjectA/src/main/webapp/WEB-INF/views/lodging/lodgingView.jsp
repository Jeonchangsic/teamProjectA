<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소상세페이지</title>
    
	<link href="<%= request.getContextPath() %>/resources/images/lodgingView_images/favicon.jpg" rel="shortcut icon">

    <link href="<%= request.getContextPath() %>/resources/css/lodging_css/lodgingView_reset.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/css/lodging_css/lodgingView_style.css" rel="stylesheet"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!--XE아이콘-->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/css/jquery-3.6.1.min.js"></script>
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
        $(document).on('click', '.room_info', function(e){            
            $('.modal').css({'display':'block'});
            $('html, body').css({'overflow': 'hidden'}); //모달팝업 중 html,body의 scroll을 hidden시킴
            });
        
        $(document).on('click', '.modal_close', function(e){            
            $('.modal').css({'display':'none'});
            $('html, body').css({'overflow': 'auto'}); //scroll hidden 해제
            });//---modal---
            
    	//숙소버튼
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
        })
    </script>
</head>
<body>
    <header>
        <div class="inner">
            <h1><a href="#"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/logo.svg" alt="저긴어때"></a></h1>
            <ul>
                <li>
                    <input type="search" class="search_bar">
                    <a href="#" class="search_btn"><i class="xi-search xi-1x search"></i></a>
                </li><!-- **검색창 구현**-->
                <li><a href="#" id="login">로그인</a></li><!-- 폰트 스타일 수정-->
            </ul>
        </div><!--//inner-->
    </header><!--//header-->

    <main>
        <section class="lodging_view">
            <div class="lodging_slider box1">
                <!-- Swiper -->
                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper2">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
                        <div class="swiper-slide">
                            <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="숙소 이미지">
                        </div>
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
                    <h2>슈퍼 울트라 그레잇 호텔</h2>
                    <p class="lodging_address">전라북도 전주시 완산구</p>
                </div><!--//lodging_info-->
                <div class="lodging_intro">
                    <h4>숙소 소개</h4>
                    <p>우리 숙소가 짱
                    	<br>
                       	 진짜임
                        <br>
						그러니까 다들 우리 숙소에 오기를 바라고 바라고 바라고 바라고 바라고 바라고
                 	   	바라고 바라 마지않지 않지 않지 않아
                    </p>
                </div>
            </div><!--//right-->
        </section><!--//lodging_view-->
        <div class="lodging_lnb">
            <button class="lodging_btn btn_room">객실선택/예약</button>
            <button class="lodging_btn btn_info">숙소안내</button>
            <button class="lodging_btn btn_review">리뷰</button>
        </div><!--//lodging_lnb-->

        <article class="room_contents">
            <div class="btn_datePsn">
                <div class="date_btn">
                    <span class="date_view">
                        <span>10.25 ~ 10.26</span>
                        <span>&nbsp;·&nbsp;1박</span>
                    </span>
                </div>
                <div class="psn_btn">
                    <span class="psn_view">
                        <span>성인 2</span>
                    </span>
                </div>
            </div><!--//btn_datePsn-->

            <div class="room_list">
                <div class="room">
                    <div class="room_slider box2">
                        <!-- Swiper -->
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
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
                    <div class="room_name">객실 이름</div>
                    <div class="room_price">
                        <p>가격</p>
                        <div> 
                            <p class="room_amount">남은 객실 수</p>
                            <p>199,000</p>
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
                                            <li>2인 기준 최대 2인</li>
                                            <li>더블 베드 1개</li>
                                        </ul>                
                                </div>  
                                <div>      
                                    <h4>편의시설</h4>
                                        <ul>
                                            <li>침대, TV, 냉장고, 에어컨, 테이블, 의자, 목욕가운, 욕실용품, 슬리퍼</li>
                                        </ul>
                                </div>      
                                <div>
                                    <h4>추가정보</h4>
                                        <ul>
                                            <li>퇴실시간</li>
                                        </ul>                
                                </div>    
                            </div>
                        </div>
                    </div><!--//modal-->
                    <button type="button" class="room_info">객실 이용 안내</button>
                    <button type="button" onclick="location" class="room_booking">예약</button>
                </div><!--//room1-->
                <div class="room">
                    <div class="room_slider box2">
                        <!-- Swiper -->
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>                        
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
                    <div class="room_name">객실 이름</div>
                    <div class="room_price">
                        <p>가격</p>
                        <div> 
                            <p class="room_amount">남은 객실 수</p>
                            <p>199,000</p>
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
                                            <li>2인 기준 최대 2인</li>
                                            <li>더블 베드 1개</li>
                                        </ul>                
                                </div>  
                                <div>      
                                    <h4>편의시설</h4>
                                        <ul>
                                            <li>침대, TV, 냉장고, 에어컨, 테이블, 의자, 목욕가운, 욕실용품, 슬리퍼</li>
                                        </ul>
                                </div>      
                                <div>
                                    <h4>추가정보</h4>
                                        <ul>
                                            <li>퇴실시간</li>
                                        </ul>                
                                </div>    
                            </div>
                        </div>
                    </div><!--//modal-->
                    <button type="button" class="room_info">객실 이용 안내</button>
                    <button type="button" onclick="" class="room_booking">예약</button>
                </div><!--//room2-->
                <div class="room">
                    <div class="room_slider box2">
                        <!-- Swiper -->
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>                        
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
                    <div class="room_name">객실 이름</div>
                    <div class="room_price">
                        <p>가격</p>
                        <div> 
                            <p class="room_amount">남은 객실 수</p>
                            <p>199,000</p>
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
                                            <li>2인 기준 최대 2인</li>
                                            <li>더블 베드 1개</li>
                                        </ul>                
                                </div>  
                                <div>      
                                    <h4>편의시설</h4>
                                        <ul>
                                            <li>침대, TV, 냉장고, 에어컨, 테이블, 의자, 목욕가운, 욕실용품, 슬리퍼</li>
                                        </ul>
                                </div>      
                                <div>
                                    <h4>추가정보</h4>
                                        <ul>
                                            <li>퇴실시간</li>
                                        </ul>                
                                </div>    
                            </div>
                        </div>
                    </div><!--//modal-->
                    <button type="button" class="room_info">객실 이용 안내</button>
                    <button type="button" onclick="" class="room_booking">예약</button>
                </div><!--//room3-->
                <div class="room">
                    <div class="room_slider box2">
                        <!-- Swiper -->
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>
                                <div class="swiper-slide"><img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/lodging_image.jpg" alt="객실 이미지"></div>                        
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
                    <div class="room_name">객실 이름</div>
                    <div class="room_price">
                        <p>가격</p>
                        <div> 
                            <p class="room_amount">남은 객실 수</p>
                            <p>199,000</p>
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
                                            <li>2인 기준 최대 2인</li>
                                            <li>더블 베드 1개</li>
                                        </ul>                
                                </div>  
                                <div>      
                                    <h4>편의시설</h4>
                                        <ul>
                                            <li>침대, TV, 냉장고, 에어컨, 테이블, 의자, 목욕가운, 욕실용품, 슬리퍼</li>
                                        </ul>
                                </div>      
                                <div>
                                    <h4>추가정보</h4>
                                        <ul>
                                            <li>퇴실시간</li>
                                        </ul>                
                                </div>    
                            </div>
                        </div>
                    </div><!--//modal-->
                    <button type="button" class="room_info">객실 이용 안내</button>
                    <button type="button" onclick="" class="room_booking">예약</button>
                </div><!--//room4-->
            </div><!--//room_list-->
        </article><!--//room_contents-->
   
        <article class="detail_info">
            <button type="button" id="basic_info_tab" class="category">
                <h3>기본 정보</h3>
            </button>
            <section class="basic_info info_detail">
                <h4>주변 정보</h4>
                    <ul>
                        <li>주변</li>
                        <li>정보</li>
                        <li>입니다</li>
                    </ul>
                <h4>기본 정보</h4>
                    <ul>
                        <li>기본</li>
                        <li>정보</li>
                        <li>입니다</li>
                    </ul>
                <h4>취소 및 환불 규정</h4>
                    <ul>
                        <li>취소</li>
                        <li>환불</li>
                        <li>규정</li>
                    </ul>
                <h4>확인 사항 및 기타</h4>
                    <ul>
                        <li>확인</li>
                        <li>사항</li>
                        <li>기타</li>
                    </ul>
            </section>
            <button type="button" id="service_info_tab" class="category">
                <h3>시설 및 서비스</h3>
            </button>
            <section class="service_info info_detail">
                <ul>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                    <li>시설</li>
                </ul>
            </section>
        </article>

        <article class="review">
            <div class="review_grade">
                <h3>리뷰 (999)</h3>
                <div class="star_grade">
					만족도
                    <p><strong>9.9</strong> /10.0</p>
                </div>
            </div><!--//review_grade-->
            <ul>
                <li>
                    <div class="guest">
                        <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/ico_21.png">
                        <strong>이건 리뷰의 제목이랍니다.</strong>
                        <div class="review_star"><p>만족도 9.5 /10.0</p></div>
                        <div class="review_txt">리뷰 내용을 작성하고 있습니다.
                            <br>
                           	 숙소 정말 좋네요.
                        </div><!--//review_txt-->
                        <div class="review_date">2일전</div>
                    </div><!--//guest-->
                </li>
                <li>
                    <div class="guest">
                        <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/ico_21.png">
                        <strong>이건 리뷰의 제목이랍니다.</strong>
                        <div class="review_star"><p>만족도 9.5 /10.0</p></div>
                        <div class="review_txt">리뷰 내용을 작성하고 있습니다.
                            <br>
                         	 숙소 정말 좋네요.
                        </div><!--//review_txt-->
                        <div class="review_date">2일전</div>
                    </div><!--//guest-->
                </li>
                <li>
                    <div class="guest">
                        <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/ico_21.png">
                        <strong>이건 리뷰의 제목이랍니다.</strong>
                        <div class="review_star"><p>만족도 9.5 /10.0</p></div>
                        <div class="review_txt">리뷰 내용을 작성하고 있습니다.
                            <br>
                           	 숙소 정말 좋네요.
                        </div><!--//review_txt-->
                        <div class="review_date">2일전</div>
                    </div><!--//guest-->
                </li>
                <li>
                    <div class="guest">
                        <img src="<%= request.getContextPath() %>/resources/images/lodgingView_images/ico_21.png">
                        <strong>이건 리뷰의 제목이랍니다.</strong>
                        <div class="review_star"><p>만족도 9.5 /10.0</p></div>
                        <div class="review_txt">리뷰 내용을 작성하고 있습니다.
                            <br>
                           	 숙소 정말 좋네요.
                        </div><!--//review_txt-->
                        <div class="review_date">2일전</div>
                    </div><!--//guest-->
                </li>
            </ul>
            <div id="pagination">
                <div class="paging">
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button class="next">다음</button>
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