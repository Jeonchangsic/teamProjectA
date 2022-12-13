<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="refund.do" method="post">
	<div style="border:1px solid #000; border-radius:5px; padding:8px;">
		<table>
			<tr>
				<td>예약번호:
					<td><input type="text" name="reserv_num" value="${result.reserv_num}" readonly/></td>
				</td>
			</tr>
			<tr>
				<td>숙소명:
					<td>${result.lodgingname}</td>
				</td>
			</tr>
			<tr>
				<td>금액:
					<td>${result.rprice}</td>
				</td>
			</tr>
			<tr>
				<td>비밀번호:
					<td>
						<input type="text" name="userPassword" placeholder="회원 비밀번호를 입력하세요."/>
						<c:if test="${msg == false }">
					    <p style="color:red;"> 
					   	 비밀번호가 일치하지 않습니다!
					    </p>
		   				</c:if>
					</td>
				</td>
			</tr>
		</table>
		<button style="margin-left:210px;">작성</button>
	</div>
	</form>
</body>
</html>