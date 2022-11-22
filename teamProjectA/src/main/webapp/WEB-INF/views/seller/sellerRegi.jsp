<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 객실등록</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/seller_css/sellerRegi.css">
<script src="https://ajax.googleapis.com/resources/css/3.6.1/jquery.min.js"></script>
</head>
<body style="overflow-x: hidden">
    <div id="header">
        <div class="top">
            <h3>판매자페이지</h3>
            <div id="manager">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/index/index.do">home</a></li>
                    <li><a href="<%=request.getContextPath()%>/seller/sellerInfo.do">내정보</a></li>
                    <li><a href="">객실관리</a></li>
                    <li><a href="<%=request.getContextPath()%>/seller/sellerInquire.do">문의</a></li>
                </ul>
            </div>
        </div>
    </div>
    <main class="inner">
        <nav>
            <div class="nav">
                <li><a href="">객실관리</a></li>
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
                <tr style="text-align:center;">
                    <td><img src="../jquery/객실이미지.jpg" alt=""></td>
                    <td>a-test</td>
                    <td>100,000원</td>
                    <td>3개</td>
                    <td>
                        <input type="button"value="수정">
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/객실이미지.jpg" alt=""></td>
                    <td>b-test</td>
                    <td>100,000원</td>
                    <td>1개</td>
                    <td>
                        <input type="button"value="수정">
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/객실이미지.jpg" alt=""></td>
                    <td>c-test</td>
                    <td>100,000원</td>
                    <td>1개</td>
                    <td>
                        <input type="button"value="수정">
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/객실이미지.jpg" alt=""></td>
                    <td>d-test</td>
                    <td>100,000원</td>
                    <td>1개</td>
                    <td>
                        <input type="button"value="수정">
                        <input type="button"value="삭제" onclick="deletFn()">
                    </td>
                </tr>
                <tr style="text-align:center;">
                    <td><img src="../jquery/객실이미지.jpg" alt=""></td>
                    <td>e-test</td>
                    <td>100,000원</td>
                    <td>2개</td>
                    <td>
                        <input type="button"value="수정">
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
        <div class="info">
            <ul>
                <li>(주)저긴어때</li>
                <li>대표 : 홍길동&nbsp;&nbsp;</li>
                <li>전라북도 전주시 덕진구 금암1동&nbsp;&nbsp;</li>
                <li>사업자등록번호 : 000-00-00000&nbsp;&nbsp;</li>
            </ul>
            <ul>
                <li>고객센터 : 1588-0000&nbsp;&nbsp;&nbsp;</li>
                <li>개인정보관리책임자 : 홍길동&nbsp;&nbsp;</li>
                <li>개인정보보유기간 : 3년</li>
            </ul>
            <div class="copyright">
                <h6>Copyright 2022. Team 저긴어때. all rights reserved.</h6>
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