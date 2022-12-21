<%@page import="team.projectA.vo.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% LodgingVO lodging = (LodgingVO) request.getAttribute("lodging"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>저긴어때</title>
<link
	href="<%=request.getContextPath()%>/resources/css/seller_css/sellerInfo.css"
	rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <!-- 파비콘 -->
<link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">

<script>
	//사업장이름         
	$(document).ready(function() {
		$("#nameFn").on("click", function() {			
			var lodgingname = ${lodging.lidx}
			if( !lodgingname ){
				alert("숙소를 먼저 등록하세요")
			} else {alert("변경이 완료되었습니다");
			var frm = document.nameform;
			frm.action = "sellerInfo2.do";
			frm.method = "POST";
			frm.submit();

			console.log("성공");
			}
		})
		//주소
		$("#addrFn").on("click", function() {
			var lodgingaddr = ${lodging.lidx}
			if( !lodgingaddr){
				alert("숙소를 먼저 등록하세요")
			} else {
			alert("변경이 완료되었습니다");
			var frm = document.nameform;
			frm.action = "sellerInfo2.do";
			frm.method = "POST";
			frm.submit();

			console.log("성공");
			}
		})
		//이메일
		$("#mailFn").on("click", function() {
			alert("변경이 완료되었습니다");
			var frm = document.nameform;
			frm.action = "sellerInfo1.do";
			frm.method = "POST";
			frm.submit();

			console.log("성공");
		})
		//비밀번호
		$("#pwdFn").on("click", function() {
			
			 var password = $("#password").val();
	    	 var num = password.search(/[0-9]/g);
	    	 var eng = password.search(/[a-z]/ig);
	    	 var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    	 console.log(password);
	    	 if(password.length < 8 || password.length > 20){			 //비밀번호의 길이가 일치하지 않는경우
	    		 alert("8자리 ~20자리 이내로 입력하여 주세요.");
		    	}else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){ //특문,영문,숫자를 조합한 비밀번호가 아닌경우 
		    		alert("특수문자, 영문, 숫자를 조합하여주세요.");
		    	}else{
		    		
			alert("변경이 완료되었습니다");
			var frm = document.nameform;
			frm.action = "sellerInfo1.do";
			frm.method = "POST";
			frm.submit();

			console.log("성공");
		  }
		})
		//전화번호
		$("#phoneFn").on("click", function() {
			alert("변경이 완료되었습니다");
			var frm = document.nameform;
			frm.action = "sellerInfo1.do";
			frm.method = "POST";
			frm.submit();

			console.log("성공");
		})
	});

		/*회원탈퇴 페이지 이동  */
		function delFn() {
			if (!confirm("회원탈퇴 페이지로 이동하시겠습니까?")) {
				alert("이동이 취소되었습니다.");
			} else {
				location = "/A/mypage/userDt.do";
			}
		}

	//비밀번호 체크
</script>
</head>

<body style="overflow-x: hidden">
	<header>
		<div id="header">
			<div class="top">
				<h3>판매자페이지</h3>
				<div id="manager">
					<ul>
						<li><a href="<%=request.getContextPath()%>/index/index.do">home</a></li>
						<li><a
							href="<%=request.getContextPath()%>/seller/sellerInfo.do">마이페이지</a></li>
						<li>
							<c:if test="${login.lodging.equals('N') }">
								<a href="<%=request.getContextPath()%>/seller/sellerLodgingUp.do">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Waiting') }">
								<a href="javascript:alert('이미 숙소 승인을 요청하였습니다.');">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Y') }">
								<a href="<%=request.getContextPath()%>/seller/sellerRegi.do">숙소관리</a>
							</c:if>
						</li>
						<li><a
							href="<%=request.getContextPath()%>/seller/sellerInquire.do">문의</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<main class="inner">
		<h2>마이페이지</h2>
		<form id="nameForm" name="nameform">
			<table id="info_Area">
				<tr>
					<td>아이디</td>
					<td><%=lodging.getUserID()%></td>
					<td></td>
				</tr>
				<tr>
					<td>사업장명</td>
					<td><input type='text' name="lodgingname" id="lodgingname" value="${lodging.lodgingname}"></td>

					<td><button type="button" id="nameFn" value="상세변경" class="btn_size">변경</button></td>
				</tr>

				<tr>
					<td>비밀번호변경</td>
					<td><input type='password' name="userPassword"  id="password" value="${lodging.userPassword}" ></td>
					<td><button type="button" class="btn_size" id="pwdFn">변경</button></td>
				</tr>


				<tr>
					<td>이메일</td>
					<td><input type='text' name="userEmail" value="${lodging.userEmail}" autoComplete="off"></td>
					<td><button type="button" class="btn_size" id="mailFn">변경</button></td>

				</tr>


				<tr>
					<td>전화번호</td>
					<td><input type='text' name="userPhone" value="${lodging.userPhone}"></td>
					<td><button type="button" class="btn_size" id="phoneFn">변경</button></td>
				</tr>

				<tr>
					<td>숙소 주소</td>
					<td><input type='text' name="lodgingaddr" id="lodgingaddr" value="${lodging.lodgingaddr}"></td>
					<td><button type="button" class="btn_size" id="addrFn">변경</button></td>
				</tr>

			</table>
		</form>
		<div id="delrow">
			<button id="mydel" type="button" onclick="delFn()">회원탈퇴</button>
		</div>

	</main>
	<footer>
		<div id="foot">
			<br> <br>
			<div id="copy">
				(주)저긴어때 l 대표이사 : 홍이젠 l 사업자 등록번호 : 104-14-100400 l 메일 :
				Whatdoyouthink@naver.com <br> 주소 : 전라북도 전주시 덕진구 금암1동 667-52 5층
				l 전화번호 : 063-104-1004 (오전 9시 ~ 오후 5시)<br> <br> Copyright
				WD COMPANY Corp. All rights reserved. <br> <br>

			</div>
		</div>
	</footer>
</body>
</html>
</body>
</html>