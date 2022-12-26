<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ page import="java.util.*" %>
  <%@page import="team.projectA.vo.ReviewVO"%>
  <%
  	List<ReviewVO> rlist = (List<ReviewVO>)request.getAttribute("rlist");
    ReviewVO rvo = (ReviewVO)request.getAttribute("rvo"); 
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 리뷰</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerReview.css">
<script>	
	/*리뷰삭제*/  
	
	function delFn() {
		
			};


</script>
  
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
            <div>
                <h3>리뷰관리</h3>
            </div>     
            <hr/>
            <form>
                <tbody>
                    <tr>
                        <td>
                            <select class="frm_select">
                                <option value="nickname">제목</option>
                                <option value="nickname">아이디</option>
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
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="rev" items="${rlist}" varStatus="status">
                    <tr style="text-align:center;">                       
                        <td>${rev.userID }</td>
                        <td><a href="<%=request.getContextPath()%>/manager/managerRinfo.do?rvidx=${rev.rvidx}">${rev.rvTitle}</a></td>
                        <td>${rev.userName}</td>
						<td>${rev.rvDate}</td>
                    </tr>
                    </c:forEach>  
                </tbody>
            </table>
        </main>
        <footer>

        </footer>
</body>
</html>