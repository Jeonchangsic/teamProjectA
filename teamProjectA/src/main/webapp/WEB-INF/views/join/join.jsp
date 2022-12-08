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
    	function idForm(){
	    var userID = $("#id").val();
	    $.ajax({
	    	url:"userForm.do",
	    	type:"post",
	    	data:"userID="+userID,
	    	success:function(data){
	    		$("#id").blur(function(){
	    		if(data != 1 && userID.length > 0){ 				//사용가능한 아이디일 경우
	    			$(".id_ok").css("display","inline-block");
	    			$(".id_no").css("display","none");
	    		}else if(data == 1 && userID.length > 0){ 						//중복되는 아이디일 경우
	    			$(".id_ok").css("display","none");
	    			$(".id_no").css("display","inline-block");

	    		}else{
	    			$(".id_ok").css("display","none");
	    			$(".id_no").css("display","none");
	    		}
	    		});
	    	},
	    	error:function(){
	    		alert("에러입니다.");
	    	}
	    	});
	    };
	    
	    //비밀번호 확인
	    function pwForm(){
	    	 var pwd = $("#pwd").val();
	    	var repwd = $("#repwd").val(); 
	    	if(pwd == repwd && pwd.length > 0 && repwd.length > 0){
	    		$(".pw_ok").css("display","inline-block");
	    		$(".pw_no").css("display","none");
	    	}else if(pwd != repwd && pwd.length > 0 && repwd.length > 0){
	    		$(".pw_ok").css("display","none");
	    		$(".pw_no").css("display","inline-block");
	    		
	    	}else{
	    		$(".pw_ok").css("display","none");
	    		$(".pw_no").css("display","none");
	    	};
	    	};
	    
	    	
    </script>
    
    <!-- 이메일인증 스크립트 -->
    <script>
    var codetemp ="";
    $(function(){
    	
    	$(".mail_check_button").click(function(){
    		var email = $(".mail_input").val(); //입력한 이메일 값 
    		var cehckBox = $(".mail_check_input");
    		var boxWrap = $(".mail_check_input_box");
    		var code ="";
    		$.ajax({
    			
    			type:"GET",
    			url:"mailCheck?email="+ email,
    			success:function(data){
    				 console.log(data); 
    				cehckBox.attr("disabled",false); // attr : cehckBox의 속성을 변경
    				boxWrap.attr("id","mail_check_input_box_true");
    				codetemp = data; //컨트롤러에서 받은 리턴값(난수)을 변수에 넣는다.
    				
    			}
    		});
    	});
    	$(".mail_check_input").blur(function(){
    		var inputcode = $(".mail_check_input").val(); //입력결과
    		var checkResult = $("#mail_check_input_box_warn"); //비교결과
    		
    		if(inputcode == codetemp){
    			checkResult.html("인증번호가 일치합니다.");
    			checkResult.attr("class","correct");
    		}else{
    			checkResult.html("인증번호가 틀립니다.");
    			checkResult.attr("class","incorrect");
    		}
    	});
    	
    });
    </script>
    
    
    <!-- 모달 스타일 -->
   <style>
      .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 30%;
        left: 50%;

        width: 400px;
        height: 250px;
		line-height:35px;
        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
      .correct{
      	color: green;
      	font-weight:bold;
      }
      .incorrect{
      	color: red;
      	font-weight:bold;
      }
     #joinText{
     	padding-top:20px;
     }
     
     #mail_check_input{
     	width:180px;
     	height:21px;
     	
     }
     #mail_check_button{
     	border:1px solid #000;
     	background-color:rgba(0,0,0,0.10);
     }
    </style>
</head>
<body>
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
        	<a href="<%=request.getContextPath()%>/index/index.do">
    		<img src="<%=request.getContextPath()%>/resources/images/login_images/logo2.svg" style="width:150px;"/>
    		</a>
    		<p id="joinText">회원가입</p>
    	</h2>
    </header>
    <main>
    	<div id="border1">
	        <form action="join.do" method="post">
	            <table id="table1">
	                <tr>
	                    <td class="contentsArea">아이디</td>
	                    <td class="inputArea">
	                        <input type="text" name="userID" id="id" class="inputArea" placeholder="아이디를 입력하세요." required oninput="idForm()">
	                        <span class="id_ok" style="color:green; display:none; margin-top:4px; font-weight:bold;">사용 가능한 아이디입니다.</span>
	                        <span class="id_no" style="color:red; display:none; margin-top:4px; font-weight:bold;">중복된  아이디입니다!</span>
	                    </td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td class="contentsArea" >비밀번호</td>
	                    <td class="inputArea">
	                        <input type="password" name="userPassword" id="pwd" class="inputArea" placeholder="비밀번호를 입력하세요." required>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">비밀번호확인</td>
	                    <td class="inputArea">
	                        <input type="password" id="repwd" class="inputArea" placeholder="비밀번호 확인" required oninput="pwForm()">
	                        <span class="pw_ok" style="color:green; display:none; font-weight:bold;">비밀번호가 일치합니다.</span>
	                        <span class="pw_no" style="color:red; display:none;  font-weight:bold;">비밀번호 불일치!</span>
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
		                <td class="mail_check_input_box"><!-- 인증번호 입력란 -->
		                	<input id="mail_check_input" class="mail_check_input" disabled="disabled">
		                </td>		
		                <td id="mail_check_button" class="mail_check_button"><!-- 메일 체크 버튼 -->
		                    	<span style="cursor:pointer;">인증번호 전송</span>
	                    </td>
	                </tr>
	                <tr>
	                	<td></td>
	                	<td><span id="mail_check_input_box_warn"></span></td>
	                	<td></td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">휴대전화</td>
	                    <td class="inputArea">
	                        <input type="tel" name="userPhone" id="phone" class="inputArea" placeholder="000-0000-0000" required>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">성별</td>
	                    <td>
	                        남성 <input type="radio" name="userGender" value="남자" id="man" >
	                        여성 <input type="radio" name="userGender" value="여자 " >
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">생년월일</td>
	                    <td class="inputArea">
	                        <input type="date" name="userBirth" id="birth" class="inputArea" required>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="contentsArea">약관동의</td>
	                    <td class="inputArea">
	                        <button class="btn-open-popup" type="button" >약관보기</button>
	                    </td>
	                    <td>동의함
	                    	 <input type="radio" name="agree" required>
	                    </td>
	                </tr>
	            </table>
	            <table id="table2">
	                <tr>
	                    <td id="join"><button class="footBtn">가입하기</button></td>
	            		 <td><input type="button" onclick="location.href='<%=request.getContextPath()%>/index/index.do'" class="footBtn" value="취소"></td>
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