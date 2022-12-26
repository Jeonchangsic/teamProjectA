<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/login_css/pwSearch.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!-- jQuery -->
    <script src="<%=request.getContextPath() %>/resources/css/jquery-3.6.1.min.js"></script>

    
    <!-- 비밀번호 찾기 -->
    <script>
    	$(document).ready(function() {
			
    		$("#search").click(function(){
    		var id = $("#id").val();
			var email = $("#email").val();
			
    			if(id == ""){
    				alert("아이디를 입력해주세요.");
    			}else if(email == ""){
    				alert("이메일을 입력해주세요.")
    			}else{
	    			$("#loading").css("display","inline-block");
	    			$.ajax({
	    				url:"pwSearch.do",
	    				type:"POST",
	    				data:{
	    						id : id,
	    						email : email
	    				},
	    				success: function(data){
	    					$("#loading").css("display","none");
	    						alert("임시 비밀번호가 발송되었습니다.");
	    						location.reload(); 
	    						/* window.close(); */
    						
    					}
    				})
    			}
    		});
    	});
    </script>
</head>
<body>
	<div id="loading">
		<img src="<%=request.getContextPath()%>/resources/images/index_images/loading.gif"/>
	</div>
    <header>
        <h2>비밀번호 찾기</h2>
    </header>

            <!--end header-->
    <main>
        <form> 
        <table id="table1">
            <tr>
            <td class="td_style">아이디</td>
                <td class="textArea">
                    <input type="text" class="loginInputArea" id="id" name="userID" placeholder="아이디를 입력하세요.">
                </td>
            </tr>
            <tr id="tr_border">
            <td class="td_style">이메일</td>
                <td class="textArea">
                    <input type="text" class="loginInputArea" id="email" name="userEmail" placeholder="회원가입 시 입력한 이메일을 입력하세요.">
                </td>
            </tr>
        </table>
        <input type="button" id="search" value="비밀번호 찾기"/>
        </form>
    </main>
            <!--end main-->
</body>
</html>