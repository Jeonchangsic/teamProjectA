<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약화면</title>
   <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reserv_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reserv_css/reserv.css">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> <!--XE아이콘-->


    <script>
        $(document).ready(function(){
            $(".search_btn").click(function(){
                $(".search_bar").toggleClass("view");
            });

            // swiper slide
            var swiper = new Swiper(".mySwiper", {
                // cssMode: true,
                navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
                },
                pagination: {
                el: ".swiper-pagination",
                },
                // mousewheel: true,
                keyboard: true,
            });
        });
    </script>
</head>
<body>
    <header>
        <div class="inner">
            <h1><a href="#"><img src="../jquery/logo.svg" alt="저긴어때"></a></h1>        
            <ul>
                <li>
                    <input type="search" class="search_bar">
                    <a href="#" class="search_btn"><i class="xi-search xi-1x search"></i></a>
                </li>                                                
            </ul>      
        </div>
    </header>
    <main>
        <div class="left">
            <h2>예약자 정보</h2>
            <p>예약자 이름</p>
            <input type="text" placeholder="체크인시 필요한 정보입니다">
            <p>휴대폰 번호<p>
            <input type="text" placeholder="체크인시 필요한 정보입니다">
            
            <div class="login">
                <a>로그인 후 이용가능합니다
                <br>
                <span>로그인></span>
                </a>
            </div> 
            <div class="pay">
                <h3>결제수단 선택</h3>
                <select id="payselect">
                    <option>카카오페이</option>
                    <option>토스</option>
                    <option>신용/체크카드</option>
                    <option>네이버페이</option>
                    <option>계좌이체</option>
                </select>
            </div>  
            <table class="agree">
                 <tr>
                     <td><input type="checkbox"></td>
                     <td>전체동의</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>숙소이용규칙 및 취소/환불규정동의</td>
                    <td>필수</td>
               </tr>
               <tr>
                    <td><input type="checkbox"></td>
                    <td>개인정보 수집 및 이용 동의</td>
                    <td>필수</td>
               </tr>
               <tr>
                    <td><input type="checkbox"></td>
                    <td>개인정보 제 3자 제공 동의</td>
                    <td>필수</td>
               </tr>
               <tr>
                    <td><input type="checkbox"></td>
                    <td>만 14세 이상 확인</td>
                    <td>필수</td>
               </tr>
            </table>
        </div>
        <div class="right">
            <section class="info">
                <p class="name">
                    <strong>숙소이름</strong><br>
                    호텔 크레센도 서울 
                </p>
                <p>
                    <strong>객실타입/기간</strong><br>
                    더블 / 1박 
                </p>
                <p>
                    <strong>체크인</strong><br>
                    10.25 화 15:00 
                </p>
                <p>
                    <strong>체크아웃</strong><br>
                    10.26 수 12:00 
                </p>
            </section>
            <hr>
            <section class="total">
                <p>
                    <strong><b>총 결제금액</b>(VAT)포함</strong>
                    <span class="in_price">150,000원</span>
                </p>
                <ul>
                    <li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                    <li>결제완료 후
                        <span>예약자 이름</span>
                        으로 바로
                        <span>체크인</span>
                        하시면 됩니다
                    </li>
                </ul>
            </section>
            <button>결제하기</button>
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