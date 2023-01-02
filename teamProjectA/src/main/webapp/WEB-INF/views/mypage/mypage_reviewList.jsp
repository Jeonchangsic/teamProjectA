<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage_reviewList.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     <!-- 리뷰 상세페이지 팝업창 -->
     <script>
     function reviewInfoPop(rvidx,limagename){
    	var url = "<%=request.getContextPath()%>/mypage/reviewInfo.do?rvidx="+rvidx+"&limagename="+limagename;   //팝업창 페이지 URL
 		var winWidth = 550;
 	    var winHeight = 470;
 	  	var popupX = (window.screen.width / 2) - (550 / 2);
 	  	var popupY= (window.screen.height / 2) - (470 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     
</head>
<body>
    <header>
        <div class="inner">
            <h1>
            	<a href="<%=request.getContextPath()%>/index/index.do">
            		<img src="<%=request.getContextPath() %>/resources/images/index_images/logo.svg" alt="저긴어때">
            	</a>
            </h1>
        </div>
    </header>
                <!--end header-->
	<div id="whiteArea">
	    <main>
	       	<h2 id="mypageArea">마이페이지</h2>
	        <div id="nav">
	            <a id="change1" onclick="location.href='<%=request.getContextPath()%>/mypage/info.do'">
	            	<div id="memberInfo">회원정보수정</div>
	            </a>
	            <a id="change2" onclick="location.href='<%=request.getContextPath()%>/mypage/reservList.do'">
	            	<div id="conform">예약내역확인</div>
	            </a>
	            <a id="change3" onclick="location.href='<%=request.getContextPath()%>/mypage/reviewList.do'">
	            	<div id="reviewList">리뷰내역</div>
	            </a>
	        </div>
	        <div id="contentsArea2">
	        	 <table class="table10">
	                    <tr class="tr_center tr_border">
	                   		
	                        <th colspan="2" class="lodging_Style">숙소명</th>
	                        <th class="lodging_Style">객실명</th>
	                        <th class="review_style">리뷰제목</th>
	                        <th>리뷰작성일</th>
	                    </tr>
	                    <c:forEach items="${reviewList}" var="reviewList">
			                    <tr>
			              		    <td class="td_padding lodging_Style1"><img src="<%=request.getContextPath()%>/resources/images/lodging_images/${reviewList.limagename}"/></td>
			                    	<td class="td_padding lodging_Style">${reviewList.lodgingname}</td>
			                    	<td class="td_padding lodging_Style">${reviewList.rtype}</td>
			                    	<td class="td_padding review_style" id="titleHover" ><a class="cursorStyle" onclick="reviewInfoPop(${reviewList.rvidx},'${reviewList.limagename}')">${reviewList.rvTitle}</a></td>
			                    	<td class="td_padding">${reviewList.rvDate}</td>
			                    </tr>
		               	</c:forEach>
	             </table>
	             <div>
		             <div id="btnArea3">
		                    <ul>
		                    	<c:if test="${pageMaker2.prev2}">
		                    		<li class="float"><a class="a_margin" href="<%=request.getContextPath()%>/mypage/reviewList.do?page2=${pageMaker2.startPage2 - 1}">이전</a></li>
		                    	</c:if>
		                    	<c:forEach begin="${pageMaker2.startPage2}" end="${pageMaker2.endPage2}" var="idx2">
		                    		<li class="float"><a class="a_margin" href="<%=request.getContextPath()%>/mypage/reviewList.do?page2=${idx2}">${idx2}</a></li>
		                    	</c:forEach>
		                    	
		                    	<c:if test="${pageMaker2.next2 && pageMaker2.endPage2 > 0}">
		                    		<li class="float"><a class="a_margin" href="<%=request.getContextPath()%>/mypage/reviewList.do?page2=${pageMaker2.endPage2 +1}">다음</a></li>
		                    	</c:if>
		                    </ul>
		             </div>
	             </div>
	        </div>
	    </main>
	</div>
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