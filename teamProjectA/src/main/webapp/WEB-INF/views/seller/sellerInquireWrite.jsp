<%@page import="team.projectA.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath() %>/resources/css/seller_css/sellerInquireWrite.css" rel="stylesheet"/>
    
</head>
<body>
    <header>
        <div class="inner">
            <h1><a href="#"><img src="<%=request.getContextPath() %>/resources/images/index_images/logo.svg" alt="저긴어때"></a></h1>        
        </div>
        <h2>문의하기</h2>
    </header>
                <!--end header-->

    <main> 
        
        <div id="contentsArea">
            <form action = "sellerInquireWrite.do" method="post">
         	  <input type="hidden" name="usertype" value="${login.userType}">
                <table id="table1">
                    <tr>
                        <td class="margin1">제목</td>
                        <td><input type="text" class="info" name="qna_Qtitle" placeholder="제목을 입력하세요."></td>            
                    </tr>
                    <tr>
                        <td id="margin1">
                            문의 내용
                        </td>
                        <td>
                            <textarea type="text" id="info" name="qna_Qcontent" placeholder="문의를 작성하세요."></textarea>
                        </td>
                    </tr>
                </table>
                <table id="table2">
                    <tr>
                        <td>
                            <button id="clearBtn">저장</button>
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