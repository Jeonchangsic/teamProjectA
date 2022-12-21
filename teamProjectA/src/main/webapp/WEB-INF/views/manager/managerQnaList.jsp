<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="team.projectA.vo.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <% QnaVO qnaOne = (QnaVO)request.getAttribute("qnaOne"); %>
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerQnaList.css">
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
	                <li id="reserv_list" onclick="location.href='<%=request.getContextPath()%>/manager/managerReservList.do'">예약내역</li>
	                <li id="qna_list">문의내역</li>
            </div>
        </nav>	
        <div id="qna_section">
            <h3>문의내역</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select" name="searchType">
                            <option value="title">제목</option>
                            <option value="writer">작성자</option>
                            <option value="Acheck">답변여부</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="searchName" size="30">
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
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
			<%for(QnaVO vo2 : list2) {%>
				<tr style="text-align:center;">
					<td><a href="managerQna.do?qna_idx=<%=vo2.getQna_idx()%>"><%=vo2.getQna_Qtitle()%></a></td>
					<td><%=vo2.getUserName()%></td>
					<td><%=vo2.getQna_Qdate() %></td>
					<td><%=vo2.getQna_Acheck() %></td>
					<td>
					<% if (vo2.getQna_Acheck().equals("답변처리중")) { %>
						<button type="button" onclick="location.href='managerQnaView.do?qna_idx=<%=vo2.getQna_idx()%>'">답변등록</button>
					<% } else { %>
						<button type="button" onclick="alert('이미 답변을 작성하였습니다.')">답변완료</button>
					<% } %>
					</td>
				</tr>
			<%} %>
            </tbody>
        </table>
    </div>
    </main>
    <footer>

    </footer>
</body>
<script>
$("td:contains('답변처리중')").css({color:"red"});
$("td:contains('답변완료')").css({color:"blue"});
</script>
</html>