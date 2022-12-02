<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/lodging_css/reset.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/seller_css/sellerRoomup2_style.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/jquery-ui.css">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-ui.min.js"></script>
 
  <script src="${pageContext.request.contextPath}/resources/css/seller_css/summernote-0.8.18-dist/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/seller_css/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller_css/summernote-0.8.18-dist/summernote-lite.css">
</head>
<body>
    <header id="head">
        <div id="header">
            <div class="top">
                <h3>판매자페이지</h3>
                <div id="manager">
                    <ul>
                        <li><a href="">home</a></li>
                        <li><a href="">내정보</a></li>
                        <li><a href="">객실관리</a></li>
                        <li><a href="">문의</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <body>
        <section id="inner">
          <div id="up_nav">
             <ul>
                <li><a href="#">객실등록</a></li>
                <li><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_right_icon.png"></li>
                <li><a href="#" style="color: white">객실정보등록</a></li>
                <li><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_right_icon.png"></li>
                <li><a href="#">완료등록</a></li>
             </ul>
          </div>
          <div id="up_top" class="fixedclear" >
             <div id="up_top_left" >
                <div id="main_img">
                    &nbsp; 
                </div>
                <div id="plus" >
                    <ul>
                        <li></li>
                    </ul>
                    <ul>
                        <li></li>
                    </ul>
                    <ul>
                        <li></li>
                    </ul>
                    <ul>
                        <li></li>
                    </ul>
                </div>
             </div>
             
             <div id="up_top_right" >
               <table >
                <tr>
                    <td>객실명  </td>
                    <td>       &nbsp; </td>
                </tr>
                <tr>
                    <td>가격 </td>
                    <td>       &nbsp; </td>
                </tr>
                <tr>
                    <td>객실수  </td>
                    <td>       &nbsp; </td>
                </tr>
                <tr >
                    <td>최대인원  </td>
                    <td>       &nbsp; </td>
                </tr>

              
               </table>

             </div>
          </div>
   
          <div class="container">
            <textarea class="summernote" name="editordata"></textarea>    
          </div>
          <script>
          $('.summernote').summernote({
                height: 150,
                lang: "ko-KR"
              });
          </script>
          
          <div id="inner_bottom">
            <div>
               <a href="<%=request.getContextPath()%>/seller/sellerRoomup1.do"> <button type="submit" name="back" id="pre">이전</button></a>
               <a href="<%=request.getContextPath()%>/seller/sellerRoomup3.do"> <button type="submit" name="next" id="next">다음</button></a>
            </div>

        </div>
          
        </section>


    </body>
   <footer class="fixedclear">
            <div id="foot" >
                
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