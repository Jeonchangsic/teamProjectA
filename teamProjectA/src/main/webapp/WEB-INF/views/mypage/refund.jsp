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
</head>
<body>
	<form action="refund.do" method="post">
	<h2>    </h2>
	<div id="divArea">
		<table>
			<tr class="tr_height">
				<td>예약번호:
					<td class="text_Center"><input class="inputArea" type="text" name="reserv_num" value="${result.reserv_num}" readonly/></td>
				</td>
			</tr>
			<tr class="tr_height">
				<td>숙소명:
					<td class="text_Center">${result.lodgingname}</td>
				</td>
			</tr>
			<tr class="tr_height">
				<td>객실명:
					<td class="text_Center">${result.rtype}</td>
				</td>
			</tr>
			<tr class="tr_height">
				<td>금액:
					<td class="text_Center">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${result.rprice}" />원
					</td>
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