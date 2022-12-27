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
		var extcnt = 1;
		
		$(document).ready(function () {
			
			if(${hm.area2 != null}){
				extcnt++;
				$(obj).parents(".info").next().append("<br><br><input type='text' name='area"+extcnt+"' class='plus2' value='${hm.area2}' />");
				maxAppend1++;
			}
			if(${hm.area3 != null}){
				extcnt++;
				$(obj).parents(".info").next().append("<br><br><input type='text' name='area"+extcnt+"' class='plus2' value='${hm.area3}' />");
				maxAppend1++;
			}
			if(${hm.area4 != null}){
				extcnt++;
				$(obj).parents(".info").next().append("<br><br><input type='text' name='area"+extcnt+"' class='plus2' value='${hm.area4}' />");
				maxAppend1++;
			}
			if(${hm.area5 != null}){
				extcnt++;
				$(obj).parents(".info").next().append("<br><br><input type='text' name='area"+extcnt+"' class='plus2' value='${hm.area5}' />");
				maxAppend1++;
			}
			
			clickplus();
		});
		
	    function clickplus(type,obj){
	    	if(type == "1"){
				if(maxAppend1 >= 5){
					return;
				}else{
					extcnt++;
					$(obj).parents(".info").next().append("<br><br><input type='text' name='area"+extcnt+"' class='plus2' placeholder='주변정보를 입력해주세요  (5개까지 입력 가능합니다)'/>");
					maxAppend1++;
				}	
	    	}else if(type == "2"){
				if(maxAppend2 >= 5){
					return;
				}else{
					extcnt++;
					$(obj).parents(".info").next().append("<br><br><input type='text' name='basic"+extcnt+"' class='plus2' placeholder='기본정보를 입력해주세요  (5개까지 입력 가능합니다)'/>");
					maxAppend2++;
				}
	    	}else if(type == "3"){
				if(maxAppend3 >= 5){
					return;
				}else{
					extcnt++;
					$(obj).parents(".info").next().append("<br><br><input type='text' name='odd"+extcnt+"' class='plus2' placeholder='기타정보를 입력해주세요  (5개까지 입력 가능합니다)'/>");
					maxAppend3++;
				}
	    	}
	    }
	    
		$(document).ready(function(){
	    	
		    //체크박스 value 변경
			$("input:checkbox").change(function(){
				if(this.checked){
					$(this).attr('value', 'Y');
				}else{
					$(this).attr('value', 'N');
				}
			});
	    
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
	    	
	    	//체크박스 checked
	    	$("input:checkbox").each(function(){
	    		if($(this).val().equals("Y")){
	    			$(this).checked = true;
	    		}else{
	    			$(this).checked = false;
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
			    					<li><input type="checkbox" class="check" name="FITNESS">피트니스</li>
			    					<li><input type="checkbox" class="check" name="SAUNA">사우나</li>
			    					<li><input type="checkbox" class="check" name="RESTAURANT">레스토랑</li>
			    					<li><input type="checkbox" class="check" name="LOUNGE">라운지</li>
			    					<li><input type="checkbox" class="check" name="BBQ">BBQ</li>
			    					<li><input type="checkbox" class="check" name="PUBLICSPA">공용스파</li>
			    					<li><input type="checkbox" class="check" name="SEMINAR">세미나실</li>
			    					<li><input type="checkbox" class="check" name="SINGING">노래방</li>
			    					<li><input type="checkbox" class="check" name="WASHINGMACHINE">세탁기</li>
			    					<li><input type="checkbox" class="check" name="DEHYDRATOR">탈수기</li>
			    					<li><input type="checkbox" class="check" name="COOKING">취사가능</li>
			    					<li><input type="checkbox" class="check" name="spa">온천</li>
			    					<li><input type="checkbox" class="check" name="pool">수영장</li>
			    					<li><input type="checkbox" class="check" name="golf">골프장</li>
			    					<li><input type="checkbox" class="check" name="elevator">엘리베이터</li>
			    					<li><input type="checkbox" class="check" name="pc">공용PC</li>
			    					<li><input type="checkbox" class="check" name="cafe">카페</li>
			    					<li><input type="checkbox" class="check" name="footvolleyball">족구장</li>
			    					<li><input type="checkbox" class="check" name="store">편의점</li>
			    					<li><input type="checkbox" class="check" name="dining">주방/식당</li>
			    					<li><input type="checkbox" class="check" name="dryer">건조기</li>
			    					<li><input type="checkbox" class="check" name="parking">주차장</li>
			    					<li><input type="checkbox" class="check" name="publicshower">공용샤워실</li>
			    					<li><input type="checkbox" class="check" name="ski">스키장</li>
		    					</ul>
		    				</div>
		    			</div>
	    			</div>
	    			<div class="mid_right">
		    			<div>
		    				<div class="check_name">기타</div>
		    				<div class="check_contents">
		    					<ul>
		    						<li><input type="checkbox" class="check" name="pickup">픽업가능</li>
		    						<li><input type="checkbox" class="check" name="printer">프린터사용</li>
		    						<li><input type="checkbox" class="check" name="locker">개인사물함</li>
		    						<li><input type="checkbox" class="check" name="breakfast">조식포함</li>
		    						<li><input type="checkbox" class="check" name="valetparking">발렛파킹</li>
		    						<li><input type="checkbox" class="check" name="dog">반려견동반</li>    						
		    						<li><input type="checkbox" class="check" name="inroomcooking">객실내취사</li>
		    						<li><input type="checkbox" class="check" name="keepluggage">짐보관가능</li>
		    						<li><input type="checkbox" class="check" name="freeparking">무료주차</li>    						
		    						<li><input type="checkbox" class="check" name="inroomsmoking">객실내흡연</li>
		    						<li><input type="checkbox" class="check" name="nosmoking">금연</li>
		    						<li><input type="checkbox" class="check" name="creditcard">카드결제</li>
		    					</ul>
		    				</div>
		    			</div>
	    			</div>    		
	    		</div><!-- //middle -->   
	    		<div class="bottom">
	    			<div class="intro">- - - - 기본정보 - - - -</div>
	    			<div class="info">
	    				<p>주변정보</p>
	    				<input type="text" name="area1" class="plus" placeholder="주변정보를 입력해주세요  (5개까지 입력 가능합니다)" value="${hm.area1}" />
	    				<button type="button" name="plus" onclick="clickplus(1,this)">+</button>
	    			</div>
	    			<div class="space"></div>
	    			<div class="info">
	    				<p>기본정보</p>
	    				<input type="text" name="basic1" class="plus" placeholder="기본정보를 입력해주세요  (5개까지 입력 가능합니다)" value="${hm.basic1}" />
	    				<button type="button" name="plus" onclick="clickplus(2,this)">+</button>
	    			</div>
	    			<div class="space"></div>
	    			<div class="info">
	    				<p>확인사항 및 기타</p>
	    				<input type="text" name="odd1" class="plus" placeholder="기타정보를 입력해주세요  (5개까지 입력 가능합니다)" value="${hm.odd1}" />
	    				<button type="button" name="plus" onclick="clickplus(3,this)">+</button>
	    			</div>   
	    			<div class="space"></div> 			
	    		</div> 	
	    	</section>
	    	<div class="btn_submit">
	    		<button>등록</button>
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