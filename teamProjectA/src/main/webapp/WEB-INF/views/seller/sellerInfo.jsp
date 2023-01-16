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
	//사업장이름 변경        
	$(document).ready(function() {
		$("#nameFn").on("click", function() {			
			var lodgingname = ${lodging.lidx} //숙소없으면 등록먼저 유도
			if( !lodgingname ){
				alert("숙소를 먼저 등록하세요")
			} else {alert("변경이 완료되었습니다");
			var frm = document.nameform; //<form name="nameform"> body에 정의
			frm.action = "sellerInfo2.do";
			frm.method = "POST"; //하나씩 변경하기 위해서 따로 post
			frm.submit();
			
			console.log("성공");
			}
		})
		//주소 변경
		$("#addrFn").on("click", function() { //숙소없으면 등록먼저 유도
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
		//이메일 변경
		$("#mailFn").on("click", function() {
			alert("변경이 완료되었습니다");
			var frm = document.nameform;
			frm.action = "sellerInfo1.do";
			frm.method = "POST";
			frm.submit();

			console.log("성공");
		})
		//비밀번호 변경
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
		//전화번호 변경
		$("#phoneFn").on("click", function() {
			alert("변경이 완료되었습니다");
			var frm = document.nameform;
			frm.action = "sellerInfo1.do";
			frm.method = "POST";
			frm.submit();

			console.log("성공");
		})
	});

		//회원탈퇴 페이지 이동 
		function delFn() {
			if (!confirm("회원탈퇴 페이지로 이동하시겠습니까?")) {
				alert("이동이 취소되었습니다.");
			} else {
				location = "/A/mypage/userDt.do";
			}
		}
		
		function delFn2(){
			alert("숙소 삭제 후 탈퇴 가능합니다.")
		};
		
		//이메일인증
		var codetemp ="";
		$(function(){
			$(".mail_check_button").click(function(){
				var email = $(".mail_input").val(); //입력한 이메일 
	    		var checkBox = $(".mail_check_input"); //인증번호 입력란
	    		var boxWrap = $(".mail_check_input_box"); //인증번호 입력영역
				var code = "";

	    		
	    		$.ajax({
		    		type:"GET",
					url:"mailCheck2?email="+ email,
					success:function(data){
						alert("인증번호 전송이 완료되었습니다.");
						checkBox.attr("disabled",false); // attr : cehckBox의 속성을 변경
						boxWrap.attr("id","mail_check_input_box_true");
						codetemp = data; //컨트롤러에서 받은 리턴값(난수)을 변수에 넣는다.
					}
				}); 
			});
			$(".mail_check_input").blur(function(){
	    		var inputcode = $(".mail_check_input").val(); //입력결과
	    		var checkResult = $("#mail_check_input_box_warn"); //비교결과
	    		
	    		if(inputcode == codetemp){ //인증번호가 일치하는 경우
	    			$(".email_ok").css("display","inline-block");
		    		$(".email_no").css("display","none");
	    			$("#mailFn").show();
	    		}else{						//인증번호가 일치하지 않는 경우
	    			$(".email_ok").css("display","none");
		    		$(".email_no").css("display","inline-block");
		    		$(".mail_check_input").val("");
	    		}
	    	});
		})
	

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
					<c:choose>
						<c:when test = "${lodging.lodging == 'Y'}">
							<td>사업장 명</td>
							<td><input type='text' name="lodgingname" id="lodgingname" value="${lodging.lodgingname}"></td>
							<td><button type="button" id="nameFn" value="상세변경" class="btn_size">변경</button></td>
						</c:when>
						<c:when test = "${lodging.lodging == 'N' || lodging.lodging == null}">
							<td>사업장 명</td>
							<td >숙소를 등록해 주세요.</td>
						</c:when>
						<c:when test = "${lodging.lodging == 'Waiting'}">
							<td>사업장 명</td>
							<td>승인 대기 중입니다.</td>
						</c:when>
					</c:choose>
				</tr>

				<tr>
					<td>비밀번호변경</td>
					<td><input type='password' name="userPassword"  id="password" value="${lodging.userPassword}" ></td>
					<td><button type="button" class="btn_size" id="pwdFn">변경</button></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type='text' name="userEmail" value="${lodging.userEmail}" autoComplete="off" class="mail_input"></td>
					<td><button type="button" class="btn_size mailFn" id="mailFn" >변경</button></td>
				</tr>
					<tr>
					<td></td>
					<td class="mail_check_input_box">
						<input id="mail_check_input" class="mail_check_input" disabled="disabled" required>
					</td>
					<td id="mail_check_button" class="mail_check_button">
						<span class="btn_size">인증번호 전송</span>
					</td>
				</tr>

				<tr>
					<td></td>
					<td>
						<span id="mail_check_input_box_warn"></span>
						<span class="email_ok">인증번호가 일치합니다.</span>
						<span class="email_no">인증번호가 다릅니다.</span>
					</td>
					<td></td>
				</tr>


				<tr>
					<td>전화번호</td>
					<td><input type='text' name="userPhone" value="${lodging.userPhone}"></td>
					<td><button type="button" class="btn_size" id="phoneFn">변경</button></td>
				</tr>

				<tr>
					<c:choose>
						<c:when test = "${lodging.lodging == 'Y'}">
							<td>숙소 주소</td>
							<td><input type='text' name="lodgingaddr" id="lodgingaddr" value="${lodging.lodgingaddr}"></td>
							<td><button type="button" class="btn_size" id="addrFn">변경</button></td>
						</c:when>
						<c:when test = "${lodging.lodging == 'N'}">
							<td>숙소 주소</td>
							<td >숙소를 등록해 주세요.</td>
						</c:when>
						<c:when test = "${lodging.lodging == 'Waiting'}">
							<td>숙소 주소</td>
							<td >승인 대기 중입니다.</td>
						</c:when>
					</c:choose>
				</tr>


			</table>
		</form>
		<div id="delrow">
			<c:if test = "${lodging.lidx == null || lodging.lidx == ''}">
				<button id="mydel" type="button" onclick="delFn()">회원탈퇴</button>
			</c:if>
			<c:if test = "${lodging.lidx != null && lodging.lidx != ''}">
				<button id="mydel" type="button" onclick="delFn2()">회원탈퇴</button>
			</c:if>
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