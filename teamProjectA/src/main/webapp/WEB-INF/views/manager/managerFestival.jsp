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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerFestival.css">
	<!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     <!--XE아이콘-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> 
	
	<!-- 페스티발 등록 팝업창 -->
     <script>
     function festivalPlus(){
    	var url = "<%=request.getContextPath()%>/manager/festivalPlus.do";
 		var winWidth = 600;
 	    var winHeight = 670;
 	  	var popupX = (window.screen.width / 2) - (600 / 2);
 	  	var popupY= (window.screen.height / 2) - (670 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     <!-- 페스티발 상세페이지 팝업창 -->
     <script>
     function festivalInfo(ftidx){
    	var url = "<%=request.getContextPath()%>/manager/festivalInfo.do?ftidx="+ftidx;
 		var winWidth = window.screen.width;
 	    var winHeight = window.screen.height;
 	  	var popupX = (window.screen.width / 2) - (window.screen.width / 2);
 	  	var popupY= (window.screen.height / 2) - (window.screen.height / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     <!-- 페스티발 수정페이지 팝업창 -->
     <script>
     function festivalMf(ftidx){
    	var url = "<%=request.getContextPath()%>/manager/festivalMf.do?ftidx="+ftidx;
 		var winWidth = 600;
 	    var winHeight = 670;
 	  	var popupX = (window.screen.width / 2) - (600 / 2);
 	  	var popupY= (window.screen.height / 2) - (670 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     <script>
	     function festivalDt(ftidx) {
	 		
	 		if(!confirm("해당 페스티발을 삭제하시겠습니까?")){
	 			alert("삭제가 취소되었습니다.");
	 		}else{
	 			location.href="<%=request.getContextPath()%>/manager/festivalDt.do?ftidx="+ftidx;
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
            <form>   
	        	<table>
	        		<tr>
	        			<th class="th_width">NO</th>
	        			<th class="th_width">지역</th>
	        			<th>축제명</th>
	        			<th id="th_Style">등록일</th>
	        			<th class="btn_th"></th>
	        			<th class="btn_th"></th>
	        		</tr>
	        		<c:forEach var ="list" items="${festivalList}">
		       			<tr>
		        			<td>${list.ftidx}</td>
		        			<td>${list.ftAddr}</td>
		        			<td>
		        				<a onclick="festivalInfo(${list.ftidx})" id="a_Hover">${list.ftName}</a>
		        			</td>
		        			<td>${list.ftRegDate}</td>
		        			<td>
	        					<button type="button" id="modify_Btn" onclick="festivalMf(${list.ftidx})">수정</button>
	        				</td>
		        			<td>
		        				<button type="button" onclick="festivalDt(${list.ftidx})" id="btn_Style">
		        					<i class="xi-close"></i>
		        				</button>
		        			</td>
		        		</tr>
	        		</c:forEach>
	        		<tr>
	        			<td class="border_reset"></td>
	        			<td class="border_reset"></td>
	        			<td class="border_reset"></td>
	        			<td class="border_reset td_text">
	        				<button class="bottom_btn" type="button" onclick="festivalPlus()">축제추가</button>
	        			</td>
	        			<td class="border_reset">
	        				<button class="bottom_btn">메인리스트관리</button>
	        			</td>
	        		</tr>
	        	</table>
	        </form>
        </main>
	</body>
</html>