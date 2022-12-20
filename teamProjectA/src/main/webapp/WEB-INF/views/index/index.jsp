<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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

</head>
<body>
   	<%@ include file="/WEB-INF/common/Header.jsp" %>
                <!-- end header-->
    <main>
        <nav id="gnb">
            <ul>
                <li><a href="<%=request.getContextPath() %>/lodging/lodgingList_motel.do"><i class="xi-building "></i><p>모텔</p></a></li>               
                <li><a href="<%=request.getContextPath() %>/lodging/lodgingList_hotel.do"><i class="xi-city "></i><p>호텔</p></a></li>        
                <li><a href="<%=request.getContextPath() %>/lodging/lodgingList_villa.do"><i class="xi-beach  "></i><p>펜션/풀빌라</p></a></li>             
                <li><a href="<%=request.getContextPath() %>/lodging/lodgingList_gh.do"><i class="xi-home-o"></i><p>게스트하우스</p></a></li>        
                <li><a href="#"><i class="xi-maker-drop "></i><p>내주변</p></a></li>              
            </ul>
        </nav>
        <section id="main_img">
            <img src="<%=request.getContextPath() %>/resources/images/index_images/Main_img.png">
        </section>

        <div class="white"></div>

        <section id="slide_list">                                           
            <h4>숙소추천</h4>
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <ul>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_1.jpg" alt="숙소이미지">
                                    <div>
                                        <p class="lod_name">[슈퍼얼리버드] 앙드레 브라질리에</p>
                                       	<p class="lod_price">객실명</p>
                                        <p class="promotion">가격</p>
                                    </div>
                                </a>
                            </li>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_2.jpg" alt="숙소이미지">
                                    <div>
                                        <p class="lod_name">[슈퍼얼리버드] 앙드레 브라질리에</p>
                                       	<p class="lod_price">객실명</p>
                                        <p class="promotion">가격</p>
                                    </div>
                                </a>
                            </li>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_3.jpg" alt="숙소이미지">
                                    <div>
                                        <p class="lod_name">[슈퍼얼리버드] 앙드레 브라질리에</p>
                                       	<p class="lod_price">객실명</p>
                                        <p class="promotion">가격</p>
                                    </div>
                                </a>
                            </li>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_4.jpg" alt="숙소이미지">
                                    <div>
                                        <p class="lod_name">[슈퍼얼리버드] 앙드레 브라질리에</p>
                                       	<p class="lod_price">객실명</p>
                                        <p class="promotion">가격</p>
                                    </div>
                                </a>
                            </li>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_5.jpg" alt="숙소이미지">
                                    <div>
                                        <p class="lod_name">[슈퍼얼리버드] 앙드레 브라질리에</p>
                                       	<p class="lod_price">객실명</p>
                                        <p class="promotion">가격</p>
                                    </div>
                                </a>
                            </li>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_6.jpg" alt="숙소이미지">
                                    <div>
                                        <p class="lod_name">[슈퍼얼리버드] 앙드레 브라질리에</p>
                                       	<p class="lod_price">객실명</p>
                                        <p class="promotion">가격</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                  	 </div>
	                 <div class="swiper-slide">
	                   <ul>
	                       <li class="border">
	                           <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
	                               <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_1.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
	                           </a>
	                       </li>
	                       <li >
	                           <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
	                               <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_2.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
	                           </a>
	                       </li>
	                       <li class="border">
	                           <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
	                               <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_3.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
	                           </a>
	                       </li>
	                       <li >
	                           <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
	                               <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_4.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
	                           </a>
	                       </li>
	                       <li class="border">
	                           <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
	                               <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_5.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
	                           </a>
	                       </li>
	                       <li >
	                           <a href="<%=request.getContextPath() %>/lodging/lodgingView.do"><img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_6.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
	                           </a>
	                       </li>
	                   </ul>
                     </div>

                     <div class="swiper-slide">
                        <ul>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_1.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_2.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
                                </a>
                            </li>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_3.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_4.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
                                </a>
                            </li>
                            <li class="border">
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do"><img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_5.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do"><img src="<%=request.getContextPath() %>/resources/images/index_images/lodging_6.jpg" alt="숙소이미지"><p class="lod_name">숙소이름</p><p class="lod_price">숙소가격</p>
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
                                    <p id="hover1" class="lod_name">[진주]남강유등축제</p>
                                    <p class="lod_price">"역사가 담긴 빛축제"</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath() %>/festival/YeosuFireworks.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival2.jpg" alt="축제이미지">
                                <div class="description">
	                                <p class="lod_name">[여수]밤바다불꽃축제</p>
	                                <p class="lod_price">"밤바다 야경과 불꽃축제의 조화"</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath() %>/festival/Chunhyang.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival3.jpg" alt="축제이미지">
                                <div class="description">
	                                <p class="lod_name">[남원]춘향제</p>
	                                <p class="lod_price">"역사를 자랑하는 전통축제"</p>
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
                                    <p class="lod_name">[남원]춘향제</p>
                                    <p class="lod_price">"역사를 자랑하는 전통축제"</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath() %>/festival/YeosuFireworks.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival2.jpg" alt="축제이미지">
                                <div class="description">
	                                <p class="lod_name">[여수]밤바다불꽃축제</p>
	                                <p class="lod_price">"밤바다 야경과 불꽃축제의 조화"</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath() %>/festival/NamgangYudeung.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/festival1.jpg" alt="축제이미지">
                                <div class="description">
	                                <p class="lod_name">[진주]남강유등축제</p>
	                                <p class="lod_price">"역사가 담긴 빛축제"</p>
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
	                                <p class="lod_name">[청주]자연휴양림</p>
	                                <p class="lod_price">"캠핑과 휴양을 동시에!"</p>
	                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/trip/HanokVillage.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip2.jpg" alt="즐길거리 이미지">
                                <div class="description">
	                                <p class="lod_name">[전주]한옥마을</p>
	                                <p class="lod_price">"전주 여행에 빠질 수 없는 코스"</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/trip/DeokjinPark.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip3.jpg" alt="즐길거리 이미지">
                                <div class="description">
	                                <p class="lod_name">[전주]덕진공원</p>
	                                <p class="lod_price">"수많은 연꽃을 보고싶을때"</p>
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
	                                <p class="lod_name">[전주]덕진공원</p>
	                                <p class="lod_price">"수많은 연꽃을 보고싶을때"</p>
	                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/trip/Nature.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip1.jpg" alt="즐길거리 이미지">
                                <div class="description">
	                                <p class="lod_name">[청주]자연휴양림</p>
	                                <p class="lod_price">"캠핑과 휴양을 동시에!"</p>
	                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/trip/HanokVillage.do">
                                <img src="<%=request.getContextPath() %>/resources/images/index_images/trip2.jpg"alt="즐길거리 이미지">
                                <div class="description">
	                                <p class="lod_name">[전주]한옥마을</p>
	                                <p class="lod_price">"전주 여행에 빠질 수 없는 코스"</p>
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