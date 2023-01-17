<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저긴어때</title>
<!-- 파비콘 -->
<link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/sellerRegi.css">
<script src="https://ajax.googleapis.com/resources/css/3.6.1/jquery.min.js"></script>
<script>
	function lodelFn() {
		
		if(!confirm("정말로 해당 숙소를 삭제하시겠습니까?")){
			alert("삭제가 취소되었습니다.");
		}else{
			let f = document.createElement('form');
			
			let obj1;
			obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden');
			obj1.setAttribute('name', 'lidx');
			obj1.setAttribute('value', '${lodging2.lidx}');
			
			let obj2;
			obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden');
			obj2.setAttribute('name', 'uidx');
			obj2.setAttribute('value', '${lodging2.uidx}');
			
			f.appendChild(obj1);
			f.appendChild(obj2);
			f.setAttribute('method', 'post');
			f.setAttribute('action', 'sellerRegi.do');
			document.body.appendChild(f);
			f.submit();
		}
	}
	
	function lodelFn2(){
		alert("객실을 보유한 상태로 삭제할 수 없습니다.")
	}
	
</script>
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
    <main class="inner">
        <nav>
            <div class="nav">
                <h3>숙소정보</h3>
                <div id="info">
					<div><img src="<%=request.getContextPath()%>/resources/images/lodging_images/${lodging2.limagename}"/></div>
					<div id="lodgingName">${lodging2.lodgingname}</div>
					<div><button type="button" value="숙소수정" onclick="location.href='sellerLodgingModify.do?lidx=${lodging2.lidx}'">수정</button></div>
						<c:if test = "${ridxone[0].ridx == null || ridxone[0].ridx == ''}"> <!--foreach쓰면 객실수대로 삭제버튼이 늘어남 -->
							<div><button type="button" onclick="lodelFn()">삭제</button></div> 
						</c:if>
						<c:if test = "${ridxone[0].ridx != null && ridxone[0].ridx != ''}">
							<div><button type="button" onclick="lodelFn2()">삭제</button></div>
						</c:if> 
				</div>
            </div>
        </nav>
        <div>
            <h3>객실목록</h3>
            <a href="<%=request.getContextPath() %>/seller/sellerRoomup1.do"><input type="button" value="객실등록"></a>
        </div>     
        <hr/>
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

				<c:forEach  items="${roomlist}" var="vo">
					<c:choose>
						<c:when test = "${vo.rprice != 0 and vo.rnum != 0}">

							<tr style="text-align:center;">
								<td><img src="<%= request.getContextPath()%>/resources/images/lodging_images/${vo.rimage1}" alt="숙소 이미지"></td>
								<td>${vo.rtype}</td>
								<td>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.rprice}" />원
								</td>
								<td>${vo.rnum}</td>
								<td>
									<button type="button" value="수정" onclick="location.href='sellerRoomup2.do?ridx=${vo.ridx}'">수정</button>
									<button type="button" onclick="delFn(${vo.ridx})">삭제</button>
								</td>  			 
							</tr>
							<script>
								//객실 삭제 안내	 vo. 를 써야하기 때문에 jsp안에서 스크립트씀
								function delFn(ridx2) {					
									if (!confirm("해당 객실을 삭제하시겠습니까?")) {
										alert("삭제가 취소되었습니다.");
									} else {
							/* 			alert("삭제가 완료되었습니다."); */
										let r = document.createElement('form');	
							
										let obj;
										obj = document.createElement('input');
										obj.setAttribute('type', 'hidden');
										obj.setAttribute('name', 'ridx');
										obj.setAttribute('value', ridx2);
										
										r.appendChild(obj);
										r.setAttribute('method', 'post');
										r.setAttribute('action', 'sellerRegi2.do');
										document.body.appendChild(r);
										r.submit();

									}
								}
		
							</script>
	 					</c:when>
	 					<c:when test = "${vo.rprice == 0 and vo.rnum == 0}">
		 					<tr>
		 						<td></td>
		 						<td></td>
		 						<td colspan="2" >객실을 등록해 주세요</td>
		 						<td></td>
		 						<td></td>
		 					</tr>
	 					</c:when>
 					</c:choose>   
				</c:forEach>
			</tbody>
			
		</table>	
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