<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.*" %>
<%@ page import="team.projectA.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%
	RoomVO rvo = (RoomVO)request.getAttribute("rvo");
 %>
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
	 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	 

  <script>
        
    IMP.init("imp07081518"); 

    function requestPay() {
    	var fromDate = $(".fromDate").val();
    	var toDate = $(".toDate").val();
        IMP.request_pay({
            pg : 'html5_inicis',  // PG사 선택
            pay_method : 'card', // 지불 수단
            merchant_uid: 'R_' + new Date().getTime(), 
            name : '<%=rvo.getLodgingname()%>', 
            amount :'<%=rvo.getRprice()%>', //가격 
            buyer_email : '${login.userEmail}', //구매자이메일
            buyer_name : '${login.userName}', // 구매자 이름
            buyer_tel : '${login.userPhone}', // 구매자 연락처 
           
        }, 
            
        	function (rsp) { // callback
            if (rsp.success) {//결제성공시
            	var msg = '결제가 완료되었습니다.';
            	 msg += '고유ID : ' + rsp.imp_uid ;
                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                 msg += '결제 금액 : ' + rsp.paid_amount;
                 msg += '카드 승인번호 : ' + rsp.apply_num;
                 msg += '숙소이름 : ' + rsp.name;
                 msg += '구매자이름 :' + rsp.buyer_name;
                 $.ajax({
                	 url:"reserv_pay.do?ridx=<%=rvo.getRidx()%>&fromDate=${fromDate}&toDate=${toDate}",
                	 method:"post",
                	 data:{
                		 "merchant_uid": rsp.merchant_uid
                	 } 
                 });
                 location.href ="<%=request.getContextPath()%>/mypage/info.do";
            } else {//결제실패시
            	 var msg = '결제에 실패하였습니다.';
                 msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
        
		
    }
</script>
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

        //약관동의
        $(document).ready(function() {
			$("#checkall").click(function() {
				if($("#checkall").is(":checked")) $("input[name=check]").prop("checked", true);
				else $("input[name=check]").prop("checked", false);
			});
			
			$("input[name=check]").click(function() {
				var total = $("input[name=check]").length;
				var checked = $("input[name=check]:checked").length;
				
				if(total != checked) $("#checkall").prop("checked", false);
				else $("checkall").prop("checked", true); 
			});
		});
        function check(){
         if($("#checkall").is(":checked")) $("#nofont").css("display","none");
            else $("#nofont").show()       
         if($("#checkall").is(":checked")) $("#nofont1").css("display","none");
            else $("#nofont1").show() 
         if($("#checkall").is(":checked")) $("#nofont2").css("display","none");
            else $("#nofont2").show() 
         if($("#checkall").is(":checked")) $("#nofont3").css("display","none");
         else $("#nofont3").show() 
        }        
    </script>
   
</head>
<body>
    <header>
        <div class="inner">
            <h1><a href="<%=request.getContextPath() %>/index/index.do"><img src="<%=request.getContextPath() %>/resources/images/login_images/logo.svg" alt="저긴어때" ></a></h1>        
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
            <a>${login.userName}</a>
            <p>휴대폰 번호<p>
            <a>${login.userPhone}</a>
            
            <div class="login">
                <a>
					<img src="<%=request.getContextPath() %>/resources/images/login_images/logo.svg" alt="저긴어때" >      
                </a>
            </div> 
            <h3>약관동의</h3>
            <table class="agree">
                 <tr>
                     <td><input type="checkbox" id="checkall" onclick="check()"></td>
                     <td>전체동의</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="check" onclick="check()"></td>
                    <td>숙소이용규칙 및 취소/환불규정동의</td>
                    <td id="nofont">필수!</td>
               </tr>
               <tr>
                    <td><input type="checkbox" name="check" onclick="check()"></td>
                    <td>개인정보 수집 및 이용 동의</td>
                    <td id="nofont1">필수!</td>
               </tr>
               <tr>
                    <td><input type="checkbox" name="check" onclick="check()"></td>
                    <td>개인정보 제 3자 제공 동의</td>
                    <td id="nofont2">필수!</td>
               </tr>
               <tr>
                    <td><input type="checkbox" name="check" onclick="check()"></td>
                    <td>만 14세 이상 확인</td>
                    <td id="nofont3">필수!</td>
               </tr>
            </table>
        </div>
        <div class="right">
            <section class="info">
                <p class="name">
                    <strong>숙소이름</strong><br>
						<%=rvo.getLodgingname() %>
                </p>
                <p>
                    <strong>객실타입/인원</strong><br>
                    	<%=rvo.getRtype() %>/2인
                </p>
                <p>
                    <strong class="fromDate">체크인</strong><br>
                    	${fromDate}
                </p>
                <p>
                    <strong class="toDate">체크아웃</strong><br>
                    	${toDate}
                </p>
            </section>
            <hr>
            <section class="total">
                <p>
                    <strong><b>총 결제금액</b>(VAT)포함<br></strong>
                    <span class="in_price" ><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=rvo.getRprice() %>" />원</span>
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
            <button onclick="requestPay()">결제하기</button> 
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