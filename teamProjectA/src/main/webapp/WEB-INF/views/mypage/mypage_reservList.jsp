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
    <link href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage_reservList.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
   
     
     <!--예약취소 팝업창  -->
     <script>
     function refund_pop(ridx,uidx,limagename){
    	var url = "<%=request.getContextPath()%>/mypage/refundPop.do?ridx="+ridx+"&uidx="+uidx+"&limagename="+limagename;   //팝업창 페이지 URL
 		var winWidth = 500;
 	    var winHeight = 250;
 	   var popupX = (window.screen.width / 2) - (500 / 2);
	  	var popupY= (window.screen.height / 2) - (250 / 2);
	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     
     
     <!-- 리뷰 작성 팝업창 -->
     <script>
     function review(lidx,ridx,reserv_idx,lodgingname,rtype,reserv_startDate,reserv_endDate,limagename){
    	var url = "<%=request.getContextPath()%>/review/review.do?lidx="+lidx+"&ridx="+ridx+"&reserv_idx="+reserv_idx+"&lodgingname="+lodgingname+"&rtype="+rtype+"&reserv_startDate="+reserv_startDate+"&reserv_endDate="+reserv_endDate+"&limagename="+limagename;   //팝업창 페이지 URL
 		var winWidth = 550;
 	    var winHeight = 450;
 	  	var popupX = (window.screen.width / 2) - (550 / 2);
 	  	var popupY= (window.screen.height / 2) - (450 / 2);
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
	        <div id="contentsArea">
	                <table class="table10">
	                    <tr class="tr_center tr_border">
	                        <th>예약번호</th>
	                        <th colspan="2">숙소명</th>
	                        <th>객실명</th>
	                        <th>숙박일자</th>
	                        <th>금액</th>
	                        <th>비고</th>
	                    </tr>
	                    <c:forEach items="${list}" var="list">
		                    <tr>
		                        <td class="fontSize">${list.reserv_num}</td>
		                        <td><img src="<%=request.getContextPath()%>/resources/images/lodging_images/${list.limagename}"></td>
		                        <td class="fontSize">${list.lodgingname}</td>
		                        <td class="fontSize">${list.rtype}</td>
		                        <td class="date_size1">${list.reserv_startDate} ~ ${list.reserv_endDate}</td>
		                        <td class="fontSize">
		                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.rprice}" />원
		                        </td>
		                        	<fmt:formatDate value="${list.reserv_startDate2}" pattern="yyyyMMdd" var="startDate"/>
		                        	<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate"/>
		                        <td  class="button_Size">
		                        	<c:choose>
		                        		<c:when test="${startDate <= nowDate}">
		                        			<input class="reservListBtn cursorStyle input_none" type="button" value="취소불가능"/>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<input class="reservListBtn cursorStyle" onclick="refund_pop(${list.ridx},${list.uidx},'${list.limagename}')" type="button" value="예약취소"/>
		                            	</c:otherwise>
		                            </c:choose>
		                            <c:choose>
			                            <c:when test="${list.reviewCheck eq 'N'}">
			                           		<input class="reservListBtn cursorStyle" onclick="review(${list.lidx},${list.ridx},${list.reserv_idx},'${list.lodgingname}','${list.rtype}','${list.reserv_startDate}','${list.reserv_endDate}','${list.limagename}')" type="button" value="리뷰쓰기"/>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<input class="reservListBtn cursorStyle btnFontSize" onclick="alert('이미 리뷰 작성을 완료하였습니다.');" type="button" value="리뷰작성완료"/>
			                        	</c:otherwise>
		                        	</c:choose>
		                        </td>
		                    </tr>
	                    </c:forEach>
	                </table>
	            <div id="btnArea">
	                <div id="btnArea2">
	                    <ul>
	                    	<c:if test="${pageMaker2.prev2}">
	                    		<li class="float"><a class="a_margin" href="<%=request.getContextPath()%>/mypage/reservList.do?page2=${pageMaker2.startPage2 - 1}">이전</a></li>
	                    	</c:if>
	                    	<c:forEach begin="${pageMaker2.startPage2}" end="${pageMaker2.endPage2}" var="idx2">
	                    		<li class="float"><a class="a_margin" href="<%=request.getContextPath()%>/mypage/reservList.do?page2=${idx2}">${idx2}</a></li>
	                    	</c:forEach>
	                    	
	                    	<c:if test="${pageMaker2.next2 && pageMaker2.endPage2 > 0}">
	                    		<li class="float"><a class="a_margin" href="<%=request.getContextPath()%>/mypage/reservList.do?page2=${pageMaker2.endPage2 +1}">다음</a></li>
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