<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
				    
	  	//체크박스 선택시 ny주기

		function checkBox(obj){
			var checked = obj.checked;
			if(checked){
				obj.value = "Y";
			}else{
				obj.value= "N";
			}
		};
		

		//추가정보입력			    
			    $(document).ready(function () {
		    		var maxAppend = 1;
		    		var extcnt = 1;
		    		  $(document).on("click", "button[name='plus']", function () {
						if (maxAppend >= 5) 							 
							return; // 5번째부터는 append 안되고 return 시키기
							extcnt++;
		    		    $("#bottom_info").append('</br><input type="text" name="addinfo'+extcnt+'" class="plus" placeholder="추가정보를 입력해주세요"></br>');
						maxAppend++;
						
		    		  });
		    		});
					   

	   	
	    </script>
</head>
<body>
	<main>
	    <section id="head">
	        <div id="header">
	            <div class="top">
	                <h3>판매자페이지</h3>
	                <div id="manager">
	                    <ul>
		                    <li><a href="<%=request.getContextPath() %>/index/index.do">home</a></li>
		                    <li><a href="<%=request.getContextPath() %>/seller/sellerInfo.do">마이페이지</a></li>
		                    <li><a href="<%=request.getContextPath() %>/seller/sellerRegi.do">숙소관리</a></li>
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
	                <li><a href="#">등록완료</a></li>
	             </ul>
	       	</div>
	       	<form method="post" enctype="multipart/form-data" > 
	        <!--이미지 업로드 -->
		        <div class="inputArea" id="main_left">
				 	<label for="rimage1">사진등록</label>
					<input type="file" id="rimage1" name="file" required />
					<div id="imgborder">
					
					</div>
				</div>	
				<input type="hidden" name="lidx" value="${lidxone.lidx}"> 
			<!--정보입력-->
			<div id="main_right">
				<table>
					<tr>
						<td>객실명</td>
						<td><input type="text" name="rtype" required></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input type="text" name="rprice"  pattern="[0-9]+" placeholder="숫자를 입력해주세요" required></td>
					</tr>
					<tr>
						<td>객실수</td>
						<td><input type="text" name="rnum "  pattern="[0-9]+" placeholder="숫자를 입력해주세요" required></td>
					</tr>
					<tr>
						<td>기준인원</td>
						<td><input type="text" name="stdmen"  pattern="[0-9]+" placeholder="숫자를 입력해주세요" required></td>
					</tr>
					<tr>
						<td>최대인원</td>
						<td><input type="text" name="maxmen" pattern="[0-9]+" placeholder="숫자를 입력해주세요" required/></td>
					</tr>
				</table>
			</div> 
			<div id="bottom">
				<!-- 체크박스 -->
				<div id="bottom_left">
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
					                        <input type="checkbox" onchange="checkBox(this)" class="ch" name="ricecooker">
					                        <label>전기밥솥</label>
					                    </li>   
					
					                </ul>
					              </div>
				            	</div>
				           </div>
	            </div>
	            <div class="bed_filter" id="bottom_right">
					<div id="bed_info">베드타입</div>
						<ul>
							<li>
								<label>싱글</label><br>
								<input id="single_bed" type="radio" name="bed" value="single_bed" required >
							</li>
							<li>
								<label>더블</label><br>
								<input type="radio" name="bed" value="double_bed">
							</li>
							<li>
								<label>트윈</label><br>
								<input type="radio" name="bed" value="twin_bed">
							</li>
							<li>
								<label>온돌</label><br>
								<input type="radio" name="bed" value="ondol_bed">
							</li>
						</ul>				
				</div>
	            
		            
			    <div id="bottom_info">
			    	<p>추가정보<p>
			        	<input type="text" class="plus" name = "addinfo1" placeholder="추가정보를 입력해주세요"/>
			            	<button type="button" name="plus" id="plus">
			            		<img src="<%=request.getContextPath()%>/resources/images/seller_images/sellerPlus_image.png" alt="">
			            	</button>		            	
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

	
	
	$(document).ready(function(){
	  $("#rimage1").change(function(){
		   if(this.files && this.files[0]) {
			 $("#imgborder").append("<img src=''/>");
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $("#imgborder img").attr("src", data.target.result);              
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
		  });
	  });
	
	</script>
</body>
</html>