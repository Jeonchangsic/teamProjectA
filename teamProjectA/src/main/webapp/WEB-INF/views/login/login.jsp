<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/login_css/login.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    
    <!-- 비밀번호 찾기 팝업창 -->
    <script>
     function pwSearch(){
    	var url = "<%=request.getContextPath()%>/login/pwSearch.do";   //팝업창 페이지 URL
 		var winWidth = 500;
 	    var winHeight = 250;
 	  	var popupX = (window.screen.width / 2) - (500 / 2);
 	  	var popupY= (window.screen.height / 2) - (250 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
    </script>
</head>
<body>
    <header>
        <h2>
        	<a href="<%=request.getContextPath()%>/index/index.do">
        	<img id="img_Style" src="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg">
        	</a>
        </h2>
    </header>

            <!--end header-->

    
    <main>
        <form name="frm" action="login.do" method="post">
        <table id="table1">
            <tr>
                <td id="textArea">
                    <input type="text" class="loginInputArea font_Style" name="userID" placeholder="아이디를 입력하세요.">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="password" class="loginInputArea font_Style" name="userPassword" placeholder="비밀번호를 입력하세요.">
                </td>
            </tr>
            <tr>
                <td id="loginbtn">
                    <input type="submit" id="login" class="font_Style" value="로그인"/>
                </td>
            </tr>
        </table>
        <table id="table2">
            <tr>
                <td>
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=227a905a07d7faec4ff2683045c19574&redirect_uri=http://localhost:8080/A/auth/kakao/callback&response_type=code" id="kakao">  <!--카카오 로그인 링크-->
                        <img id="img1"src="<%=request.getContextPath() %>/resources/images/login_images/kakao_login_medium_narrow.png" width="255" height="45" >
                    </a>
                </td>
            </tr>
        </table>
        </form>
        <section id="join">
            <span id="join3" class="font_Style">저긴어때와 함께하기</span> 
            <a href="<%=request.getContextPath() %>/join/join.do" id="join1" class="font_Style">일반회원</a>
            <a href="<%=request.getContextPath() %>/join/sellerJoin.do" id="join2" class="font_Style">판매자회원</a>
        	<p id="p1">비밀번호가 기억나지 않으세요?</p>
        	<span id="span2" onclick="pwSearch()">비밀번호 찾기></span>
        </section>
    </main>
            <!--end main-->
</body>
</html>