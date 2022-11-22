<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath() %>/resources/css/seller_css/sellerInfo.css" rel="stylesheet"/>
</head>
<body style="overflow-x: hidden">
	<header>
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
    </header>
    <main class="inner">
        <nav>
            <div class="nav">
                <li><a href="#">내정보</a></li>
            </div>
        </nav>
        <hr>
        <form>
            <table id="info_Area">
                <tr>
                    <td>아이디</td>
                    <td>홍길동</td>
                    <td></td>
                </tr>
                <tr>
                    <td>사업장명</td>
                    <td>전주더베이호텔</td>
                    <td><button onclick="location.href='sellerLodgingModify.do'" class="btn_size">상세변경</button></td>
                </tr>
                <tr>
                    <td>비밀번호변경</td>
                    <td>********</td>
                    <td></td>
                </tr>
                <tr>
                    <td>비밀번호확인</td>
                    <td>********</td>
                    <td><button type="submit" class="btn_size">변경</button></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>honggildong@naver.com</td>
                    <td><button type="submit" class="btn_size">변경</button></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>010-0000-0000</td>
                    <td><button type="submit" class="btn_size">변경</button></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>전주시 덕진구 금암동</td>
                    <td><button type="submit" class="btn_size">변경</button></td>
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
</html>
</body>
</html>