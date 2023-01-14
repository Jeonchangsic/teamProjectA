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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerTrip.css">
	<!-- 파비콘 -->
	<link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
	<!---- jQuery ---->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	 <!--XE아이콘-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> 
	
	<!-- 여행지 등록 팝업창 -->
     <script>
     function tripPlus(){
    	var url = "<%=request.getContextPath()%>/manager/tripPlus.do";
 		var winWidth = 600;
 	    var winHeight = 670;
 	  	var popupX = (window.screen.width / 2) - (600 / 2);
 	  	var popupY= (window.screen.height / 2) - (670 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     <!-- 여행지 상세페이지 팝업창 -->
     <script>
     function tripInfo(tidx){
    	var url = "<%=request.getContextPath()%>/manager/tripInfo.do?tidx="+tidx;
 		var winWidth = window.screen.width;
 	    var winHeight = window.screen.height;
 	  	var popupX = (window.screen.width / 2) - (window.screen.width / 2);
 	  	var popupY= (window.screen.height / 2) - (window.screen.height / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     <!-- 여행지 수정페이지 팝업창 -->
     <script>
     function tripMf(tidx){
    	var url = "<%=request.getContextPath()%>/manager/tripMf.do?tidx="+tidx;
 		var winWidth = 600;
 	    var winHeight = 670;
 	  	var popupX = (window.screen.width / 2) - (600 / 2);
 	  	var popupY= (window.screen.height / 2) - (670 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     <!-- 여행지 메인 등록 페이지 팝업창 -->
     <script>
     function listRegPage(){
    	var url = "<%=request.getContextPath()%>/manager/tripRegPage.do;"
 		var winWidth = 620;
 	    var winHeight = 670;
 	  	var popupX = (window.screen.width / 2) - (620 / 2);
 	  	var popupY= (window.screen.height / 2) - (670 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     <script>
	     function tripDt(tidx) {
	 		
	 		if(!confirm("해당 여행지가 메인 리스트에 등록되어 있다면 등록 리스트에서도 삭제됩니다. 해당 여행지를 삭제하시겠습니까?")){
	 			alert("삭제가 취소되었습니다.");
	 		}else{
	 			location.href="<%=request.getContextPath()%>/manager/tripDt.do?tidx="+tidx;
	 		}
	     }
     </script>
	</head>
    <body style="overflow-x: hidden">
        <div id="header">
            <div class="top">
                <h3>관리자페이지</h3>
                <div id="manager">
                    <ul>
                        <li><a href="<%=request.getContextPath() %>/index/index.do">home</a></li>
                    	<li><a href="<%=request.getContextPath() %>/manager/managerUser.do">회원관리</a></li>
                    	<li><a href="<%=request.getContextPath() %>/manager/managerRoom.do">숙소관리</a></li>
                    	<li><a href="<%=request.getContextPath() %>/manager/managerReview.do">리뷰관리</a></li>
                    	<li><a href="<%=request.getContextPath() %>/manager/managerFestival.do">등록관리</a></li>                
                    </ul>
                </div>
            </div>
        </div>
        <main>
            <div class="inner">
            	<p>등록관리</p>
                <h3 id="festival"><a href="<%=request.getContextPath() %>/manager/managerFestival.do">페스티발 관리</a></h3>
                <h3 id="trip"><a href="<%=request.getContextPath() %>/manager/managerTrip.do">인기 여행지 관리</a></h3>
            </div>     
        	<table>
        		<tr>
        			<th class="th_width">NO</th>
        			<th class="th_width">지역</th>
        			<th>여행지명</th>
        			<th id="th_Style">등록일</th>
        			<th class="btn_th default_width"></th>
        			<th class="btn_th default_width2"></th>
        		</tr>
        		<c:forEach var ="list" items="${tripList}">
	        		<tr>
	        			<td>${list.tidx}</td>
	        			<td>${list.tAddr}</td>
	        			<td>
	        				<a onclick="tripInfo(${list.tidx})" id="a_Hover">${list.tName}</a>
	        			</td>
	        			<td>${list.tRegDate}</td>
	        			<td>
	        				<button type="button" id="modify_Btn" onclick="tripMf(${list.tidx})">수정</button>
	        			</td>
	        			<td class="delete_Btn">
	        				<button onclick="tripDt(${list.tidx})" id="btn_Style">
	        					<i class="xi-close"></i>
	        				</button>
	        			</td>
	        		</tr>
        		</c:forEach>
        	</table>
        	<ul id="pageUl">
       			<c:if test="${pageMaker.prev}">
       				<li><a href="<%=request.getContextPath()%>/manager/managerTrip.do?page=${pageMaker.startPage - 1}">이전</a></td>
       			</c:if>
       			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        			<li><a href="<%=request.getContextPath()%>/manager/managerTrip.do?page=${idx}">${idx}</a></td>
        		</c:forEach>
        		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        			<li><a href="<%=request.getContextPath()%>/manager/managerTrip.do?page=${pageMaker.endPage + 1}">다음</a></td>
        		</c:if>
        	</ul>
        	<div>
	        	<ul id="btnUl">
        			<li class="border_reset">
        				<button class="bottom_btn" type="button" onclick="tripPlus()">여행지추가</button>
        				<button type="button" class="bottom_btn" onclick="listRegPage()">메인리스트관리</button>
        			</li>
        		</ul>
       		</div>
       	</main>
    </body>
</html>