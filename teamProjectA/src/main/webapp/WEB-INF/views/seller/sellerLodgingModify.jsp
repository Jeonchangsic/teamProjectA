<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="<%=request.getContextPath()%>/resources/css/lodging_css/lodging_reset.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/seller_css/sellerLodgingUp.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/resources/images/lodgingView_images/favicon.jpg" rel="shortcut icon">
    <script src="<%= request.getContextPath() %>/resources/css/jquery-3.6.1.min.js"></script>
    <script>
		//숙소정보입력
		var maxAppend1 = 1;
		var maxAppend2 = 1;
		var maxAppend3 = 1;
		var extcnt1 = 1;
		var extcnt2 = 1;
		var extcnt3 = 1;
		
		$(document).ready(function () {
			if(${hm.area2 != null}){
				$(".area").next().append("<br><br><input type='text' name='area2' class='plus2' value='${hm.area2}' />");
				extcnt1++;
				maxAppend1++;
			}
			if(${hm.area3 != null}){
				$(".area").next().append("<br><br><input type='text' name='area3' class='plus2' value='${hm.area3}' />");
				extcnt1++;
				maxAppend1++;
			}
			if(${hm.area4 != null}){
				$(".area").next().append("<br><br><input type='text' name='area4' class='plus2' value='${hm.area4}' />");
				extcnt1++;
				maxAppend1++;
			}
			if(${hm.area5 != null}){
				$(".area").next().append("<br><br><input type='text' name='area5' class='plus2' value='${hm.area5}' />");
				extcnt1++;
				maxAppend1++;
			}
			if(${hm.basic2 != null}){
				$(".basic").next().append("<br><br><input type='text' name='basic2' class='plus2' value='${hm.basic2}' />");
				extcnt2++;
				maxAppend2++;
			}
			if(${hm.basic3 != null}){
				$(".basic").next().append("<br><br><input type='text' name='basic3' class='plus2' value='${hm.basic3}' />");
				extcnt2++;
				maxAppend2++;
			}
			if(${hm.basic4 != null}){
				$(".basic").next().append("<br><br><input type='text' name='basic4' class='plus2' value='${hm.basic4}' />");
				extcnt2++;
				maxAppend2++;
			}
			if(${hm.basic5 != null}){
				$(".basic").next().append("<br><br><input type='text' name='basic5' class='plus2' value='${hm.basic5}' />");
				extcnt2++;
				maxAppend2++;
			}
			if(${hm.odd2 != null}){
				$(".odd").next().append("<br><br><input type='text' name='odd2' class='plus2' value='${hm.odd2}' />");
				extcnt3++;
				maxAppend3++;
			}
			if(${hm.odd3 != null}){
				$(".odd").next().append("<br><br><input type='text' name='odd3' class='plus2' value='${hm.odd3}' />");
				extcnt3++;
				maxAppend3++;
			}
			if(${hm.odd4 != null}){
				$(".odd").next().append("<br><br><input type='text' name='odd4' class='plus2' value='${hm.odd4}' />");
				extcnt3++;
				maxAppend3++;
			}
			if(${hm.odd5 != null}){
				$(".odd").next().append("<br><br><input type='text' name='odd5' class='plus2' value='${hm.odd5}' />");
				extcnt3++;
				maxAppend3++;
			}
		});
		
	    function clickplus(type,obj){
	    	if(type == "1"){
				if(maxAppend1 >= 5){
					return;
				}else{
					extcnt1++;
					$(obj).parents(".info").next().append("<br><br><input type='text' name='area"+extcnt1+"' class='plus2' placeholder='주변정보를 입력해주세요  (5개까지 입력 가능합니다)' required />");
					maxAppend1++;
				}	
	    	}else if(type == "2"){
				if(maxAppend2 >= 5){
					return;
				}else{
					extcnt2++;
					$(obj).parents(".info").next().append("<br><br><input type='text' name='basic"+extcnt2+"' class='plus2' placeholder='기본정보를 입력해주세요  (5개까지 입력 가능합니다)' required />");
					maxAppend2++;
				}
	    	}else if(type == "3"){
				if(maxAppend3 >= 5){
					return;
				}else{
					extcnt3++;
					$(obj).parents(".info").next().append("<br><br><input type='text' name='odd"+extcnt3+"' class='plus2' placeholder='기타정보를 입력해주세요  (5개까지 입력 가능합니다)' required />");
					maxAppend3++;
				}
	    	}
	    }
	    
	    function clickminus(type,obj){
	    	if(type == "1"){
	    		if(maxAppend1 <= 1){
	    			return;
	    		}else{
					$(obj).parents().next().children("br:last-of-type, .plus2:last-of-type").remove();
					$(obj).parents().next().children("br:last-of-type").remove();
					maxAppend1--;
					extcnt1--;
	    		}
	    	}else if(type == "2"){
	    		if(maxAppend2 <= 1){
	    			return;
	    		}else{
	    			$(obj).parents().next().children("br:last-of-type, .plus2:last-of-type").remove();
					$(obj).parents().next().children("br:last-of-type").remove();
					maxAppend2--;
					extcnt2--;
	    		}
	    	}else if(type == "3"){
	    		if(maxAppend3 <= 1){
	    			return;
	    		}else{					
	    			$(obj).parents().next().children("br:last-of-type, .plus2:last-of-type").remove();
					$(obj).parents().next().children("br:last-of-type").remove();
					maxAppend3--;
					extcnt3--;
	    		}
	    	}
	    }
	    
		$(document).ready(function(){
			
			$("input:checkbox:checked").val("Y");
	    	
			//체크박스 value 변경
			$("input:checkbox").change(function(){
				if(this.checked){
					$(this).attr('value', 'Y');
				}else{
					$(this).attr('value', 'N');
				}
			});
	    
// 			//체크박스 checked
// 	    	$("input:checkbox").each(function(){
// 	    		if($(this).val().equals("Y")){
// 	    			$(this).checked = true;
// 	    		}else{
// 	    			$(this).checked = false;
// 	    		}
// 	    	});
			
	    	//썸네일 이미지
		    $("input:file").change(function(){
				if(this.files && this.files[0]) {
					
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".lodging_img img").attr("src", data.target.result);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
	    	
	    	//셀렉트박스 option selected
	    	$("option").each(function(){
	    		if($(this).val() == "${hm.lodgingkind}"){
	    			$(this).attr("selected","selected");
	    		}else if($(this).val() == "${hm.local}"){
	    			$(this).attr("selected","selected");
	    		}
	    	});
	    	
	    	
	    });
    </script>
</head>
<body>
	<header>
		<div id="header">
			<div id="top">
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
	</header><!-- //header -->
    <main>
    	<form method="post" enctype="multipart/form-data">
	    	<section id="lodgingtb" class="clearfix">
	    		<h2>숙소수정</h2>
	    		<div class="top">
	    			<div class="top_left">
		    			<div class="limage">				
	    					<div>이미지</div>
	    					<input type="file" name="file">
	    					<input type="hidden" name="limagename" value="${hm.limagename}">
	    					<div class="lodging_img">
	    						<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${hm.limagename}" />
	    					</div>	 
	    				</div>  					
	    			</div>
	    			<div class="top_right">
	    				<table>
	    					<tr>
	    						<td>숙소이름</td>
	    						<td><input type="text" required name="lodgingname" value="${hm.lodgingname}"></td>
	    					</tr>
	    					<tr>
	    						<td>숙소종류</td>
	    						<td>
	    							<select required name="lodgingkind">
	    								<option value="모텔">모텔</option>
	    								<option value="호텔">호텔</option>
	    								<option value="펜션/풀빌라">펜션/풀빌라</option>
	    								<option value="GH">게스트하우스</option>
	    							</select>
								</td>
	    					</tr>
	    					<tr>
	    						<td>숙소지역</td>
	    						<td>
									<select required name="local">
										<optgroup label="서울">
											<option value="1002">홍대/신촌/마포</option>
											<option value="1003">북촌/인사동/종로/동대문</option>
											<option value="1004">명동/남산/중구</option>
											<option value="1005">강남/잠실/삼성/서초</option>
											<option value="1006">이태원/서울역/용산</option>
											<option value="1007">영등포/신림/김포공항</option>
										</optgroup>
										<optgroup label="부산">
											<option value="2002">해운대/마린시티</option>
											<option value="2003">광안리/경성대</option>
											<option value="2004">부산역</option>
											<option value="2005">송정/기장</option>
											<option value="2006">자갈치/남포동/영도</option>
										</optgroup>
										<optgroup label="제주">
											<option value="3002">제주시/제주국제공항</option>
											<option value="3003">서귀포시</option>
											<option value="3004">애월/한림/협재</option>
										</optgroup>
										<optgroup label="경기">
											<option value="5002">수원/화성</option>
											<option value="5003">남양주/구리/성남/분당</option>
											<option value="5004">용인/동탄</option>
											<option value="5005">이천/광주/여주/하남</option>
											<option value="5006">가평/청평/양평</option>
											<option value="5007">부천/광명/시흥/안산</option>
										</optgroup>
										<optgroup label="인천">
											<option value="6002">송도/소래포구</option>
											<option value="6003">구읍뱃터/월미</option>
											<option value="6004">인천국제공항/강화/을왕리/영종</option>
											<option value="6005">청라/계양/부평</option>
										</optgroup>
										<optgroup label="강원">
											<option value="7002">속초/양양/고성</option>
											<option value="7003">강릉</option>
											<option value="7004">평창/정선/영월</option>
											<option value="7005">동해/삼척/태백</option>
										</optgroup>
										<optgroup label="경상">
											<option value="8002">경주</option>
											<option value="8003">울산/양산</option>
											<option value="8004">거제/통영</option>
											<option value="8005">포항/영덕/울진/청송</option>
											<option value="8006">창원/마산/진해/김해</option>
										</optgroup>
										<optgroup label="전라">
											<option value="4002">전주/완주</option>
											<option value="4003">광주/나주</option>
											<option value="4004">여수</option>
											<option value="4005">순천/광양/담양/보성/화순</option>
											<option value="4006">군산/익산</option>
											<option value="4007">목포/신안/영광/진도/고흥/영암/완도</option>
										</optgroup>
										<optgroup label="충청">
		    								<option value="9002">대전/세종</option>
											<option value="9003">천안/아산/도고</option>
											<option value="9004">보령/대천/부여/공주/금산</option>
											<option value="9005">청주/음성/진천</option>
	    								</optgroup>
	    							</select>
								</td>
	    					</tr>
	    					<tr>
	    						<td>숙소주소</td>
	    						<td><input type="text" required name="lodgingaddr" value="${hm.lodgingaddr}"></td>
	    					</tr>
	    					<tr>
	    						<td id="intro">숙소소개</td>
	    						<td><textarea name="intro" cols="50" rows="10">${hm.intro}</textarea></td>
	    					</tr>
	    				</table>
	    			</div><!-- //top_right -->    		
	    		</div><!-- //top -->
	    	</section><!-- //lodgingtb -->    	
	    	<section id="fk" class="clearfix">
	    		<div class="middle clearfix">
	    			<div class="intro">- - - - 시설 및 서비스 - - - -</div>
	    			<div class="mid_left">
		    			<div>
		    				<div class="check_name">공용시설</div>
		    				<div class="check_contents">
		    					<ul>
			    					<li><label><input type="checkbox" class="check" name="fitness" <c:if test="${hm.fitness eq 'Y'}">checked</c:if>>피트니스</label></li>
			    					<li><label><input type="checkbox" class="check" name="sauna" <c:if test="${hm.sauna eq 'Y'}">checked</c:if>>사우나</label></li>
			    					<li><label><input type="checkbox" class="check" name="restaurant" <c:if test="${hm.restaurant eq 'Y'}">checked</c:if>>레스토랑</label></li>
			    					<li><label><input type="checkbox" class="check" name="lounge" <c:if test="${hm.lounge eq 'Y'}">checked</c:if>>라운지</label></li>
			    					<li><label><input type="checkbox" class="check" name="bbq" <c:if test="${hm.bbq eq 'Y'}">checked</c:if>>BBQ</label></li>
			    					<li><label><input type="checkbox" class="check" name="publicspa" <c:if test="${hm.publicspa eq 'Y'}">checked</c:if>>공용스파</label></li>
			    					<li><label><input type="checkbox" class="check" name="seminar" <c:if test="${hm.seminar eq 'Y'}">checked</c:if>>세미나실</label></li>
			    					<li><label><input type="checkbox" class="check" name="singing" <c:if test="${hm.singing eq 'Y'}">checked</c:if>>노래방</label></li>
			    					<li><label><input type="checkbox" class="check" name="washingmachine" <c:if test="${hm.washingmachine eq 'Y'}">checked</c:if>>세탁기</label></li>
			    					<li><label><input type="checkbox" class="check" name="dehydrator" <c:if test="${hm.dehydrator eq 'Y'}">checked</c:if>>탈수기</label></li>
			    					<li><label><input type="checkbox" class="check" name="cooking" <c:if test="${hm.cooking eq 'Y'}">checked</c:if>>취사가능</label></li>
			    					<li><label><input type="checkbox" class="check" name="spa" <c:if test="${hm.spa eq 'Y'}">checked</c:if>>온천</label></li>
			    					<li><label><input type="checkbox" class="check" name="golf" <c:if test="${hm.golf eq 'Y'}">checked</c:if>>골프장</label></li>
			    					<li><label><input type="checkbox" class="check" name="elevator" <c:if test="${hm.elevator eq 'Y'}">checked</c:if>>엘리베이터</label></li>
			    					<li><label><input type="checkbox" class="check" name="pc" <c:if test="${hm.pc eq 'Y'}">checked</c:if>>공용PC</label></li>
			    					<li><label><input type="checkbox" class="check" name="cafe" <c:if test="${hm.cafe eq 'Y'}">checked</c:if>>카페</label></li>
			    					<li><label><input type="checkbox" class="check" name="footvolleyball" <c:if test="${hm.footvolleyball eq 'Y'}">checked</c:if>>족구장</label></li>
			    					<li><label><input type="checkbox" class="check" name="store" <c:if test="${hm.store eq 'Y'}">checked</c:if>>편의점</label></li>
			    					<li><label><input type="checkbox" class="check" name="dining" <c:if test="${hm.dining eq 'Y'}">checked</c:if>>주방/식당</label></li>
			    					<li><label><input type="checkbox" class="check" name="dryer" <c:if test="${hm.dryer eq 'Y'}">checked</c:if>>건조기</label></li>
			    					<li><label><input type="checkbox" class="check" name="parking" <c:if test="${hm.parking eq 'Y'}">checked</c:if>>주차장</label></li>
			    					<li><label><input type="checkbox" class="check" name="publicshower" <c:if test="${hm.publicshower eq 'Y'}">checked</c:if>>공용샤워실</label></li>
			    					<li><label><input type="checkbox" class="check" name="ski" <c:if test="${hm.ski eq 'Y'}">checked</c:if>>스키장</label></li>
		    					</ul>
		    				</div>
		    			</div>
	    			</div>
	    			<div class="mid_right">
		    			<div>
		    				<div class="check_name">기타</div>
		    				<div class="check_contents">
		    					<ul>
		    						<li><label><input type="checkbox" class="check" name="pickup" <c:if test="${hm.pickup eq 'Y'}">checked</c:if>>픽업가능</label></li>
		    						<li><label><input type="checkbox" class="check" name="printer" <c:if test="${hm.printer eq 'Y'}">checked</c:if>>프린터사용</label></li>
		    						<li><label><input type="checkbox" class="check" name="locker" <c:if test="${hm.locker eq 'Y'}">checked</c:if>>개인사물함</label></li>
		    						<li><label><input type="checkbox" class="check" name="breakfast" <c:if test="${hm.breakfast eq 'Y'}">checked</c:if>>조식포함</label></li>
		    						<li><label><input type="checkbox" class="check" name="valetparking" <c:if test="${hm.valetparking eq 'Y'}">checked</c:if>>발렛파킹</label></li>
		    						<li><label><input type="checkbox" class="check" name="dog" <c:if test="${hm.dog eq 'Y'}">checked</c:if>>반려견동반</label></li>    						
		    						<li><label><input type="checkbox" class="check" name="inroomcooking" <c:if test="${hm.inroomcooking eq 'Y'}">checked</c:if>>객실내취사</label></li>
		    						<li><label><input type="checkbox" class="check" name="keepluggage" <c:if test="${hm.keepluggage eq 'Y'}">checked</c:if>>짐보관가능</label></li>
		    						<li><label><input type="checkbox" class="check" name="freeparking" <c:if test="${hm.freeparking eq 'Y'}">checked</c:if>>무료주차</label></li>    						
		    						<li><label><input type="checkbox" class="check" name="inroomsmoking" <c:if test="${hm.inroomsmoking eq 'Y'}">checked</c:if>>객실내흡연</label></li>
		    						<li><label><input type="checkbox" class="check" name="nosmoking" <c:if test="${hm.nosmoking eq 'Y'}">checked</c:if>>금연</label></li>
		    						<li><label><input type="checkbox" class="check" name="creditcard" <c:if test="${hm.creditcard eq 'Y'}">checked</c:if>>카드결제</label></li>
		    					</ul>
		    				</div>
		    			</div>
	    			</div>    		
	    		</div><!-- //middle -->   
	    		<div class="bottom">
	    			<div class="intro">- - - - 기본정보 - - - -</div>
	    			<div class="info area">
	    				<p>주변정보</p>
	    				<input type="text" name="area1" class="plus" placeholder="주변정보를 입력해주세요  (5개까지 입력 가능합니다)" value="${hm.area1}" />
	    				<button type="button" name="plus" onclick="clickplus(1,this)">+</button>
	    				<button type="button" name="minus" onclick="clickminus(1,this)">-</button>
	    			</div>
	    			<div class="space"></div>
	    			<div class="info basic">
	    				<p>기본정보</p>
	    				<input type="text" name="basic1" class="plus" placeholder="기본정보를 입력해주세요  (5개까지 입력 가능합니다)" value="${hm.basic1}" />
	    				<button type="button" name="plus" onclick="clickplus(2,this)">+</button>
	    				<button type="button" name="minus" onclick="clickminus(2,this)">-</button>
	    			</div>
	    			<div class="space"></div>
	    			<div class="info odd">
	    				<p>확인사항 및 기타</p>
	    				<input type="text" name="odd1" class="plus" placeholder="기타정보를 입력해주세요  (5개까지 입력 가능합니다)" value="${hm.odd1}" />
	    				<button type="button" name="plus" onclick="clickplus(3,this)">+</button>
	    				<button type="button" name="minus" onclick="clickminus(3,this)">-</button>
	    			</div>   
	    			<div class="space"></div> 			
	    		</div> 	
	    	</section>
	    	<div class="btn_submit">
	    		<button>수정</button>
	    	</div>
	    </form>
    </main><!-- //main -->
    <footer class="clearfix">
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