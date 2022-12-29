<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>저긴어때</title>
	<link href="<%=request.getContextPath()%>/resources/css/mypage_css/refund.css" rel="stylesheet"/>
	<!-- 파비콘 -->
	<link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
</head>
<body>
	<form action="refund.do" method="post">
	<input type="hidden" name="ridx" value="${ridx}"/>
	<h2>예약취소</h2>
	<hr/>
	<div id="divArea">
		<table>
			<input class="inputArea" id="inputBorder" type="hidden" name="reserv_num" value="${result.reserv_num}" readonly/>
			<tr class="tr_height">
				<td class="lodging_Info">
					<img id="lodging_Img" src="<%=request.getContextPath()%>/resources/images/lodging_images/${limagename}"/>
				</td>
				<td class="lodging_Info">
					<div id="lodgingname">${result.lodgingname}</div>
					<div id="rtype">[${result.rtype}]</div>
					
				</td>
			</tr>
			<tr class="tr_height">
				<td></td>
				<td>
					<div id="rprice">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.rprice}" />원
					</div>
				</td>
			</tr>
		</table>
	</div>
	<table id="passwordTb">
	<div id="headLine"></div>
			<tr>
				<td id="passwordArea">비밀번호:
					<td>
						<input class="inputArea" id="passwordInput" type="password" name="userPassword" placeholder="회원 비밀번호를 입력하세요."/>
					</td>
					<td>
						<button class="cursorStyle">예약취소</button>
					</td>
				</td>
			</tr>
	</table>
	</form>
</body>
</html>