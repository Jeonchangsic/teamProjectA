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
    <link href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     <!-- js -->
     <script>
     	$(document).ready(function(){
     		$("#change1").click(function(){
     			$("#contentsArea").css("display","none");
     			$("#contentsArea1").css("display","block");
     			$("#contentsArea2").css("display","none");
     			$("#memberInfo").css("font-weight","bold");
     			$("#conform").css("font-weight","normal");
     			$("#reviewList").css("font-weight","normal");
     		});
     		$("#change2").click(function(){
     			$("#contentsArea1").css("display","none");
     			$("#contentsArea").css("display","block");
     			$("#contentsArea2").css("display","none");
     			$("#memberInfo").css("font-weight","normal");
     			$("#conform").css("font-weight","bold");
     			$("#reviewList").css("font-weight","normal");
     		});
     		$("#change3").click(function(){
     			$("#contentsArea1").css("display","none");
     			$("#contentsArea").css("display","none");
     			$("#contentsArea2").css("display","block");
     			$("#memberInfo").css("font-weight","normal");
     			$("#conform").css("font-weight","normal");
     			$("#reviewList").css("font-weight","bold");
     		});
     	})
     </script>
     
     <!--회원탈퇴 팝업창 -->
     <script>
     function userDt(){
    	 alert(" 저긴어때(주) 회원 탈퇴를 진행하시면\n 기존의 정보와 거래내역 등 모든 정보가 사라집니다.\n 또한 삭제된 정보는 되돌릴 수 없습니다.\n 계속 탈퇴를 진행하시려면 비밀번호란에 회원님의 비밀번호를 \n 작성 후 계속 진행해 주세요.");
    	var url = "<%=request.getContextPath()%>/mypage/userDt.do";   //팝업창 페이지 URL
 		var winWidth = 500;
 	    var winHeight = 350;
 	  	var popupX = (window.screen.width / 2) - (500 / 2);
 	  	var popupY= (window.screen.height / 2) - (350 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     
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
 	    var winHeight = 430;
 	  	var popupX = (window.screen.width / 2) - (550 / 2);
 	  	var popupY= (window.screen.height / 2) - (430 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
     
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
     
     <!-- 비밀번호 변경 -->
     <script>
     function pwReset(){
    	 var password = $("#password").val();
    	 var num = password.search(/[0-9]/g);
    	 var eng = password.search(/[a-z]/ig);
    	 var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    	 
    	 if(password.length < 8 || password.length > 20){			 //비밀번호의 길이가 일치하지 않는경우
    		 alert("8자리 ~20자리 이내로 입력하여 주세요.");
	    	}else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){ //특문,영문,숫자를 조합한 비밀번호가 아닌경우 
	    		alert("특수문자, 영문, 숫자를 조합하여주세요.");
	    	}else{										//비밀번호 설정이 일치하는경우
		    	 $.ajax({
		    		 url:"pwModify.do",
		    		 type:"post",
		    		 data: "password="+password,
		    		 success:function(data){
		    				  alert('비밀번호 수정이 완료되었습니다.');
		    				  location.reload(); 
		    		 }
		    	 });	
	    	};
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
	            <a id="change1" href="#">
	            	<div id="memberInfo">회원정보수정</div>
	            </a>
	            <a id="change2" href="#">
	            	<div id="conform">예약내역확인</div>
	            </a>
	            <a id="change3" href="#">
	            	<div id="reviewList">리뷰내역</div>
	            </a>
	        </div>
	        <div id="contentsArea1">
	            <form>
	                <table id="table1">
	                    <tr>
	                        <td class="margin1">이름</td><td><input type="text" class="info" name="userName" value="${login.userName}" readonly></td> 
	                    </tr>
	                    <tr>
	                        <td class="margin1">비밀번호</td><td><input type="password" class="info" id="password" name="userPassword" placeholder="변경할 비밀번호를 입력하세요." required></td>
	                        <td><button type="button" onclick="pwReset()" class="cursorStyle">변경하기</button></td>
	                    </tr>
	                    <tr>
	                        <td class="margin1">이메일</td><td><input type="text" class="info"  name="userEmail" value="${login.userEmail}" readonly></td>
	                    </tr>
	                    <tr>
	                        <td class="margin1">휴대전화</td><td><input type="text" class="info" name="userPhone" value="${login.userPhone}" readonly></td>
	                    </tr>
	                    <tr>
	                        <td class="margin1">생년월일</td><td><input type="text" class="info" name="userBirth" value="${login.userBirth}" readonly></td>
	                    </tr>
	                </table>
	                <button id="btn_style" type="button" onclick="userDt()" class="cursorStyle">회원탈퇴</button>
	            </form>
	        </div>
	        <div id="contentsArea">
	                <table class="table10">
	                    <tr class="tr_center tr_border">
	                        <th>예약번호</th>
	                        <th></th>
	                        <th>숙소명</th>
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
		                        <td  class="button_Size">
		                            <input class="reservListBtn cursorStyle" onclick="refund_pop(${list.ridx},${list.uidx},'${list.limagename}')" type="button" value="예약취소"/>
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
	                    	<c:if test="${pageMaker.prev}">
	                    		<li><a href="<%=request.getContextPath()%>/mypage/info.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
	                    	</c:if>
	                    	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                    		<li><a href="<%=request.getContextPath()%>/mypage/info.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
	                    	</c:forEach>
	                    	
	                    	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	                    		<li><a href="<%=request.getContextPath()%>/mypage/info.do${pageMaker.makeQuery(pageMaker.endPage +1)}">다음</a></li>
	                    	</c:if>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <div id="contentsArea2">
	        	 <table class="table10">
	                    <tr class="tr_center tr_border">
	                   		<th ></th>
	                        <th class="lodging_Style">숙소명</th>
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