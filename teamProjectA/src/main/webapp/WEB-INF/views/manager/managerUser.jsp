<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="team.projectA.vo.*" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 

List<UserVO> list = (List<UserVO>)request.getAttribute("list");
List<ReservVO> list1 = (List<ReservVO>)request.getAttribute("list1");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
                </ul>
            </div>
        </div>
    </div>
    <main class="inner">
        <nav>
            <div class="nav">
                <li id="user_list" onclick="click()">회원리스트</li>
                <li id="reserv_list" onclick="click()">예약내역</li>
                <li id="qna_list" onclick="click()">문의내역</li>
            </div>
        </nav>
       
        <div id="user_section">
            <h3>회원목록</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option value="id">아이디</option>
                            <option value="nickname">이름</option>
                            <option value="type">구분</option>
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
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>구분</th>
                </tr>
            </thead>
            <tbody>
            <%for(UserVO vo : list) {%>
                <tr style="text-align:center;">
                    <td><%=vo.getUserID() %></td>
                    <td><%=vo.getUserName() %></td>
                    <td><%=vo.getUserPhone() %></td>
                    <td><%=vo.getUserEmail() %></td>
                    <td><%=vo.getUserType() %></td>
                </tr>
              <%} %>  
            </tbody>
        </table>
       </div>
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
        <div id="qna_section">
            <h3>문의내역</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option value="nickname">일반회원</option>
                            <option value="nickname">업체회원</option>
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
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>답변여부</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    </main>
    <footer>

    </footer>
</body>
<script>
    $(document).ready(function(){
             $("#user_list").click(function(){
                 $("#user2_section, #reserv_section, #qna_section").css("display", "none");      
                 $("#user_section").css("display", "block");
                 $("#user_list").css("font-weight","bold")
                 $("#user2_list, #reserv_list, #qna_list").css("font-weight","normal")
             });
             $("#user2_list").click(function(){
                 $("#user_section, #reserv_section, #qna_section").css("display", "none");      
                 $("#user2_section").css("display", "block");
                 $("#user2_list").css("font-weight","bold")
                 $("#user_list, #reserv_list, #qna_list").css("font-weight","normal")
             });
             $("#reserv_list").click(function(){
                 $("#user_section, #user2_section, #qna_section").css("display", "none");      
                 $("#reserv_section").css("display", "block");
                 $("#reserv_list").css("font-weight","bold")
                 $("#user_list, #user2_list, #qna_list").css("font-weight","normal")
             });
             $("#qna_list").click(function(){
                 $("#user_section, #user2_section, #reserv_section").css("display", "none");      
                 $("#qna_section").css("display", "block");
                 $("#qna_list").css("font-weight","bold")
                 $("#user_list, #user2_list, #reserv_list").css("font-weight","normal")
             });
         })
 </script>
</html>