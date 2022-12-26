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
			<c:forEach var ="list" items="${qnalist}">
				<tr style="text-align:center;">
					<td><a href="managerQna.do?qna_idx=${list.qna_idx}">${list.qna_Qtitle}</a></td>
					<td>${list.userName}</td>
					<td>${list.qna_Qdate}</td>
					<td>${list.qna_Acheck}</td>
					<td>
					<c:choose>
						<c:when test = "${list.qna_Acheck == '답변처리중'}" >
						<button type="button" onclick="location.href='managerQnaView.do?qna_idx=${list.qna_idx}">답변등록</button>
						</c:when>
						<c:when test = "${list.qna_Acheck == '답변완료' and list.qna_Acheck == '답변완료'}" >
						<button type="button" onclick="alert('이미 답변을 작성하였습니다.')">답변완료</button>
						</c:when>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
            </tbody>
        </table>
        	<div id="paging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="<%=request.getContextPath() %>/manager/managerQnaList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>   
					    
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li><a href="<%=request.getContextPath() %>/manager/managerQnaList.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					      
					<c:if test="${pageMaker.next}">
						<li><a href="<%=request.getContextPath() %>/manager/managerQnaList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>   
				</ul>
			</div>
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