<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/review_css/review.css" rel="stylesheet"/>  <!-- css파일 새로 만들기  -->
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     
</head>
<body>
    <header>
        <h2>리뷰</h2>
    </header>
                <!--end header-->
    <main>
        <div id="contentsArea">
                <table id="table1">
                	<tr>
                		<td class="margin1">작성자</td>
                		<td>
                			<input type="text" class="info" value="${vo.userID}" readonly>
                		</td>
                	</tr>
                	<tr>
                		<td class="margin1">숙소명</td>
                		<td>
                			<input type="text" class="info" value="${vo.lodgingname}" readonly>
                		</td>
                	</tr>
                    <tr>
                        <td class="margin1">만족도</td>
                        <td>
                        	<select name="rvSatisfaction" readonly>
                        		<option value="${vo.rvSatisfaction}">${vo.rvSatisfaction}</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td class="margin1">제목</td>
                        <td>
                        	<input type="text" class="info" name="rvTitle" value="${vo.rvTitle}" readonly>
                        </td> 
                    </tr>
                    <tr>
                        <td id="margin1">리뷰 내용</td>
                        <td>
                            <textarea id="info" name="rvContent" cols="30" rows="10" readonly>${vo.rvContent}</textarea>
                        </td>
                    </tr>
                </table>
                <table id="table2">
                    <tr>
                        <td>
                            <button type="button" id="clearBtn" value="확인" onclick="location.href='<%=request.getContextPath()%>/mypage/info.do'">확인</button>
                            <button type="button" id="clearBtn" value="삭제" onclick="location.href='<%=request.getContextPath()%>/mypage/reviewDt.do?rvidx=${vo.rvidx}'">삭제</button>
                        </td>
                    </tr>
                </table>
        </div>
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
</html>