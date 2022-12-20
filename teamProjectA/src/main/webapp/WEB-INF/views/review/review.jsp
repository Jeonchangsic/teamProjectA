<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath()%>/resources/css/review_css/review.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     <!-- 리뷰 content영역 글자 제한 -->
     <script>
     	$(document).ready(function(){
     		$("#info").on("keyup",function(){
     			$("#content_cnt").html("("+$(this).val().length+"/100)");
     			
     			if($(this).val().length > 100){
     				$(this).val($(this).val().substring(0,100));
     				$("#content_cnt").html("(100/100)");
     			}
     		});
     	});
     </script>
</head>
<body>
    <header>
        <h2>리뷰쓰기</h2>
    </header>
    <div id="headLine"></div>
                <!--end header-->

    <main>
        <div id="contentsArea">
            <form name="frm" action="<%=request.getContextPath() %>/review/review.do?lidx=${lidx}&ridx=${ridx}&reserv_idx=${reserv_idx}" method="POST">
                <table id="table1">
                	<tr>
                		<td class="td_vertical-align"><img id="review_Img" src="<%=request.getContextPath()%>/resources/images/lodging_images/${limagename}"/> </td>
                		<td class="td_vertical-align">
                			<div id="lodgingText">${lodgingname}</div>
                			<div id="rtypeText">[${rtype}]</div>
                			<div id="dateText">[${reserv_startDate}~${reserv_endDate}]</div>
                		</td>
                	</tr>
                	<tr>
                		<td class="tr_background"></td>
                		<td class="tr_background"></td>
                	</tr>
                    <tr>
                        <td class="margin2">만족도</td>
                        <td class="satisfactionStyle">
                        	<select id="selectStyle" name="rvSatisfaction" required>
                        		<option value="1.0점">1.0점</option>
                        		<option value="2.0점">2.0점</option>
                        		<option value="3.0점">3.0점</option>
                        		<option value="4.0점">4.0점</option>
                        		<option value="5.0점">5.0점</option>
                        		<option value="6.0점">6.0점</option>
                        		<option value="7.0점">7.0점</option>
                        		<option value="8.0점">8.0점</option>
                        		<option value="9.0점">9.0점</option>
                        		<option value="10.0점">10.0점</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td class="margin2"></td>
                        <td>
                        	
                        </td>
                    </tr>
                    <tr>
                        <td class="margin1">제목</td>
                        <td>
                        	<input type="text" class="info" name="rvTitle" placeholder="10자 이내 제목을 입력하세요." maxlength="10" required>
                        </td> 
                    </tr>
                    <tr>
                        <td id="margin1">리뷰 내용</td>
                        <td>
                            <textarea id="info" name="rvContent" cols="30" rows="10" placeholder="공백 포함 100자 이내 리뷰를 작성해주세요." required></textarea>
                        	<div id="content_cnt">(0/100)</div>
                        </td>
                    </tr>
                </table>
                <table id="table2">
                    <tr>
                        <td>
                            <input class="cursorStyle" type="submit" id="clearBtn" value="작성"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </main>
</body>
</html>