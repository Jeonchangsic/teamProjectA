<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath() %>/resources/css/join_css/join.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!-- jQuery -->
    <script src="<%=request.getContextPath() %>/resources/css/jquery-3.6.1.min.js"></script>
    <script>
    
	    //아이디 중복체크
	    //아이디의 길이가 8~17자리에 일치하는 경우 ajax통신 후 아이디 중복검사 
	    $(document).ready(function(){
	    	$("#id").blur(function(){
	   		 var userID = $(this).val();
		    if(userID.length > 7 && userID.length < 16){
			    $.ajax({
			    	url:"userForm.do",
			    	type:"post",
			    	data:"userID="+userID,
			    	success:function(data){
			    		//console.log("data");
				    		if(data != 1){ 								//중복되는 아이디가 없는경우
					    		$(".id_ok").css("display","inline-block");
				    			$(".id_no").css("display","none");
				    			$(".id_no2").css("display","none");
			    			}else if(data == 1){							 //중복되는 아이디가 있는경우
				    			$(".id_ok").css("display","none");
				    			$(".id_no").css("display","inline-block");
				    			$(".id_no2").css("display","none");
				    			$("#id").val("");
		    				}else{
		    					$(".id_ok").css("display","none");
				    			$(".id_no").css("display","none");
				    			$(".id_no2").css("display","none");
		    				}	
			    	},
			    	error:function(){
			    		alert("에러입니다.");
			    	}
			    	});
		    }else {  			 //아이디의 길이가 일치하지 않는 경우 ajax통신 안함
					$(".id_ok").css("display","none");
					$(".id_no").css("display","none");
					$(".id_no2").css("display","inline-block");
					$("#id").val("");
			}
	    	
	    });
	    })
	    
	    
	    //비밀번호 설정 검사
	    $(document).ready(function(){
	    	$("#pwd").blur(function(){
	    	 var pwd = $("#pwd").val();
	    	 var num = pwd.search(/[0-9]/g);
	    	 var eng = pwd.search(/[a-z]/ig);
	    	 var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    	
	    	if(pwd.length < 8 || pwd.length > 20){			 //비밀번호의 길이가 일치하지 않는경우
	    		$(".pw_no2").css("display","inline-block");
	    		$(".pw_no3").css("display","none");
	    		$(".pw_no4").css("display","none");
	    		$("#pwd").val("");
	    	}else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)){ //특문,영문,숫자를 조합한 비밀번호가 아닌경우 
	    		$(".pw_no2").css("display","none");
	    		$(".pw_no3").css("display","inline-block");
	    		$(".pw_no4").css("display","none");
	    		$("#pwd").val("");
	    	}else{//비밀번호 설정이 일치하는경우
		    		$(".pw_no2").css("display","none");
		    		$(".pw_no3").css("display","none");
		    		$(".pw_no4").css("display","inline-block");
	    	}
	    	})
	    });
	    
	    //비밀번호 확인 검사
    	$(document).ready(function(){
    		$("#repwd").blur(function(){
    		var pwd = $("#pwd").val();
	    	var repwd = $("#repwd").val();
	    	
	    	if(pwd == repwd){
	    		$(".pw_ok").css("display","inline-block");
	    		$(".pw_no").css("display","none");
	    	}else{
	    		$(".pw_ok").css("display","none");
	    		$(".pw_no").css("display","inline-block");
	    		$("#repwd").val("");
	    	}
    	});
    	});
    </script>
    
    <!-- 이메일인증 스크립트 -->
    <script>
    var codetemp ="";
    $(function(){
    	$(".mail_check_button").click(function(){
    		if($("#id").val() == ""){
    			alert("아이디를 입력해주세요.");
    		}else if($("#pwd").val() == ""){
    			alert("비밀번호를 입력해주세요.");
    		}else if($("#repwd").val() == ""){
    			alert("비밀번호 확인을 완료해주세요.");
    		}else{
	    		$("#loading").css("display","inline-block");
	    		var email = $(".mail_input").val(); //입력한 이메일 
	    		var cehckBox = $(".mail_check_input"); //인증번호 입력란
	    		var boxWrap = $(".mail_check_input_box"); //인증번호 입력영역
	    		var code ="";
	    		$.ajax({
	    			
	    			type:"GET",
	    			url:"mailCheck?email="+ email,
	    			success:function(data){
	    				alert("인증번호 전송이 완료되었습니다.");
	    				$("#loading").css("display","none");
	    				cehckBox.attr("disabled",false); // attr : cehckBox의 속성을 변경
	    				boxWrap.attr("id","mail_check_input_box_true");
	    				codetemp = data; //컨트롤러에서 받은 리턴값(난수)을 변수에 넣는다.
    				
    			}
    		});
    	}
    	});
    	
    	$(".mail_check_input").blur(function(){
    		var inputcode = $(".mail_check_input").val(); //입력결과
    		var checkResult = $("#mail_check_input_box_warn"); //비교결과
    		
    		if(inputcode == codetemp){ //인증번호가 일치하는 경우
    			$(".email_ok").css("display","inline-block");
	    		$(".email_no").css("display","none");
    		}else{						//인증번호가 일치하지 않는 경우
    			$(".email_ok").css("display","none");
	    		$(".email_no").css("display","inline-block");
	    		$(".mail_check_input").val("");
    		}
    	});
    	
    });
    </script>
