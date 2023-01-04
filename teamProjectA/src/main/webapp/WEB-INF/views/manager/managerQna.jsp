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
    <title>문의내용</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/qnaView.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</head>
<body>
  	 <div id="header">
        <div class="top">
            <h3>관리자페이지</h3>
            <div id="manager">
                    <li><a href="<%=request.getContextPath() %>/index/index.do">home</a></li>
                    <li><a href="<%=request.getContextPath() %>/manager/managerUser.do">회원관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/manager/managerRoom.do">숙소관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/manager/managerReview.do">리뷰관리</a></li>
            </div>
        </div>
    </div>
    <input type="hidden" name="uidx">
    <input type="hidden" name="QnA_idx">
    <main  class=inner style="padding-top:150px;">
    	<h2>문의글 상세화면</h2>
	    		<table>
	    		    <tr>
	    				<td>작성자</td>
	    				<td><%=qnaOne.getUserName() %></td>
	    				<td>작성일</td>
	    				<td><%=qnaOne.getQna_Qdate()%></td>
	    			</tr>
	    			<tr>
	    				<td>제목</td>
	    				<td><%=qnaOne.getQna_Qtitle()%></td>
	    			</tr>	
	    		</table>
		    	<div id="textA"><%=qnaOne.getQna_Qcontent()%></div>
		    	<form action="managerQna.do?qna_idx=${qnaOne.qna_idx}" method="POST">
			    	<div id="Atable">
						<p>관리자 답변</p>
						<input type="hidden" value="${qnaOne.qna_idx}" /> 
								<div><input type="hidden" id="qna_Acontent" name="qna_Acontent"></div>
								<input type="text" name="qna_Acontent" readonly value="${qnaOne.qna_Acontent }">								
							
					</div>		
			    	<div id="btn">
						<button type="button" onclick="location.href='managerQnaList.do?'">목록</button>
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