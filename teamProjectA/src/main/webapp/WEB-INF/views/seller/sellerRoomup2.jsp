<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>저긴어때</title>
<link
	href="<%=request.getContextPath()%>/resources/css/lodging_css/reset.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/seller_css/sellerRoomup2_style.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/jquery-ui.css">
<!-- 파비콘 -->
<link
	href="<%=request.getContextPath()%>/resources/images/login_images/logo2.svg"
	rel="shortcut icon">
<script
	src="<%=request.getContextPath()%>/resources/css/jquery-ui.min.js"></script>

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
			
			if(${mo.addinfo2 != null}){
				$("#bottom_info").append('<br><input type="text" class="plus" name = "addinfo2" value = "${mo.addinfo2}" required><br>');
				maxAppend++;
			}
			if(${mo.addinfo3 != null}){
				$("#bottom_info").append('<br><input type="text" class="plus" name = "addinfo3" value = "${mo.addinfo3}" required><br>');
				maxAppend++;
			}
			if(${mo.addinfo4 != null}){
				$("#bottom_info").append('<br><input type="text" class="plus" name = "addinfo4" value = "${mo.addinfo4}" required><br>');
				maxAppend++;
			}
			if(${mo.addinfo5 != null}){
				$("#bottom_info").append('<br><input type="text" class="plus" name = "addinfo5" value = "${mo.addinfo5}" required><br>');
				maxAppend++;
			}
						
			var extcnt = 1;
			
			$(document).on("click", "button[name='plus']", function () {
					if (maxAppend >= 5){ 							 
					return; // 5번째부터는 append 안되고 return 시키기
				}else {
					extcnt++;
					$("#bottom_info").append('</br><input type="text" name="addinfo'+extcnt+'" class="plus" placeholder="추가정보를 입력해주세요" required></br>');
					maxAppend++;
					
					
				}				
			});

			$('#minus').click(function(){
				if (maxAppend <=1){
					return;
				}else{
				$('#bottom_info> br:last-of-type, .plus:last-of-type').remove();
				$('#bottom_info> br:last-of-type').remove();
				maxAppend--;
				}
				});
			});
		
		//이미지 업로드	
		$(document).ready(function(){
			$("#rimage1").change(function(){
				if(this.files && this.files[0]) {					
					$("#border div:first-child").empty("<img src=''/>"); // 이미지 지우고
					$("#border div:first-child").append("<img src=''/>");  // 이미지 추가
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#border div:first-child img").attr("src", data.target.result);              
						}
					reader.readAsDataURL(this.files[0]);
				}
				if(this.files && this.files[1]) {					
					$("#border div:nth-child(2)").empty("<img src=''/>"); // 이미지 지우고
					$("#border div:nth-child(2)").append("<img src=''/>");  // 이미지 추가
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#border div:nth-child(2) img").attr("src", data.target.result);              
					}
					reader.readAsDataURL(this.files[1]);
				}else{
					$("#border div:nth-child(2)").empty("<img src=''/>");
				}
				if(this.files && this.files[2]) {					
					$("#border div:nth-child(3)").empty("<img src=''/>"); // 이미지 지우고
					$("#border div:nth-child(3)").append("<img src=''/>");  // 이미지 추가
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#border div:nth-child(3) img").attr("src", data.target.result);              
					}
					reader.readAsDataURL(this.files[2]);
				}else{
					$("#border div:nth-child(3)").empty("<img src=''/>");
				}
				if(this.files && this.files[3]) {					
					$("#border div:nth-child(4)").empty("<img src=''/>"); // 이미지 지우고
					$("#border div:nth-child(4)").append("<img src=''/>");  // 이미지 추가
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#border div:nth-child(4) img").attr("src", data.target.result);              
					}
					reader.readAsDataURL(this.files[3]);
				}else{
					$("#border div:nth-child(4)").empty("<img src=''/>");
				}
				if(this.files && this.files[4]) {					
					$("#border div:nth-child(5)").empty("<img src=''/>"); // 이미지 지우고
					$("#border div:nth-child(5)").append("<img src=''/>");  // 이미지 추가
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#border div:nth-child(5) img").attr("src", data.target.result);              
					}
					reader.readAsDataURL(this.files[4]);
				}else{
					$("#border div:nth-child(5)").empty("<img src=''/>");
				}
			});
			
			//기준인원, 최대인원 수 조절
			$('#next').on("click",function() { 
				var stdmen = $("#stdmen").val();
				var maxmen = $("#maxmen").val();
				
				if(stdmen > maxmen){
					alert("기준인원을 최대인원보다 적게 입력해주세요.")
					return false;
				}
			
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
							<li><a href="<%=request.getContextPath()%>/index/index.do">home</a></li>
							<li><a
								href="<%=request.getContextPath()%>/seller/sellerInfo.do">마이페이지</a></li>
							<li><a
								href="<%=request.getContextPath()%>/seller/sellerRegi.do">숙소관리</a></li>
							<li><a
								href="<%=request.getContextPath()%>/seller/sellerInquire.do">문의</a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="inner">
			<div id="up_nav">
				<ul>
					<li><a href="#" style="color: white">객실수정</a></li>
				</ul>
			</div>
			<form method="post" action="sellerRoomup2.do"
				enctype="multipart/form-data">
				<!--이미지 업로드 -->
				<div class="inputArea" id="main_left">
					<label for="rimage1">사진등록</label> 
					<input type="file" id="rimage1" name="files" multiple />
					<p>** ctrl키를 누르고 있으면 이미지를 여러개 클릭할 수 있습니다.</p>
					<div id="border">
						<div id="imgborder">
							<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${mo.rimage1}" />
							<input type="hidden" name="rimage1" value="${mo.rimage1}">
						</div>
						<div class="imgborder">
							<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${mo.rimage2}" />
							<input type="hidden" name="rimage2" value="${mo.rimage2}">
						</div>
						<div class="imgborder">
							<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${mo.rimage3}" />
							<input type="hidden" name="rimage3" value="${mo.rimage3}">
						</div>
						<div class="imgborder">
							<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${mo.rimage4}" />
							<input type="hidden" name="rimage4" value="${mo.rimage4}">
						</div>
						<div class="imgborder">
							<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${mo.rimage5}" />
							<input type="hidden" name="rimage5" value="${mo.rimage5}">
						</div>
					</div>
				</div>
				<input type="hidden" name="ridx" value="${mo.ridx}">
				<!--정보입력-->
				<div id="main_right">
					<table>
						<tr>
							<td>객실명</td>
							<td><input type="text" name="rtype"
								value="${mo.rtype}" required></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="rprice" pattern="[0-9]+"
								placeholder="숫자를 입력해주세요" value="${mo.rprice}" required></td>
						</tr>
						<tr>
							<td>객실수</td>
							<td><input type="text" name="rnum " pattern="[0-9]+"
								placeholder="숫자를 입력해주세요" value="${mo.rnum}" required></td>
						</tr>
						<tr>
							<td>남은 객실수</td>
							<td><input type="text" name="spareroom " pattern="[0-9]+"
								placeholder="숫자를 입력해주세요" value="${mo.spareroom}"
								required></td>
						</tr>
						<tr>
							<td>기준인원</td>
							<td><input type="text" name="stdmen" id="stdmen" pattern="[0-9]+"
								placeholder="숫자를 입력해주세요" value="${mo.stdmen}" required></td>
						</tr>
						<tr>
							<td>최대인원</td>
							<td><input type="text" name="maxmen" id="maxmen" pattern="[0-9]+"
								placeholder="숫자를 입력해주세요" value="${mo.maxmen}" required /></td>
						</tr>
					</table>
				</div>
				<div id="bottom">
					<div id="bottom_left">
						<div id="up_bottom2">
							<div class="filter1">
								<div id="filter_in" class="filter">
									<p id="info_red">*객실 내 시설과 베드타입을 선택해 주세요</p>
									객실 내 시설
								</div>
								<div class="public_in">
									<ul id="in_left" class="filter_check">
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="roomspa" <c:if test="${mo.roomspa eq 'Y'}">checked</c:if>> <label>${mo.roomspa}객실스파</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="wifi" <c:if test="${mo.wifi eq 'Y'}">checked</c:if>> <label>와이파이</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="tv" <c:if test="${mo.tv eq 'Y'}">checked</c:if>> <label>TV</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="refri" <c:if test="${mo.refri eq 'Y'}">checked</c:if>> <label>냉장고</label></li>
									</ul>
									<ul id="in_middle" class="filter_check">
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="iron" <c:if test="${mo.iron eq 'Y'}">checked</c:if>> <label>다리미</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="bath" <c:if test="${mo.bath eq 'Y'}">checked</c:if>> <label>욕조</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="dryer" <c:if test="${mo.dryer eq 'Y'}">checked</c:if>> <label>드라이기</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="ricecooker" <c:if test="${mo.ricecooker eq 'Y'}">checked</c:if>> <label>전기밥솥</label></li>
									</ul>
									<ul id="in_right" class="filter_check">
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="minibar" <c:if test="${mo.minibar eq 'Y'}">checked</c:if>> <label>미니바</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="bathitem" <c:if test="${mo.bathitem eq 'Y'}">checked</c:if>> <label>욕실용품</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="aircon" <c:if test="${mo.aircon eq 'Y'}">checked</c:if>> <label>에어컨</label></li>
										<li><input type="checkbox" onchange="checkBox(this)"
											class="ch" name="shower" <c:if test="${mo.shower eq 'Y'}">checked</c:if>> <label>객실샤워실</label></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="bed_filter" id="bottom_right">
						<div id="bed_info">베드타입</div>
						<ul>
							<li>
								<p>싱글</p> <input id="B1" type="radio" name="bed"
								value="single_bed" required <c:if test="${mo.bed eq 'single_bed'}">checked</c:if> /> <label for="B1" id="single"></label>
							</li>
							<li>
								<p>더블</p> <input id="B2" type="radio" name="bed"
								value="double_bed" <c:if test="${mo.bed eq 'double_bed'}">checked</c:if> /> <label for="B2" id="double"></label>
							<li>
								<p>트윈</p> <input id="B3" type="radio" name="bed"
								value="twin_bed" <c:if test="${mo.bed eq 'twin_bed'}">checked</c:if> /> <label for="B3" id="twin"></label>
							</li>
							<li>
								<p>온돌</p> <input id="B4" type="radio" name="bed"
								value="ondol_bed" <c:if test="${mo.bed eq 'ondol_bed'}">checked</c:if> /> <label for="B4" id="ondol"></label>
							</li>
						</ul>
					</div>
					<div id="bottom_info">
						<p>추가정보
						<p>
							<input type="text" class="plus2" name="addinfo1"
								value="${mo.addinfo1}">
							<button type="button" name="plus" id="plus" class="btn">
								<img
									src="<%=request.getContextPath()%>/resources/images/seller_images/sellerPlus_image.png"
									alt="추가버튼">
							</button>
							<button type="button" name="minus" id="minus" class="btn">
								<img
									src="<%=request.getContextPath()%>/resources/images/seller_images/sellerMinus_image.png"
									alt="삭제버튼">
							</button>
					</div>
					<div id="inner_bottom">
						<div>
							<button type="submit" name="next" id="next"
								style="color: white; border: 1px solid rgb(86, 19, 241);">완료</button>
						</div>
					</div>
				</div>
			</form>
		</section>
	</main>
	<footer class="fixedclear">
		<div id="foot">

			<br> <br>
			<div id="copy">
				(주)저긴어때 l 대표이사 : 홍이젠 l 사업자 등록번호 : 104-14-100400 l 메일 :
				Whatdoyouthink@naver.com <br> 주소 : 전라북도 전주시 덕진구 금암1동 667-52 5층
				l 전화번호 : 063-104-1004 (오전 9시 ~ 오후 5시)<br> <br> Copyright
				WD COMPANY Corp. All rights reserved. <br> <br>

			</div>
		</div>
	</footer>
</body>
</html>