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
</head>
<body>
    <header>
        <h2>
        	<a href="<%=request.getContextPath()%>/index/index.do">
        	<img src="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg">
        	</a>
        </h2>
    </header>

            <!--end header-->

    
    <main>
        <form action="login.do" method="post">
        <table id="table1">
            <tr>
                <td id="textArea">
                    <input type="text" name="userID" placeholder="아이디를 입력하세요.">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="password" name="userPassword" placeholder="비밀번호를 입력하세요.">
                </td>
            </tr>
            <tr>
                <td id="loginbtn">
                    <input type="submit" id="login" value="로그인"/>
                </td>
            </tr>
        </table>
        <table id="table2">
            <tr>
                <td>
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=227a905a07d7faec4ff2683045c19574&redirect_uri=http://localhost:8080/A/auth/kakao/callback&response_type=code" id="kakao" style="margin-left:5px;">  <!--카카오 로그인 링크-->
                        <img src="<%=request.getContextPath() %>/resources/images/login_images/kakao_login_medium_narrow.png" width="250" height="45" >
                    </a>
                </td>
            </tr>
        </table>
        </form>
        <section id="join">
            <span style="display:block; margin:25px 0 10px 50px;">저긴어때와 함께하기</span> 
            <a href="<%=request.getContextPath() %>/join/join.do" style="font-weight:bold; border-right:1px solid #000; padding:0 5px 0 50px; ">일반회원</a>
            <a href="<%=request.getContextPath() %>/join/sellerJoin.do" style="font-weight:bold;">판매자회원</a>
        </section>
    </main>
            <!--end main-->
</body>
</html>