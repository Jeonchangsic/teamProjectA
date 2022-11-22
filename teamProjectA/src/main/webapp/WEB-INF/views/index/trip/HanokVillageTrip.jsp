<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath() %>/resources/css/index_css/HanokVillage.css" rel="stylesheet"/>
    
</head>
<body>
    <header>
        <div id="header_view">
             <a href="<%=request.getContextPath()%>/index/index.do">&#60;</a>
            <span>전주 한옥마을</span>
        </div>
    </header>
                            <!--end header-->

    <main>
        <img src="<%=request.getContextPath() %>/resources/images/index_images/trip2.jpg"alt="즐길거리 이미지">
        <h4>전주 한옥마을</h4>
        <p>전주 풍남동 일대에 700여 채의 한옥이 군락을 이루고 있는 국내 최대 규모의 전통 한옥촌이며, 전국 유일의 도심 한옥군입니다. <br>
            1910년 조성되기 시작한 우리나라 근대 주거문화 발달과정의 중요한 공간으로, 경기전, 오목대, 향교 등 중요 문화재와 <br>
             20여개의 문화시설이 산재되어 있으며, 한옥, 한식, 한지, 한소리, 한복, 한방 등 韓스타일이 집약된 대한민국 대표 여행지입니다.</p>
            <br>
            <br>
            <br>
        <iframe id="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3235.39778629963!2d127.15044251576245!3d35.81471483024619!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3570236212eebd4b%3A0x8ef4be1bc6d0848e!2z7KCE7KO8IO2VnOyYpeuniOydhA!5e0!3m2!1sko!2skr!4v1666760520109!5m2!1sko!2skr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </main>
                            <!--end main-->
    
    <footer>
        <a href="http://hanok.jeonju.go.kr/"><span>한옥마을 구경하러 가기</span></a>
    </footer>
                            <!-- end footer-->
</body>
</html>