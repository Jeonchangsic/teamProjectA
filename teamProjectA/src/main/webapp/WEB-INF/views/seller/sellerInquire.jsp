<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매자페이지</title>
    <link href="<%=request.getContextPath()%>/resources/css/seller_css/sellerInquire.css" rel="stylesheet">
</head>
<body style="overflow-x: hidden">
    <div id="header">
        <div class="top">
            <h3>판매자페이지</h3>
            <div id="manager">
                <ul>
                    <li><a href="<%=request.getContextPath() %>/index/index.do">home</a></li>
                    <li><a href="<%=request.getContextPath() %>/seller/sellerInfo.do">내정보</a></li>
                    <li><a href="<%=request.getContextPath() %>/seller/sellerRegi.do">객실관리</a></li>
                    <li><a href="<%=request.getContextPath() %>/seller/sellerInquire.do">문의</a></li>
                </ul>
            </div>
        </div>
    </div>
    <main class="inner">
            <h3>문의하기</h3>
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option>날짜</option>
                            <option>제목</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="keyword" size="30">
                    </td>
                    <td>
                        <button class="btn" type="submit" name="submit">조회</button>
                    </td>
                </tr>
            </tbody>
        </form>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>번호</th>
                    <th>제목</th>
                    <th>문의날짜</th>
                    <th>답변여부</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td>1</td>
                    <td><a href="">test</a></td>
                    <td>2022-10-27</td>
                    <td>N</td>
                </tr>
                <tr style="text-align:center;">
                    <td>2</td>
                    <td><a href="">test</a></td>
                    <td>2022-10-25</td>
                    <td>Y</td>
                </tr>
                <tr style="text-align:center;">
                    <td>3</td>
                    <td><a href="">test</a></td>
                    <td>2022-10-23</td>
                    <td>N</td>
                </tr>
                <tr style="text-align:center;">
                    <td>4</td>
                    <td><a href="">test</a></td>
                    <td>2022-10-21</td>
                    <td>N</td>
                </tr>
                <tr style="text-align:center;">
                    <td>5</td>
                    <td><a href="">test</a></td>
                    <td>2022-10-10</td>
                    <td>N</td>
                </tr>
            </tbody>
        </table>
        <ul>
            <li id="in-line">
                <a href="">1</a>
            </li>
        </ul>
        <button onclick="location.href='sellerInquireWrite.do'" id="btn_right">문의쓰기</button>
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