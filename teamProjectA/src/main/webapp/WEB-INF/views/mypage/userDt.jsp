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
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
    
</head>
<body>
	<header>
		<h2>
			<img src="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg">
		</h2>
	</header>
	<main>
	    <form action="userDt.do" method="post">
	    	<table id="tableMargin">
	    		<tr>
	    			<td class="passwordMargin">아이디</td>
	    			<td>
	    				<input type="text" id="userID" name="userID" value="${login.userID}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="passwordMargin">패스워드</td>
	    			<td>
	    				<input class="trMargin" type="password" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요."/>
	    			</td>
	    		</tr>
	    	</table>
		    <c:if test="${msg == false }">
		    <p id="pwFalse"> 
		   	 비밀번호가 일치하지 않습니다!
		    </p>
		    </c:if>
	    	<button class="cursorStyle">회원탈퇴</button>
	    </form>
    </main>
</body>
</html>