<%@page import="team.projectA.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/seller_css/sellerInquireWrite.css" rel="stylesheet"/>
        <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    
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
							href="<%=request.getContextPath()%>/seller/sellerInfo.do">마이페이지</a></li>
						<li>
							<c:if test="${login.lodging.equals('N') }">
								<a href="<%=request.getContextPath()%>/seller/sellerLodgingUp.do">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Waiting') }">
								<a href="javascript:alert('이미 숙소 승인을 요청하였습니다.');">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Y') }">
								<a href="<%=request.getContextPath()%>/seller/sellerRegi.do">숙소관리</a>
							</c:if>
						</li>
						<li><a
							href="<%=request.getContextPath()%>/seller/sellerInquire.do">문의</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
                <!--end header-->

    <main>       
        <div id="contentsArea">
            <form action = "sellerInquireWrite.do" method="post">
         	  <input type="hidden" name="usertype" value="${login.userType}">
         	  <h3>문의하기</h3>
                <table id="table1">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" class="info" name="qna_Qtitle" placeholder="제목을 입력하세요." required></td>            
                    </tr>
                    <tr>
                        <td id="margin1">
                         	   문의 내용
                        </td>
                        <td>
                            <textarea id="info" name="qna_Qcontent" placeholder="문의를 작성하세요." required></textarea>
                        </td>
                    </tr>
                </table>
                <button id="clearBtn">저장</button>
            </form>
        </div>
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