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
    <title>Document</title>
    <link href="<%=request.getContextPath() %>/resources/css/mypage_css/userDt.css" rel="stylesheet"/>
     
    
</head>
<body>
	<header>
		<a href="<%=request.getContextPath() %>/index/index.do"><img src="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg"/></a>
		<p>회원탈퇴</p>
	</header>
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