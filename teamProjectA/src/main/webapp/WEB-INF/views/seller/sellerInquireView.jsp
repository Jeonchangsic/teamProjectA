<%@page import="team.projectA.vo.UserVO"%>
<%@page import="team.projectA.vo.QnaVO"%>
<%@page import="java.util.List"%>
<% QnaVO qnaOne = (QnaVO)request.getAttribute("qnaOne"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/sellerInquireView.css">
    <!-- 파비콘 -->
<link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>	
	/*게시글삭제  */
	
		function delFn() {
			if (!confirm("해당 게시글을 삭제하시겠습니까?")) {
				alert("삭제가 취소되었습니다.");
			} else {
				alert("삭제가 완료되었습니다.");
				location = "sellerdelete.do?qna_idx=<%=qnaOne.getQna_idx()%>";
				}
			};


</script>
</head>
<body>
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
    <input type="hidden" name="uidx">
    <input type="hidden" name="qna_idx">
    <main  class=inner style="padding-top:150px;">
    	<h2>게시글 상세화면</h2>
	    	<form>
	    		<table>
	    		    <tr>
	    				<td>작성자</td>
	    				<td>${login.userName}</td>
	    				<td>작성일</td>
	    				<td><%=qnaOne.getQna_Qdate()%></td>
	    			</tr>
	    			<tr>
	    				<td>제목</td>
	    				<td><%=qnaOne.getQna_Qtitle()%></td>
	    			</tr>	
	    		</table>
		    	<div id="textA"><%=qnaOne.getQna_Qcontent()%></div>
		    	<div id="Atable">
					<p>관리자 답변</p>
					<c:choose>
						<c:when test = "${qnaOne.qna_Acontent != null}">
							<div><%=qnaOne.getQna_Acontent()%> </div>
						</c:when>
						<c:when test = "${qnaOne.qna_Acontent == null}">
							<div>답변 준비중입니다</div>
						</c:when>
					</c:choose>
				</div>		
		    	<div id="btn">
					<button type="button" onclick="location.href='sellerInquire.do'">목록</button>
			    	<button type="button" onclick="location.href='sellerInquireModify.do?qna_idx=${qnaOne.qna_idx}'">수정</button> 
			    	<button type="button" onclick="delFn()">삭제</button>
		    	</div>
	       </form>

	       	    	   
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
