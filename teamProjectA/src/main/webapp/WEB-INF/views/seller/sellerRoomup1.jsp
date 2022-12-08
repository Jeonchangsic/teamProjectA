<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	 };
    //체크박스 전체해제
    function ch2() {
  	  for(i=0; i<document.all.fil.length; i++) {
  	   document.all.fil[i].checked = false;
  	  }
  	 };
    
  	//체크박스 선택시 ny주기
    function checkBox(obj){
    	var checked = obj.checked;
    	if(checked){
    		obj.value="Y";
    	}else{ 
    		obj.value="N";
    		}
    	}; 

	//추가정보입력
 	$(document).ready(function () {
   		var maxAppend = 1;
   		  $(document).on("click", "button[name='plus']", function () {
			if (maxAppend >= 5) 
				return; // 5번째부터는 append 안되고 return 시키기
   		    $("#bottom_right").append("</br><input type='text' class='plus' placeholder='추가정보를 입력해주세요'></br>");
			maxAppend++;
   		  });
   		});
		   
    </script>
</head>
<body>
	<header>
		<div id="header">
			<div class="top">
				<h3>판매자페이지</h3>
				<div id="manager">
					<ul>
						<li><a href="<%=request.getContextPath()%>/index/index.do">home</a></li>
						<li><a
							href="<%=request.getContextPath()%>/seller/sellerInfo.do">내정보</a></li>
						<li>
							<c:if test="${login.lodging.equals('N') }">
								<a href="<%=request.getContextPath()%>/seller/sellerLodgingUp.do">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Waiting') }">
								<a href="javascript:alert('이미 숙소 승인을 요청하였습니다.');">숙소등록</a>
							</c:if>
							<c:if test="${login.lodging.equals('Y') }">
								<a href="<%=request.getContextPath()%>/seller/sellerRegi.do">객실관리</a>
							</c:if>
						</li>
						<li><a
							href="<%=request.getContextPath()%>/seller/sellerInquire.do">문의</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
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
	                <li><a href="#">완료등록</a></li>
	             </ul>
	       	</div>
	       	<form method="post" enctype="multipart/form-data" > 
	        <!--이미지 업로드 -->
		        <div class="inputArea" id="main_left">
				 	<label for="rimage1">사진등록</label>
					<input type="file" id="rimage1" name="file" required />
					<div class="select_img"><img src="" /></div>	
				</div>
				<input type="hidden" name="lidx" value="${lidxone.lidx}"> 
			<!--정보입력-->
			<div id="main_right">
				<div>
				객실명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="rtype"/ required> </br>
				가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="rprice"  pattern="[0-9]+" placeholder="숫자를 입력해주세요" required/></br>
				객실수&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <input type="text" name="rnum "  pattern="[0-9]+" placeholder="숫자를 입력해주세요" required/></br>
				기준인원 &nbsp;&nbsp;&nbsp;<input type="text" name="stdmen"  pattern="[0-9]+" placeholder="숫자를 입력해주세요" required/></br>
				최대인원 &nbsp;&nbsp; <input type="text" name="maxmen" pattern="[0-9]+" placeholder="숫자를 입력해주세요" required/>	
				
				</div>
				<div class="bed_filter">
					<div id="bed_info">베드타입</div>
						<ul>
							<li>
								<label>싱글</label></br>
								<input id="single_bed" type="radio" name="bed" value="single_bed" >
							</li>
							<li>
								<label>더블</label></br>
								<input type="radio" name="bed" value="double_bed">
							</li>
							<li>
								<label>트윈</label></br>
								<input type="radio" name="bed" value="twin_bed">
							</li>
							<li>
								<label>온돌</label></br>
								<input type="radio" name="bed" value="ondol_bed">
							</li>
						</ul>
				</div>
			</div> 	
		
			<div id="bottom">
				<!-- 체크박스 -->
				<div id="bottom_left">
				
			       		 <div id="up_bottom">
			                <input type='radio' name='select' value='select' id='checkAll' onclick='ch1()'/>전체선택 
			                <input type='radio' name='select' value='noselect' onclick='ch2()' />전체선택해제
			       		 </div>
				        <div id="up_bottom2">
							 <div class="filter1" >
				                <div id="filter_in" class="filter" >
				             		       객실 내 시설
				                </div>
				              	  <div class="public_in"> 
					                <ul id="in_left" class="filter_check" >
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="spa">
					                        <label>객실스파</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="wifi">
					                        <label>와이파이</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="tv">
					                        <label>TV</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="refri">
					                        <label>냉장고</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="bath">
					                        <label>욕조</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="iron">
					                        <label>다리미</label>
					                    </li>   
					
					                </ul>
					                <ul id="in_right" class="filter_check">
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="minibar">
					                        <label>미니바</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="bathitem">
					                        <label>욕실용품</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="aircon">
					                        <label>에어컨</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="shower">
					                        <label>객실샤워실</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="dryer">
					                        <label>드라이기</label>
					                    </li>   
					                    <li>
					                        <input type="checkbox" class="ch" name="ricecooker">
					                        <label>전기밥솥</label>
					                    </li>   
					
					                </ul>
					              </div>
				            	</div>
				           </div>
			           
		            </div>
		            
			            <div id="bottom_right">
			            	<p>추가정보<p>
			            	<input type="text" class="plus" placeholder="추가정보를 입력해주세요"/><button type="button" name="plus">+</button>
				            	
			            </div>
		    		
		            <div id="inner_bottom">
		                <div>
		                   <button type="submit" name="next" style="color:white; border:1px solid rgb(86,19,241);">다음</button> 
		                </div>
		         	</div>
		          </div>
		        </form>
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
	<script>
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
	
/* 	//침대 선택 색상변경
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
		
			init();  */
	</script>
</body>
</html>