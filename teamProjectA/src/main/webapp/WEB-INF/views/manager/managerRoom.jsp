<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="team.projectA.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 객실관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerRoom.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
	function roomCategoryChange(){
		alert("text");
		alert("<%=request.getContextPath()%>/manager/roomCategoryChange.do?lodgingID=");
		
		var lidx = $("#lidx").val();
		
		alert(lidx);
		
		
		$.ajax({
		
			url:"<%=request.getContextPath()%>/manager/roomCategoryChange.do?lidx="+lidx,
			type:"get",	
			dataType: "text",
			success:function(data){
				
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	}
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
        <div>
            <h3>객실추천등록</h3>
        </div>     
        <hr/>
        <form method="POST" >
        	<table>
        		<tr>
        			<th>
        				<label>숙소명</label>
        				<select name="lidx" id="lidx" onchange="roomCategoryChange()" class="lodgingCategory">
        					<option value="숙소선택">숙소선택</option>
        					<c:forEach var="vo" items="${lodgingCategory}" varStatus="status">
        						<option value="${vo.lidx}">${vo.lodgingname}</option>
        					</c:forEach>
        				</select>
        			</th>
        		</tr>
        		<tr>
        			<th>
        				<label>객실명</label>
        				<select class="roomCategory">
        					<option value="">객실명</option>
        				</select>
        			</th>
        		</tr>
        	</table>
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