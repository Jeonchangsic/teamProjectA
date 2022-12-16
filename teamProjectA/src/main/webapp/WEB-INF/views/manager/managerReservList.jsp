<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="team.projectA.vo.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<% 

List<UserVO> list = (List<UserVO>)request.getAttribute("list");
List<ReservVO> list1 = (List<ReservVO>)request.getAttribute("list1");
List<QnaVO> list2 = (List<QnaVO>)request.getAttribute("list2");

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자회원관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerReservList.css">
<script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
</head>

<body style="overflow-x: hidden">
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
    <main class="inner">
        <nav>
            <div class="nav">
	                <li id="user_list" onclick="location.href='<%=request.getContextPath()%>/manager/managerUser.do'">회원리스트</li>
	                <li id="reserv_list" onclick="">예약내역</li>
	                <li id="qna_list" onclick="location.href='<%=request.getContextPath()%>/manager/managerQnaList.do'">문의내역</li>
            </div>
        </nav>

        <div id="reserv_section">
            <h3>예약내역</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option value="id">아이디</option>
                            <option value="nickname">예약번호</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="keyword" size="30">
                    </td>
                    <td>
                        <button class="btn" type="submit" name="submit">검색</button>
                    </td>
                </tr>
            </tbody>
        </form>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>ID</th>
                    <th>이름</th>
                    <th>예약숙소</th>
                    <th>예약번호</th>
                    <th>예약일시</th>	
                </tr>
            </thead>
            <tbody>
				 <%for(ReservVO vo1 : list1) {%>
                <tr style="text-align:center;">
                    <td><%=vo1.getUserID()%></td>
                    <td><%=vo1.getUserName() %></td>
                    <td><%=vo1.getLodgingname() %></td>
                    <td><%=vo1.getReserv_num()%></td>
                    <td><%=vo1.getReserv_date()%></td>
                </tr>
              <%} %>
            </tbody>
        </table>
    </div>
    
    </main>
    <footer>

    </footer>
</body>

</html>