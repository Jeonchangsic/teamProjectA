<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage.css" rel="stylesheet"/>
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
     <script>
     function refund_pop(ridx,uidx){
    	var url = "<%=request.getContextPath()%>/mypage/refundPop.do?ridx="+ridx+"&uidx="+uidx;   //팝업창 페이지 URL
 		var winWidth = 500;
 	    var winHeight = 400;
 	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
</head>
<body>
    <header>
    	
        <h2>
        	<a href="<%=request.getContextPath()%>/index/index.do">
        		<img src="<%=request.getContextPath()%>/resources/images/login_images/logo2.svg" style="width:150px; margin-bottom:8px;"/>
        	</a>
        	<p>마이페이지</p>
        </h2>
    </header>
                <!--end header-->

    <main>
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
            <form action="pwModify.do" method="post">
                <table id="table1">
                    <tr>
                        <td class="margin1">이름</td><td><input type="text" class="info" name="userName" value="${login.userName}" readonly></td> 
                    </tr>
                    <tr>
                        <td class="margin1">비밀번호</td><td><input type="text" class="info"  name="userPassword" placeholder="변경할 비밀번호를 입력하세요."></td>
                        <td><button>변경하기</button></td>
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
                <button id="btn_style" type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/userDt.do'" style="width:100px; height:30px; margin-left:200px;">회원탈퇴</button>
            </form>
        </div>
        <div id="contentsArea">
                <table class="table10">
                    <tr class="ta_center tr_border">
                        <th>예약번호</th>
                        <th>숙소정보</th>
                        <th>예약자명</th>
                        <th>숙박일자</th>
                        <th>금액</th>
                        <th>비고</th>
                    </tr>
                    <c:forEach items="${list}" var="list">
	                    <tr>
	                        <td>${list.reserv_num}</td>
	                        <td>${list.lodgingname}</td>
	                        <td>${list.userName}</td>
	                        <td>${list.reserv_startDate} ~ ${list.reserv_endDate}</td>
	                        <td>${list.rprice}</td>
	                        <td  class="ta_center">
	                            <input onclick="refund_pop(${list.ridx},${list.uidx})" type="button" value="예약취소"/>
	                            <input type="button" value="리뷰쓰기" onclick="location.href='<%=request.getContextPath()%>/review/review.do?lidx=${list.lidx}'"/>
	                        </td>
	                    </tr>
                    </c:forEach>
                </table>
            <div id="btnArea">
                <div id="btnArea2">
                    <ul>
                    	<c:if test="${pageMaker.prev}">
                    		<li><a href="<%=request.getContextPath()%>/mypage/info.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
                    	</c:if>
                    	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                    		<li><a href="<%=request.getContextPath()%>/mypage/info.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
                    	</c:forEach>
                    	
                    	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                    		<li><a href="<%=request.getContextPath()%>/mypage/info.do${pageMaker.makeSearch(pageMaker.endPage +1)}">다음</a></li>
                    	</c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div id="contentsArea2">
        	 <table class="table10">
                    <tr class="ta_center tr_border">
                        <th>숙소명</th>
                        <th>리뷰제목</th>
                        <th>리뷰작성일</th>
                    </tr>
                    <c:forEach items="${reviewList}" var="reviewList">
	                    <tr>
	                    	<td>${reviewList.lodgingname}</td>
	                    	<td id="titleHover"><a href="<%=request.getContextPath()%>/mypage/reviewInfo.do?rvidx=${reviewList.rvidx}">${reviewList.rvTitle}</a></td>
	                    	<td>${reviewList.rvDate}</td>
	                    </tr>
	               	</c:forEach>
             </table>
        </div>
    </main>
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