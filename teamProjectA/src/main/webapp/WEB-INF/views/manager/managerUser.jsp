<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@page import="team.projectA.vo.UserVO"%>
 <%@ page import="team.projectA.vo.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<% 

List<UserVO> list = (List<UserVO>)request.getAttribute("list");
List<ReservVO> list1 = (List<ReservVO>)request.getAttribute("list1");
List<QnaVO> list2 = (List<QnaVO>)request.getAttribute("list2");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자회원관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerUser.css">
<script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
</head>

<body style="overflow-x: hidden">
    <div id="header">
        <div class="top">
            <h3>관리자페이지</h3>
            <div id="manager">
            	<ul>
                    <li><a href="<%=request.getContextPath() %>/index/index.do">home</a></li>
                    <li><a href="<%=request.getContextPath() %>/manager/managerUser.do">회원관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/manager/managerRoom.do">숙소관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/manager/managerReview.do">리뷰관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/manager/managerFestival.do">등록관리</a></li>
                </ul>
            </div>
        </div>
    </div>
    <main class="inner">
        <nav>
            <div class="nav">
	                <li id="user_list" onclick="">회원리스트</li>
	                <li id="reserv_list" onclick="location.href='<%=request.getContextPath()%>/manager/managerReservList.do'">예약내역</li>
	                <li id="qna_list" onclick="location.href='<%=request.getContextPath()%>/manager/managerQnaList.do'">문의내역</li>
            </div>
        </nav>
     	
        <div id="user_section">
            <h3>회원목록</h3>
           
        <hr/>
     
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select" name="searchType">
                            <option value="id">아이디</option>
                            <option value="nickname">이름</option>
                            <option value="type">구분</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="keyword" id="keywordInput" value="" size="30">
                    </td>
                    <td>
                        <button class="btn" type="submit" id="searchBtn">검색</button>
                    </td>
                </tr>
            </tbody>
        </form>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>ID</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>구분</th>
                </tr>
            </thead>
            <tbody>
           	<c:forEach var="muser" items="${muserList}" varStatus="status">	
	                <tr style="text-align:center;">
	                    <td>${muser.userID}</td>
	                    <td>${muser.userName}</td>	
		                <td>${muser.userPhone}</td>
		                <td>${muser.userEmail}</td>
		                <td>${muser.userType}</td>
	                </tr>
             	</c:forEach>    
            </tbody>
        </table>
		<div id="paging" style="text-align:center;">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="<%=request.getContextPath() %>/manager/managerUser.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>   
					    
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li><a href="<%=request.getContextPath() %>/manager/managerUser.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					      
					<c:if test="${pageMaker.next}">
						<li><a href="<%=request.getContextPath() %>/manager/managerUser.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>   
				</ul>
			</div>
		</main>
</html>