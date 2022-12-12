<%@page import="team.projectA.vo.RoomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% List<RoomVO> roomlist =  (List<RoomVO>)request.getAttribute("roomlist"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 객실등록</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/sellerRegi.css">
<script src="https://ajax.googleapis.com/resources/css/3.6.1/jquery.min.js"></script>

</head>
<body style="overflow-x: hidden">
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
    <main class="inner">
        <nav>
            <div class="nav">
                <li><a href="">객실관리</a></li>
            </div>
        </nav>
        <div>
            <h3>객실목록</h3>
            <a href="<%=request.getContextPath() %>/seller/sellerRoomup1.do"><input type="button" value="객실등록"></a>
        </div>     
        <hr/>
        <form action="sellerRegi.do"method="post">

	        <table>
	            <thead>
	                <tr style="text-align:center;">
	                    <th>이미지</th>
	                    <th>객실명</th>
	                    <th>가격</th>
	                    <th>객실수</th>
	                    <th>상세관리</th>
	                </tr>
	            </thead>
	            <tbody>
	            <% for(RoomVO room : roomlist) {%>
	                <tr style="text-align:center;">
	             		<td><img src="<%= request.getContextPath()%>/resources/images/lodging_images/<%=room.getRimage1()%>" alt="숙소 이미지"></td>
	                    <td><%=room.getRtype() %></td>
	                    <td><%=room.getRprice() %></td>
	                    <td><%=room.getRnum()%></td>
	                    <td>
	                       <button type="button" value="수정" onclick="location.href='sellerRoomup2.do?ridx=<%=room.getRidx()%>'">수정</button>
	                       <button type="button" onclick="delFn()">삭제</button>
	                    </td>  
	                    <!--객실 삭제 안내 -->
	                    <script>
						function delFn() {
						    if (!confirm("해당 객실을 삭제하시겠습니까?")) {
						        alert("삭제가 취소되었습니다.");
						    } else {
						        alert("삭제가 완료되었습니다.");
						        location = "sellerRegi2.do?ridx=<%=room.getRidx()%>";
						    }
						}
						</script>
	                </tr>
	             <%} %>         
	            </tbody>
	        </table>
        </form>

        <ul>
            <li>
                <a href="">1</a>
            </li>
        </ul>
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