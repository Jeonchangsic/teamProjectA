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
     
     <!--회원탈퇴 팝업창 -->
     <script>
     function userDt(){
    	 alert(" 저긴어때(주) 회원 탈퇴를 진행하시면 기존의 정보와 \n 거래내역 등 모든 정보가 사라집니다.\n 또한 삭제된 정보는 되돌릴 수 없습니다.\n 계속 탈퇴를 진행하시려면 비밀번호란에 회원님의 비밀번호를 \n 작성 후 계속 진행해 주세요.");
    	var url = "<%=request.getContextPath()%>/mypage/userDt.do";   //팝업창 페이지 URL
 		var winWidth = 500;
 	    var winHeight = 300;
 	  	var popupX = (window.screen.width / 2) - (500 / 2);
 	  	var popupY= (window.screen.height / 2) - (300 / 2);
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
		    		 url:"<%=request.getContextPath()%>/ajax/pwModify.do",
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
	        <div id="contentsArea1">
	            <form id="form_Style">
	                <table id="table1">
	                    <tr>
	                        <td class="margin1">이름</td><td><input type="text" class="info" name="userName" value="${login.userName}" readonly></td> 
	                    </tr>
	                    <tr>
	                        <td class="margin1">비밀번호</td><td><input type="password" class="info" id="password" name="userPassword" placeholder="변경할 비밀번호를 입력하세요." required></td>
	                        <td><button type="button" onclick="pwReset()" class="cursorStyle btn_hover btn_height font_Style">변경하기</button></td>
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
	                <button id="btn_style" type="button" onclick="userDt()" class="cursorStyle btn_hover font_Style">회원탈퇴</button>
	            </form>
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