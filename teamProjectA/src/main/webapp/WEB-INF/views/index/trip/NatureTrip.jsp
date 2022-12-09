<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/index_css/NatureTrip.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
</head>
<body>
    <header>
        <div id="header_view">
            <a href="<%=request.getContextPath()%>/index/index.do">&#60;</a>
            <span>청주 좌구산휴양림</span>
        </div>
    </header>
                            <!--end header-->

    <main>
        <img src="<%=request.getContextPath()%>/resources/images/index_images/trip1.jpg"/>
        <h4>청주 좌구산 자연휴양림</h4>
        <p>충청북도 증평군의 청정한 자연환경을 기반으로 새롭게 조성된 휴양림 입니다.<br>
             특히 자연친화적 개발공법을 적용하여 휴양림내 자연이 잘 보존되어 있습니다. <br>
             4인실 부터 15일실까지 준비 되어 있으며, 15인실은 황토방으로 만들어져 있습니다.</p>
            <br>
            <br>
            <br>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3198.591806409612!2d127.64725302695314!3d36.70834570000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3564e76fd76da423%3A0x63832e8cbad365da!2z7KKM6rWs7IKwIO2ctOyWkeuenOuTnCDsoozqtazsgrDsnpDsl7DtnLTslpHrprw!5e0!3m2!1sko!2skr!4v1666772786099!5m2!1sko!2skr" width="100%" height="170px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </main>
                            <!--end main-->
    
    <footer>
        <a href="https://www.foresttrip.go.kr/indvz/main.do?hmpgId=ID02030089"><span>휴양림 구경하러 가기</span></a>
    </footer>
                            <!-- end footer-->
</body>
</html>