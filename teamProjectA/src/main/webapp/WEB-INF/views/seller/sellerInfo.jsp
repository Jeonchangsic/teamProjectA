<%@page import="team.projectA.vo.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	UserVO vo = (UserVO)request.getAttribute("vo");
%>
<%
	LodgingVO vo2 = (LodgingVO)request.getAttribute("vo2");
%>




<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath() %>/resources/css/seller_css/sellerInfo.css" rel="stylesheet"/>
    <script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <script>
	  //사업장이름         
      $(document).ready(function(){    
        $("#nameFn").on("click", function(){
        	 alert("변경이 완료되었습니다");
                var frm = document.nameform;
              // alert(frm.lodgingname.value);
                frm.action = "sellerInfo2.do";
                frm.method = "POST";
                frm.submit();
                
                console.log("성공");
        })
      }); 
      
      //주소
      $(document).ready(function(){    
          $("#addrFn").on("click", function(){
          	 alert("변경이 완료되었습니다");
                  var frm = document.nameform;
                // alert(frm.lodgingname.value);
                  frm.action = "sellerInfo2.do";
                  frm.method = "POST";
                  frm.submit();
                  
                  console.log("성공");
          })
        }); 
      
      //이메일
      $(document).ready(function(){    
          $("#mailFn").on("click", function(){
          	 alert("변경이 완료되었습니다");
                  var frm = document.nameform;
                  //alert(frm.userEmail.value);
                  frm.action = "sellerInfo1.do";
                  frm.method = "POST";
                  frm.submit();
                  
                  console.log("성공");
          })
        }); 
      
      //전화번호
      $(document).ready(function(){    
          $("#phoneFn").on("click", function(){
          	 alert("변경이 완료되었습니다");
                  var frm = document.nameform;
                // alert(frm.lodgingname.value);
                  frm.action = "sellerInfo1.do";
                  frm.method = "POST";
                  frm.submit();
                  
                  console.log("성공");
          })
        }); 
      
      //비밀번호
       $(document).ready(function(){    
          $("#pwdFn").on("click", function(){
          	 alert("변경이 완료되었습니다");
                  var frm = document.nameform;
                // alert(frm.lodgingname.value);
                  frm.action = "sellerInfo1.do";
                  frm.method = "POST";
                  frm.submit();
                  
                  console.log("성공");
          })
        });  
        
      
      //비밀번호 체크
     

      
      
        
</script>
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

        	<form method="post" id="nameForm" name="nameform">
           	 <table id="info_Area">
<%--           		<input type='hidden' name='uidx'  value=<%=vo.getUidx() %>> --%>
     <%--    		<input type='hidden' name='lidx' value=<%=LodgingVO.%>>	 --%>
        	   <%--  <input type='hidden' name='userPassword' value=<%=vo.getUserPassword()%>> --%>

   
        		
                <tr>
                    <td>아이디</td>
                    <td><%=vo.getUserID()%></td>
                    <td></td>
                </tr>
       		        <hr>
     		
                <tr>
                    <td>사업장명</td>
                    <td><input type='text' name="lodgingname"  id="lodgingname" name=<%=vo2.getLodgingname()%>> </td>
                    
                    <td><button type="submit" id="nameFn" value="상세변경" class="btn_size">변경</button></td> 
                </tr>   
     	

<!--                <tr>
                    <td>비밀번호변경</td>
                    <td><input type='password' name="userpassword2"></td>
                    <td></td>
                </tr> -->
            
                <tr>
                    <td>비밀번호변경</td>
                    <td><input type='password' name='userPassword' value="${login.userPassword}" autoComplete="off"></td>
                    <td><button type="submit" class="btn_size" id="pwdFn">변경</td>
                </tr>
                
               		

                <tr>
                    <td>이메일</td>
                    <td><input type='text' name="userEmail" value="${login.userEmail}" autoComplete="off"></td>
                    <td><button type="submit" class="btn_size" id="mailFn">변경</button></td>
 
                </tr>
         
  
                <tr>
                    <td>전화번호</td>
                    <td><input type='text' name="userPhone" value="${login.userPhone}"></td>
                    <td><button type="submit" class="btn_size" id="phoneFn">변경</button></td>
                </tr>
       
                <tr>
                    <td>주소</td>
                    <td><input type='text' name="lodgingaddr" value=<%=vo2.getLodgingaddr() %>></td>
                    <td><button type="submit" class="btn_size" id="addrFn">변경</button></td>
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