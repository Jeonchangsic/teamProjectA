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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerRoom.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
	//인기추천 숙소등록 select박스에 숙소명 나타내기
	function roomCategoryChange(){
	//	alert("text");
	<%-- 	alert("<%=request.getContextPath()%>/manager/roomCategoryChange.do?lodgingID="); --%>
		
		var lidx = $("#lidx").val();
		var roomChange = $("#roomChange").val(); //옵션태그를 append할 select의 val
		
		//alert(lidx);
		
		
		$.ajax({
		
			url:"<%=request.getContextPath()%>/manager/roomCategoryChange.do?lidx="+lidx,
			type:"get",	
			dataType: "json",
			success:function(data){
				//item.rtype
				
				var roomList = "";	
				var roomPrice = "";
				
				$.each(data, function (i, item) {
                    /* var option =  */
                    roomList+="<option data-roomprice='"+item.rprice+"'>"+item.rtype+"</option>";
                     
                    
                });
				//인기추천 숙소등록 select박스에 숙소에 맞는 객실명 나타내기
			  $("#roomChange").html(roomList).ready(function(){
				  var price = data[0].rprice;
				  
				  $("#firstOptionTag").val(price);
				  $("#firstOptionTag").html(price);
			  });
			  
			 
			  
			 
				
				
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	}//인기추천 숙소등록 select박스에 객실에 맞는 가격 나타내기
	function roomPrice(){
		
		roomprice = $("#roomChange option:selected").data("roomprice"); //데이터 읽기
		/* console.log(roomprice); */
		$("#priceChange").html("<option>"+roomprice+"</option>");
		
	}
	//인기추천 숙소등록 이미지 select박스 value에 맞는 이미지 나타내기 
	$(document).ready(function(){
	$("#lodgingImg").change(function(){
		if($(this).val() == "jeolla_1.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_1.jpg");
		}else if($(this).val() == "jeolla_2.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_2.jpg");
		}else if($(this).val() == "jeolla_3.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_3.jpg");
		}else if($(this).val() == "jeolla_4.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_4.jpg");
		}else if($(this).val() == "jeolla_5.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_5.jpg");
		}else if($(this).val() == "jeolla_6.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeolla_6.jpg");
		}else if($(this).val() == "jeju_1.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeju_1.jpg");
		}else if($(this).val() == "jeju_2.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeju_2.jpg");
		}else if($(this).val() == "jeju_3.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeju_3.jpg");
		}else if($(this).val() == "jeju_4.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/jeju_4.jpg");
		}else if($(this).val() == "busan_1.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/busan_1.jpg");
		}else if($(this).val() == "busan_2.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/busan_2.jpg");
		}else if($(this).val() == "busan_3.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/busan_3.jpg");
		}else if($(this).val() == "busan_4.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/busan_4.jpg");
		}else if($(this).val() == "busan_5.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/busan_5.jpg");
		}else if($(this).val() == "seoul_1.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/seoul_1.jpg");
		}else if($(this).val() == "seoul_2.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/seoul_2.jpg");
		}else if($(this).val() == "seoul_3.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/seoul_3.jpg");
		}else if($(this).val() == "seoul_4.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/seoul_4.jpg");
		}else if($(this).val() == "seoul_5.jpg"){
			$("#lodgingImgArea").attr("src","<%=request.getContextPath()%>/resources/images/lodging_images/seoul_5.jpg");
		}
		
		});
	})
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
        <nav>
            <div class="nav">
                <li><a href="">숙소리스트</a></li>
                <li><a href="">숙소승인</a></li>
                <li><a href="">객실추천등록</a></li>
            </div>
        </nav>
        <div>
            <h3>숙소목록</h3>
        </div>     
        <hr/>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>이미지</th>
                    <th>숙소명</th>
                    <th>구분</th>
                    <th>상세관리</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
            </tbody>
        </table>
        
		<section>
			<h3>숙소요청목록</h3>
			<hr/>
				<table>
					<thead>
						<tr>
							<th></th>
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
        
        <div>
            <h3>객실추천등록</h3>
        </div>     
        <hr/>
        <form action="" method="POST" > <!--  ************************************** -->
        	<div style="border:1px solid #000;">
	        	<table id="lodgingRegistration">
	        		<tr>
	        			<th>
	        				<label>숙소선택</label>
	        				<select name="lidx" id="lidx" onchange="roomCategoryChange()" class="lodgingCategory" style="width:243px;">
	        					<option id="lodgingOption" value="숙소선택">숙소선택</option>
	        					<c:forEach var="vo" items="${lodgingCategory}" varStatus="status">
	        						<option value="${vo.lidx}">${vo.lodgingname}</option>
	        					</c:forEach>
	        				</select>
	        			</th>
	        		</tr>
	        		<tr>
	        			<th>
	        				<label>객실명</label>
	        				<select id="roomChange" class="roomCategory" onchange="roomPrice()" style="width:243px;">
	        					<option>객실선택</option>
	        				</select>
	        			</th>
	        		</tr>
	        		<tr>
	        			<th>
	        				<label>가격</label>
	        				<select id="priceChange" class="roomCategory" style="width:243px;">
	        					<option id="firstOptionTag">가격</option>
	        				</select>
	        			</th>
	        		</tr>
	        		<tr>
	        			<th>
	        				<label>이미지</label>
	        				<select id="lodgingImg" class="roomCategory" style="width:243px;">
	        					<option value="이미지선택">이미지선택</option>
	        				<c:forEach var="vo" items="${lodgingCategory}" varStatus="status">
	        					<option value="${vo.limagename}">${vo.limagename}</option>
	        				</c:forEach>
	        				</select>
	        			</th>
	        		</tr>
	        	</table>
	        	<img id="lodgingImgArea" src="<%=request.getContextPath()%>/resources/images/lodging_images/whiteBackground.jpg" style="width:300px; height:200px;"/>
	        	<button style="display:block;">등록</button>
	        </div>	
        </form>
    </main>
    <footer>
        <div id="foot">
            
            <br>
            <br>
            <div id="copy">
                (주)저긴어때 l 
                대표이사 : 홍이젠 l
                사업자 등록번호 : 104-14-100400 l
                메일 : Whatdoyouthink@naver.com <br>
                주소 : 전라북도 전주시 덕진구 금암1동 667-52 5층 l
                전화번호 : 063-104-1004 (오전 9시 ~ 오후 5시)<br>
                <br>
                Copyright WD COMPANY Corp. All rights reserved.
                <br>
                <br>
                
            </div>
        </div>
    </footer>
</body>
<script>
    function deletFn(){
        alert('정말 삭제하시겠습니까?')
    }

</script>
</html>