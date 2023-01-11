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
		<h2 class="font_Style">
			회원탈퇴
		</h2>
	</header>
	<main>
	    <form action="userDt.do" method="post">
	    <input type="hidden" name="uidx" value="${login.uidx}">
	    	<table id="tableMargin">
	    		<tr style="border-top: 3px solid #919191;">
	    			<td class="passwordMargin font_Style">아이디</td>
	    			<td class="input_td font_Style">
	    				<input type="text" id="userID" name="userID" class="font_Style" value="${login.userID}" readonly/>
	    			</td>
	    		</tr>
	    		<tr id="tr_border">
	    			<td class="passwordMargin font_Style">패스워드</td>
	    			<td class="input_td font_Style">
	    				<input class="trMargin font_Style" type="password" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요."/>
	    			</td>
	    		</tr>
	    	</table>
	    	<div id="btnCss">
	    		<button class="cursorStyle font_Style" id="btnbar">회원탈퇴</button>
	    	</div>
	    </form>
    </main>
</body>
</html>