<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/lodging_css/reset.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/seller_css/sellerRoomup1_style.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/jquery-ui.css">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-ui.min.js"></script>
    <script>
    
    //체크박스 전체선택
    function ch1() {
    	  for(i=0; i<document.all.fil.length; i++) {
    	   document.all.fil[i].checked = true;
    	  }
    	 }
    //체크박스 전체해제
    function ch2() {
  	  for(i=0; i<document.all.fil.length; i++) {
  	   document.all.fil[i].checked = false;
  	  }
  	 }
  
    
   
    </script>
</head>
<body>
    <header id="head">
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
    <body>
        <section id="inner">
          <div id="up_nav">
             <ul>
                <li><a href="#" style="color: white">객실등록</a></li>
                <li><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_right_icon.png"></li>
                <li><a href="#">객실정보등록</a></li>
                <li><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_right_icon.png"></li>
                <li><a href="#">완료등록</a></li>
             </ul>
          </div>
          <div id="up_top" class="fixedclear" >
             <div id="up_top_left" >
                <button id="upbutton1">사진업로드</button>
                <div id="main_img">
                    &nbsp; 
                </div>
                <div id="plus" >
                    <ul>
                        <li><a href="#"> <img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_plus.png"></a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_plus.png"></a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_plus.png"></a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_plus.png"></a></li>
                    </ul>
                </div>
             </div>
             
             <div id="up_top_right" >
               <table >
                <tr>
                    <td>객실명  </td>
                    <td><input type:text></td>
                </tr>
                <tr>
                    <td>가격 </td>
                    <td><input type:text></td>
                </tr>
                <tr>
                    <td>객실수  </td>
                    <td><input type:text></td>
                </tr>
                <tr >
                    <td>최대인원  </td>
                    <td><input type:text></td>
                </tr>

              
               </table>

             </div>
          </div>
          <div id="up_bottom">
           <form>
                <input type='radio' name='select' value='select' id='checkAll' onclick='ch1()'/>전체선택 
                <input type='radio' name='select' value='noselect' onclick='ch2()' />전체선택해제
           </form>
          </div>
           <div id="up_bottom2">
            <div class="filter1">
                <div class="filter" >
               	     공용시설
                </div>
                <div class="public_in" class="fixedclear">
                    <ul id="public_left" class="filter_check"> 
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>피트니스</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>사우나</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>레스토랑</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>라운지</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>BBQ</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>공용스파</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>세미나실</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>노래방</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>세탁기</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>탈수기</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>취사가능</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>온천</label>
                        </li>   
                    </ul>

                    <ul id="public_right" class="filter_check">
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>수영장</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>골프장</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>엘레베이터</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>공용PC</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>카페</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>족구장</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>편의점</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>주방/식당</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>건조기</label>
                        </li>  
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>주차장</label>
                        </li>  
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>공용샤워실</label>
                        </li>  
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>스키장</label>
                        </li>  

                    </ul>
                </div>   
            </div>
            <div class="filter1" >
                <div id="filter_in" class="filter" >
                    객실 내 시설
                </div>
                <div class="public_in"> 
                <ul id="in_left" class="filter_check" >
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>객실스파</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>와이파이</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>TV</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>냉장고</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>욕조</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>다리미</label>
                    </li>   

                </ul>
                <ul id="in_right" class="filter_check">
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>미니바</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>욕실용품</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>에어컨</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>객실샤워실</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>드라이기</label>
                    </li>   
                    <li>
                        <input type=checkbox class="ch" name="fil">
                        <label>전기밥솥</label>
                    </li>   

                </ul>
                </div>
            </div>
            <div class="filter1">
                <div class="filter" id="odd">
                    기타
                </div>
                <div class="public_in"> 
                    <ul id="odd_left" class="filter_check">
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>픽업가능</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>프린터사용</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>개인사물함</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>조식포함</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>발렛파킹</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>반려견동반</label>
                        </li>

                    </ul>
                    <ul id="odd_right" class="filter_check">
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>객실내취사</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>짐보관가능</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>무료주차</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>객실내흡연</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>금연</label>
                        </li>   
                        <li>
                            <input type=checkbox class="ch" name="fil">
                            <label>카드결제</label>
                        </li>

                    </ul>

                </div>
             </div>
            </div>
            <div id="inner_bottom">
                <div>
                   <a href="<%=request.getContextPath()%>/seller/sellerRoomup2.do"><button type="submit" name="next" style="color:white; border:1px solid rgb(86,19,241);">다음</button></a> 
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