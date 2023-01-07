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
    <link href="<%=request.getContextPath()%>/resources/css/review_css/reviewInfo.css" rel="stylesheet"/>  
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     
</head>
<body>
    <header>
        <h2>리뷰내역</h2>
    </header>
    <div id="headLine"></div>
                <!--end header-->
    <main>
        <div id="contentsArea">
                <table id="table1">
                	<tr>
                		<td class="td_vertical-align"><img id="review_Img" src="<%=request.getContextPath()%>/resources/images/lodging_images/${limagename}"/> </td>
                		<td class="td_vertical-align td_padding">
                			<div id="lodgingText">${vo.lodgingname}</div>
                			<div id="rtypeText">[${vo.rtype}]</div>
                			<div id="reservDate">[${startDate}~${endDate}]</div>
                		</td>
                	</tr>
                	<tr>
                		<td class="tr_background"></td>
                		<td class="tr_background"></td>
                	</tr>
                    <tr>
                        <td class="margin2">만족도</td>
                        <td class="satisfactionStyle td_padding">
                        <c:choose>
                            <c:when test="${vo.rvSatisfaction == 5.0}">
                                    	<p class="star">&#9733;&#9733;&#9733;&#9733;&#9733;</p> 
                        	</c:when>
                        	<c:when test="${vo.rvSatisfaction == 4.9 ||vo.rvSatisfaction == 4.8||vo.rvSatisfaction == 4.7||vo.rvSatisfaction == 4.6||vo.rvSatisfaction == 4.5||vo.rvSatisfaction == 4.4||vo.rvSatisfaction == 4.3||vo.rvSatisfaction == 4.2||vo.rvSatisfaction == 4.1||vo.rvSatisfaction == 4.0}">
                                    	<p class="star">&#9733;&#9733;&#9733;&#9733;</p> 
                        	</c:when>
                        	<c:when test="${vo.rvSatisfaction == 3.9 ||vo.rvSatisfaction == 3.8||vo.rvSatisfaction == 3.7||vo.rvSatisfaction == 3.6||vo.rvSatisfaction == 3.5||vo.rvSatisfaction == 3.4||vo.rvSatisfaction == 3.3||vo.rvSatisfaction == 3.2||vo.rvSatisfaction == 3.1||vo.rvSatisfaction == 3.0}">
                                    	<p class="star">&#9733;&#9733;&#9733;</p> 
                        	</c:when>
                        	<c:when test="${vo.rvSatisfaction == 2.9 ||vo.rvSatisfaction == 2.8||vo.rvSatisfaction == 2.7||vo.rvSatisfaction == 2.6||vo.rvSatisfaction == 2.5||vo.rvSatisfaction == 2.4||vo.rvSatisfaction == 2.3||vo.rvSatisfaction == 2.2||vo.rvSatisfaction == 2.1||vo.rvSatisfaction == 2.0}">
                                    	<p class="star">&#9733;&#9733;</p> 
                        	</c:when>
                        	<c:otherwise>
                        		<p class="star">&#9733;</p> 
                        	</c:otherwise>
                    	</c:choose>   
                        </td>
                    </tr>
                    <tr>
                        <td class="margin1">제목</td>
                        <td class="td_padding">
                        	<input type="text" class="info" name="rvTitle" value="${vo.rvTitle}" readonly>
                        </td> 
                    </tr>
                    <tr>
                        <td id="margin1" class="vertical_middle">리뷰 내용</td>
                        <td class="td_padding vertical_middle">
                            <textarea id="info" name="rvContent" cols="30" rows="10" readonly>${vo.rvContent}</textarea>
                        </td>
                    </tr>
                </table>
                <table id="table2">
                    <tr>
                        <td>
                            <button type="button" class="clearBtn cursorStyle" value="확인" onclick="window.close();">확인</button>
                            <button type="button" class="clearBtn cursorStyle" value="삭제" onclick="location.href='<%=request.getContextPath()%>/mypage/reviewDt.do?rvidx=${vo.rvidx}'">삭제</button>
                        </td>
                    </tr>
                </table>
        </div>
    </main>
</body>
</html>