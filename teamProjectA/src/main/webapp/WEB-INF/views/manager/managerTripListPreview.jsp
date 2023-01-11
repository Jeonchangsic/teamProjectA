<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>저긴어때</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerTripListPreview.css">
	<!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<!--스와이퍼-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/> 
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
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
    </script>
	</head>
	<body>
        <section class="slide_list">                                                    
            <div id="festival_content" class="swiper mySwiper">  
                <div class="swiper-wrapper">
                   	<c:forEach items="${tripList}" var="tripList" varStatus="cnt">
                   		<c:if test="${cnt.count % 3 == 1}">
	                    	<div class="swiper-slide">
		                   	<ul>
                   		</c:if> 
	                        <li>
	                           <div class="description">
		                           <a>
		                                <img src="<%=request.getContextPath() %>/resources/images/index_images/${tripList.tImgName}" alt="축제이미지">
	                                    <p id="hover1" class="festival_name">
	                                    	<span>[${tripList.tAddr}]</span>
	                                    ${tripList.tName}
	                                    </p>
	                                    <p class="festival_text">"${tripList.tSubContent}"</p>
		                            </a>
                                </div>
	                        </li>
                        <c:if test="${cnt.count % 3 == 0}">
	                    	</ul>
	                    	</div>
                    	</c:if>
                    </c:forEach>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
	</body>
</html>