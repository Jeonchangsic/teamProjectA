<%@page import="team.projectA.vo.UserVO"%>
<%@page import="team.projectA.vo.QnaVO"%>
<%@page import="java.util.List"%>
<% QnaVO qnaOne = (QnaVO)request.getAttribute("vo"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의내용</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/sellerInquireView.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
       $(document).ready(function() {
        $("#button").click(function(){
            if($(".answer").css("display") == "none"){
                $(".answer").show();
            }
        })
    });
   
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
							href="<%=request.getContextPath()%>/seller/sellerInfo.do">내정보</a></li>
						<li>
							<c:if test="${login.lodging.equals('N') }">
								<a href="<%=request.getContextPath()%>/seller/sellerLodgingUp.do">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Waiting') }">
								<a href="javascript:alert('이미 숙소 승인을 요청하였습니다.');">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Y') }">
								<a href="<%=request.getContextPath()%>/seller/sellerRegi.do">객실관리</a>
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
    <input type="hidden" name="QnA_idx">
    <main  class=inner style="padding-top:115px;">
    	<form>
	        <div id="title">
	            <div id="title_date">
	                <a><%=qnaOne.getQna_Qtitle()%> </a>
	                <a> ${login.userName} <%=qnaOne.getQna_Qdate()%></a>
	            </div>
	            <hr>
	            <div id="content">
	                <a><%=qnaOne.getQna_Qcontent() %></a>
	            </div>
	            <hr>
	            <div id="change">
	            <span>답변처리중</span>
	            </div>
	        </div>
        </form>
        <form>
        </form>
        <div class="answer" style="display:none;">
            <input type="text" id="text">
            <input type="submit" id="insert" value="답변등록" onclick="document.querySelector('span').style.color='blue';
                document.querySelector('span').innerHTML='답변완료';">
        </div>
    </main>
    <footer>
        <div class="info">
            <ul>
                <li>(주)저긴어때</li>
                <li>대표 : 홍길동&nbsp;&nbsp;</li>
                <li>전라북도 전주시 덕진구 금암1동&nbsp;&nbsp;</li>
                <li>사업자등록번호 : 000-00-00000&nbsp;&nbsp;</li>
            </ul>
            <ul>
                <li>고객센터 : 1588-0000&nbsp;&nbsp;&nbsp;</li>
                <li>개인정보관리책임자 : 홍길동&nbsp;&nbsp;</li>
                <li>개인정보보유기간 : 3년</li>
            </ul>
            <div class="copyright">
                <h6>Copyright 2022. Team 저긴어때. all rights reserved.</h6>
            </div>
        </div>
    </footer>
</body>
</html>
