<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 객실관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerRoom.css">

</head>
<body style="overflow-x: hidden">
    <div id="header">
        <div class="top">
            <h3>관리자페이지</h3>
            <div id="manager">
                <ul>
                    <li><a href="">home</a></li>
                    <li><a href="">회원관리</a></li>
                    <li><a href="">숙소관리</a></li>
                    <li><a href="">리뷰관리</a></li>
                </ul>
            </div>
        </div>
    </div>
    <main class="inner">
        <nav>
            <div class="nav">
                <li><a href="">숙소리스트</a></li>
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
                    <th>가격</th>
                    <th>상세관리</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td><img src="../jquery/호텔엔트라 강남.jpg" alt=""></td>
                    <td>호텔엔트라 강남</td>
                    <td>100,000~500,000</td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/파크하얏트서울.jpg" alt=""></td>
                    <td>파크하얏트 서울</td>
                    <td>50,000~800,000</td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/신라스테이역삼.jpg" alt=""></td>
                    <td>신라스테이 역삼</td>
                    <td>70,000~300,000</td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/리베라.jpg" alt=""></td>
                    <td>리베라</td>
                    <td>60,000~250,000</td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/호텔인나인 강남.jpg" alt=""></td>
                    <td>호텔인나인 강남</td>
                    <td>60,000~300,000</td>
                    <td>
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
            </tbody>
        </table>
        <ul>
            <li>
                <a href="">1</a>
            </li>
        </ul>
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