</head>
<body>
	<div id="loading">
		<img src="<%=request.getContextPath()%>/resources/images/index_images/loading.gif"/>
	</div>
	<div class="modal">
      <div class="modal_body">
      		저긴어때(주)에서 회원님의 개인정보에 접근합니다.<br>
		       이용자 식별자 및 제공된 개인정보는 <br>
		       이용자 식별, 통계, 계정 연동 및 CS 등을 위해 서비스 이용기간 동안 활용/보관됩니다. <br>
		       본 제공 동의를 거부할 권리가 있으나,<br>
		        동의를 거부하실 경우 회원가입이 제한됩니다.<br>
		       동의하신다면 이전화면에서 동의함 체크를 해주세요.</div>
    </div>
    <header>
    	
        <h2>
    	</h2>
    </header>
    <main>
    	<div id="logoArea">
	       	<a href="<%=request.getContextPath()%>/index/index.do">
	   			<img  id="main_logo"src="<%=request.getContextPath()%>/resources/images/login_images/logo2.svg"/>
	   		</a>
   		</div>
    	<div id="border1">
	        <form action="join.do" method="post">
	            <table id="table1" class="joinBorder">
	                <tr>
	                    <td class="contentsArea1">아이디</td>
	                    <td class="inputArea">
	                        <input type="text" name="userID" id="id" class="inputArea" placeholder="아이디를 입력하세요." required>
	                        <span class="id_ok">사용 가능한 아이디입니다.</span>
	                        <span class="id_no">중복된  아이디입니다!</span>
	                        <span class="id_no2">8자리 ~ 15자리 이내로 입력하여 주세요.</span>
	                    </td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td class="contentsArea" >비밀번호</td>
	                    <td class="inputArea">
	                        <input type="password" name="userPassword" id="pwd" class="inputArea" placeholder="비밀번호를 입력하세요." required>
	                        <span class="pw_no2">8자리 ~20자리 이내로 입력하여 주세요.</span>
	                        <span class="pw_no3">영문,숫자,특수문자를 혼합하여 주세요.</span>
	                        <span class="pw_no4">안전한 비밀번호 입니다.</span>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea3">비밀번호확인</td>
	                    <td class="inputArea">
	                        <input type="password" id="repwd" class="inputArea" placeholder="비밀번호 확인" required>
	                        <span class="pw_ok">비밀번호가 일치합니다.</span>
	                        <span class="pw_no">비밀번호 불일치!</span>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">이름</td>
	                    <td class="inputArea">
	                        <input type="text" name="userName" id="name" class="inputArea" placeholder="이름을 입력하세요." required>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">이메일</td>
	                    <td class="inputArea"> 
	                        <input type="text" name="userEmail" id="email" class="inputArea mail_input" placeholder="이메일을 입력하세요." required><!-- 메일 입력란 -->
	                    </td>
	                    <td></td>
	                </tr>
	                <tr>
		                <td></td>
		                <td class="mail_check_input_box">
		                	<input id="mail_check_input" class="mail_check_input" disabled="disabled" required><!-- 인증번호 입력란 -->
		                </td>		
		                <td id="mail_check_button" class="mail_check_button"><!-- 메일 체크 버튼 -->
		                    	<span class="BtnStyle">인증번호 전송</span>
	                    </td>
	                </tr>
	                <tr>
	                	<td></td>
	                	<td>
	                		<span id="mail_check_input_box_warn"></span>
	                		<span class="email_ok">인증번호가 일치합니다.</span>
	                		<span class="email_no">인증번호가 다릅니다.</span>
	                	</td>
	                	<td></td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">휴대전화</td>
	                    <td class="inputArea">
	                        <input type="tel" name="userPhone" id="phone" class="inputArea" placeholder="- 제외하고 입력하세요." required>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">성별</td>
	                    <td>
	                        남성 <input type="radio" name="userGender" value="남자" id="man" required>
	                        여성 <input type="radio" name="userGender" value="여자 " required>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">생년월일</td>
	                    <td class="inputArea">
	                        <input type="date" name="userBirth" id="birth" class="inputArea" required>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea2">약관동의</td>
	                    <td class="inputArea">
	                        <button class="btn-open-popup BtnStyle" type="button" >약관보기</button>
	                    </td>
	                    <td>동의함
	                    	 <input type="radio" name="agree" required>
	                    </td>
	                </tr>
	            </table>
	            <table id="table2">
	                <tr>
	                    <td id="join"><button class="footBtn BtnStyle">가입하기</button></td>
	            		 <td><input type="button" class="BtnStyle footBtn" onclick="location.href='<%=request.getContextPath()%>/index/index.do'" value="취소"></td>
	                </tr>
	            </table>
	        </form>
     	</div>   	
    </main>
    <!-- 모달 스크립트 -->
    <script>
   	  const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

     	 btnOpenPopup.addEventListener('click', () => {
          modal.classList.toggle('show');
		
          if (modal.classList.contains('show')) {
              body.style.overflow = 'hidden';
            }
      });
     	modal.addEventListener('click', (event) => {
            if (event.target === modal) {
              modal.classList.toggle('show');

              if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
              }
            }
          });
    </script>
</body>
</html>