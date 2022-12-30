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
    
		$(function(){
			$(".btn-open-popup").click(function(){
	       		document.getElementById("modal").style.display="block";
	       		document.body.style.overflow = "hidden";
			});
			$(".odal_close_btn").click(function(){
	       		document.getElementById("modal").style.display="none";
	       		document.body.style.overflow = "auto";
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
                <li><button type="button" id="cursor_Style" class="btn-open-popup"><i class="xi-maker-drop"></i><p>내주변</p></button></li>              
            </ul>
        </nav>
        <section id="main_img">
            <img src="<%=request.getContextPath() %>/resources/images/index_images/Main_img.png">
        </section>
        <div id="modal">
     		<div class="modal_content">
     		<%@ include file="/WEB-INF/views/index/map.jsp"%>
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
                                <a href="<%=request.getContextPath() %>/lodging/lodgingView.do?lidx=${list.lidx}" class="lod">
                                    <img src="<%=request.getContextPath() %>/resources/images/index_images/${list.limagename}" alt="숙소이미지">
                                    <div class="text_left">
                                        <p class="lod_name">${list.lodgingname}</p>
                                       	<p class="lod_rtype">[${list.rtype}]</p>
                                       	<div>
	                                     	<c:choose>
					                            <c:when test="${list.avgrv == 5.0}">
			                                      	<p class="star">&#9733;&#9733;&#9733;&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:when test="${list.avgrv == 4.9 ||list.avgrv == 4.8||list.avgrv == 4.7||list.avgrv == 4.6||list.avgrv == 4.5||list.avgrv == 4.4||list.avgrv == 4.3||list.avgrv == 4.2||list.avgrv == 4.1||list.avgrv == 4.0}">
			                                      	<p class="star">&#9733;&#9733;&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:when test="${list.avgrv == 3.9 ||list.avgrv == 3.8||list.avgrv == 3.7||list.avgrv == 3.6||list.avgrv == 3.5||list.avgrv == 3.4||list.avgrv == 3.3||list.avgrv == 3.2||list.avgrv == 3.1||list.avgrv == 3.0}">
			                                      	<p class="star">&#9733;&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:when test="${list.avgrv == 2.9 ||list.avgrv == 2.8||list.avgrv == 2.7||list.avgrv == 2.6||list.avgrv == 2.5||list.avgrv == 2.4||list.avgrv == 2.3||list.avgrv == 2.2||list.avgrv == 2.1||list.avgrv == 2.0}">
			                                      	<p class="star">&#9733;&#9733;</p> 
					                        	</c:when>
					                        	<c:otherwise>
					                        		<p class="star">&#9733;</p> 
					                        	</c:otherwise>
			                        		</c:choose>               	
	                                    <p class="lod_satisfaction" >(${list.avgrv}점)</p>
                                       	</div>
                                       	<div class="lod_price">
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