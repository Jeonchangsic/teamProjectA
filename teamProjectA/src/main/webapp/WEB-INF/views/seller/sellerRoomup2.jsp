<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<body>
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

		//추가정보입력
	 	$(document).ready(function () {
    		var maxAppend = 1;
    		  $(document).on("click", "button[name='plus']", function () {
				if (maxAppend >= 5) 
					return; // 5번째부터는 append 안되고 return 시키기
    		    $("#bottom_right").append("<input type='text'></br>");
				maxAppend++;
    		  });
    		});
		
	
			//이미지 업로드
			  $("#rimage1").change(function(){
				   if(this.files && this.files[0]) {
				    var reader = new FileReader;
				    reader.onload = function(data) {
				     $(".select_img img").attr("src", data.target.result).width(300);        
				    }
				    reader.readAsDataURL(this.files[0]);
				   }
				  });
	   
	    </script>
	</head>
	<main>
	    <section id="head">
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
	    </section>
    	<section id="inner">
	      	 <div id="up_nav">
	             <ul>
	                <li><a href="#" style="color: white">객실등록</a></li>
	                <li><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_right_icon.png"></li>
	                <li><a href="#">객실정보등록</a></li>
	                <li><img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerRoomup_right_icon.png"></li>
	                <li><a href="#">완료등록2222222222</a></li>
	             </ul>
	       	</div>
	       	<form method="post" enctype="multipart/form-data" > 
	        <!--이미지 업로드 -->
		        <div class="inputArea" id="main_left">
				 	<label for="rimage1">사진등록</label>
					<input type="file" id="rimage1" name="file" />
					<div class="select_img"><img src="" /></div>	
				</div>
				<input type="text" name="ridx">
				<input type="text" nmae=" lidx"> 
			<!--정보입력-->
			<div id="main_right">
				<div>
				객실명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="rtype"/> </br>
				가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="rprice"/></br>
				객실수&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <input type="text" name="rnum "/></br>
				최대인원 &nbsp;&nbsp; <input type="text" name="maxmen"/>	
				</div>
				<div class="bed_filter">
					<div id="bed_info">베드타입</div>
						<ul class="btnsBox">
							<li class="btnbox">
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/single_bed.jpg" alt="single_bed">
								<p>싱글</p>
							</li>
							<li class="btnbox">
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/double_bed.jpg" alt="double_bed">
								<p>더블</p>
							</li>
							<li class="btnbox"">
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/twin_bed.jpg" alt="twin_bed">
								<p>트윈</p>
							</li>
							<li class="btnbox">
								<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/ondol_bed.jpg" alt="ondol_bed">
								<p>온돌</p>
							</li>
						</ul>
				</div>
			</div> 	
			<script>
			//침대 선택 색상변경
			var div2 = document.querySelectorAll('.btnbox > img');
			
				function handleClick(event) {
				  console.log(event.target);
				  // console.log(this);
				  // 콘솔창을 보면 둘다 동일한 값이 나온다
			
				  console.log(event.target.classList);
			
				  if (event.target.classList[1] === "clicked") {
				    event.target.classList.remove("clicked");
				  } else {
				    for (var i = 0; i < div2.length; i++) {
				      div2[i].classList.remove("clicked");
				    }
			
				    event.target.classList.add("clicked");
				  }
				}
			
				function init() {
				  for (var i = 0; i < div2.length; i++) {
				    div2[i].addEventListener("click", handleClick);
				  }
				}
			
				init(); 
				
			</script>		
			<div id="bottom">
				<!-- 체크박스 -->
				<div id="bottom_left">
			        <div id="up_bottom">
			           <form>
			                <input type='radio' name='select' value='select' id='checkAll' onclick='ch1()'/>전체선택 
			                <input type='radio' name='select' value='noselect' onclick='ch2()' />전체선택해제
			           </form>
			        </div>
			        <div id="up_bottom2">
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
			           </div>
		            </div>
		            <div id="bottom_right">
		            	<p>추가정보<p>
		            	<input type="text" id="plus" placeholder="추가정보를 입력해주세요"/><button type="button" name="plus">+</button>
			            	
		            </div>
		    
		            <div id="inner_bottom">
		                <div>
		                   <button type="submit" name="next" style="color:white; border:1px solid rgb(86,19,241);">다음</button> 
		                </div>
		          	 </div>
		          </form>
				</div>
	        </section>
		</section>
	</main>
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