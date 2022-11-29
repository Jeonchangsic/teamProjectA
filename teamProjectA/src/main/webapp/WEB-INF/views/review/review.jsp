<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/review_css/review.css" rel="stylesheet"/>
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     <!-- 리뷰 content영역 글자 제한 js -->
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
                <!--end header-->

    <main>
        
        <div id="contentsArea">
            <form name="frm" action="<%=request.getContextPath() %>/review/review.do" method="POST">
                <table id="table1">
                	<tr>
                		<td class="margin1">작성자</td>
                		<td>
                			<input type="text" class="info" name="rvWriter" value="${login.userID}" readonly>
                		</td>
                	</tr>
                    <tr>
                        <td class="margin1">만족도</td>
                        <td>
                        	<select name="rvSatisfaction">
                        		<option value="10점">10점</option>
                        		<option value="20점">20점</option>
                        		<option value="30점">30점</option>
                        		<option value="40점">40점</option>
                        		<option value="50점">50점</option>
                        		<option value="60점">60점</option>
                        		<option value="70점">70점</option>
                        		<option value="80점">80점</option>
                        		<option value="90점">90점</option>
                        		<option value="100점">100점</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <td class="margin1">제목</td>
                        <td>
                        	<input type="text" class="info" name="rvTitle" placeholder="제목을 입력하세요.">
                        </td> 
                    </tr>
                    <tr>
                        <td id="margin1">리뷰 내용</td>
                        <td>
                            <textarea type="text" id="info" name="rvContent" cols="30" rows="10" placeholder="공백 포함 100자 이내 리뷰를 작성해주세요."></textarea>
                        	<div id="content_cnt">(0/100)</div>
                        </td>
                    </tr>
                </table>
                <table id="table2">
                    <tr>
                        <td>
                            <input type="submit" id="clearBtn" value="작성"/>
                        </td>
                    </tr>
                </table>
            </form>
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