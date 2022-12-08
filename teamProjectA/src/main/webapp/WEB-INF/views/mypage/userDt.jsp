<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/mypage_css/userDt.css" rel="stylesheet"/>
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     <script>
     	
     		alert(" 저긴어때(주) 회원 탈퇴를 진행하시면\n 기존의 정보와 거래내역 등 모든 정보가 사라집니다.\n 또한 삭제된 정보는 되돌릴 수 없으니 주의하셔야 합니다.\n 계속 탈퇴를 진행하시려면 비밀 번호란에 회원님의 비밀번호를 \n 작성 후 계속 진행해 주세요.");
 
     </script>
    
</head>
<body>
	<header>
		<h2>회원탈퇴</h2>
	</header>
	<main>
	    <form action="userDt.do" method="post">
	    	<table>
	    		<tr>
	    			<td>아이디</td>
	    			<td>
	    				<input type="text" id="userID" name="userID" value="${login.userID}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>패스워드</td>
	    			<td>
	    				<input type="password" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요."/>
	    			</td>
	    		</tr>
	    	</table>
		    <c:if test="${msg == false }">
		    <p style="color:red;"> 
		   	 비밀번호가 일치하지 않습니다!
		    </p>
		    </c:if>
	    	<button>회원탈퇴</button>
	    </form>
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