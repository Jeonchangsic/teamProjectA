<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="team.projectA.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 객실관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerRoomOK.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


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
                <li id="roomList"><a href="<%=request.getContextPath()%>/manager/managerRoom.do">숙소리스트</a></li>
                <li id="okList"><a href="<%=request.getContextPath()%>/manager/managerRoomOK.do">숙소승인</a></li>
            </div>
        </nav>
		<section>
			<h3>숙소요청목록</h3>
			<hr/>
				<table>
					<thead>
						<tr>
							<th>이미지</th>
							<th>숙소명</th>
							<th>숙소종류</th>
							<th>주소</th>
							<th>판매자아이디</th>
							<th>판매자이름</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${requestList}" varStatus="status">
						<form method="post">
							<input type="hidden" name="uidx" value="${vo.uidx}">							
							<input type="hidden" name="lidx" value="${vo.lidx}">
							<tr>
								<td><img src="<%=request.getContextPath()%>/resources/images/lodging_images/${vo.limagename}"></td>							
								<td>${vo.lodgingname}</td>
								<td style="text-align:center;">${vo.lodgingkind}</td>
								<td>${vo.lodgingaddr}</td>
								<td style="text-align:center;">${vo.userID}</td>
								<td style="text-align:center;">${vo.userName}</td>
								<td style="text-align:center;">
									<button value="승인" formaction="<%=request.getContextPath()%>/manager/requestApproval.do">승인</button>
									<button value="거부" formaction="<%=request.getContextPath()%>/manager/requestDel.do">거부</button>
								</td>
							</tr>
						</form>
					</c:forEach>
					</tbody>					
				</table>
		</section>
    </main>
</body>
<script>
    function deletFn(){
        alert('정말 삭제하시겠습니까?')
    }

</script>
</html>