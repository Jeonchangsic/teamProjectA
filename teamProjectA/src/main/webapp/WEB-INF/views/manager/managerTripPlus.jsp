<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저긴어때</title>
    <link href="<%=request.getContextPath()%>/resources/css/manager_css/managerTripPlus.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     <!-- 리뷰 content영역 글자 제한 -->
     <script>
     	$(document).ready(function(){
     		$("#info").on("keyup",function(){
     			$("#content_cnt").html("("+$(this).val().length+"/300)");
     			
     			if($(this).val().length > 300){
     				$(this).val($(this).val().substring(0,300));
     				$("#content_cnt").html("(300/300)");
     			}
     		});
     	});
     </script>
     <!-- 위도/경도 추출을 위한 지도 팝업창 -->
     <script>
     	function map_On(){
     		var url = "<%=request.getContextPath()%>/manager/mapOn.do";
     		var winWidth = 700;
     	    var winHeight = 450;
     	  	var popupX = (window.screen.width / 2) - (700 / 2);
     	  	var popupY= (window.screen.height / 2) - (450 / 2);
     	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
     		window.open(url,"",popupOption);
         };
     </script>
</head>
<body>
    <header>
        <h2 class="font_Style">인기 여행지 추가</h2>
    </header>
    <div id="headLine"></div>
                <!--end header-->
    <form action="tripPlus.do" method="POST">
	    <table>
	    	<tr>
	    		<td id="first_td" class="font_Style font_StyleBold">여행지명</td>
	    		<td>
	    			<input type="text" name="tName" maxlength="10"  placeholder="10자 이내로 작성해주세요." required/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="font_Style font_StyleBold">지역선택</td>
	    		<td>
	    			<select id="select_Style" name="tAddr">
						<optgroup label="경기도">
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<option value="연천">연천</option>
							<option value="포천">포천</option>
							<option value="파주">파주</option>
							<option value="동두천">동두천</option>
							<option value="양주">양주</option>
							<option value="가평">가평</option>
							<option value="의정부">의정부</option>
							<option value="고양">고양</option>
							<option value="김포">김포</option>
							<option value="강화">강화</option>
							<option value="남양주">남양주</option>
							<option value="구리">구리</option>
							<option value="부천">부천</option>
							<option value="인천">인천</option>
							<option value="하남">하남</option>
							<option value="양평">양평</option>
							<option value="광명">광명</option>
							<option value="과천">과천</option>
							<option value="안양">안양</option>
							<option value="시흥">시흥</option>
							<option value="안산">안산</option>
							<option value="군포">군포</option>
							<option value="의왕">의왕</option>
							<option value="성남">성남</option>
							<option value="광주">광주</option>
							<option value="수원">수원</option>
							<option value="용인">용인</option>
							<option value="화성">화성</option>
							<option value="오산">오산</option>
							<option value="평택">평택</option>
							<option value="안성">안성</option>
							<option value="이천">이천</option>
							<option value="여주">여주</option>
						</optgroup>
						<optgroup label="강원도">
							<option value="강릉">강릉</option>
							<option value="고성">고성</option>
							<option value="동해">동해</option>
							<option value="철원">철원</option>
							<option value="화천">화천</option>
							<option value="양구">양구</option>
							<option value="인제">인제</option>
							<option value="춘천">춘천</option>
							<option value="속초">속초</option>
							<option value="양양">양양</option>
							<option value="홍천">홍천</option>
							<option value="횡성">횡성</option>
							<option value="평창">평창</option>
							<option value="원주">원주</option>
							<option value="영월">영월</option>
							<option value="정선">정선</option>
							<option value="태백">태백</option>
							<option value="삼척">삼척</option>
						</optgroup>
						<optgroup label="충청도">
							<option value="태안">태안</option>
							<option value="서산">서산</option>
							<option value="당진">당진</option>
							<option value="아산">아산</option>
							<option value="천안">천안</option>
							<option value="진천">진천</option>
							<option value="음성">음성</option>
							<option value="충주">충주</option>
							<option value="제천">제천</option>
							<option value="단양">단양</option>
							<option value="홍성">홍성</option>
							<option value="예산">예산</option>
							<option value="공주">공주</option>
							<option value="연기">연기</option>
							<option value="청주">청주</option>
							<option value="청원">청원</option>
							<option value="괴산">괴산</option>
							<option value="보령">보령</option>
							<option value="청양">청양</option>
							<option value="세종">세종</option>
							<option value="보은">보은</option>
							<option value="서천">서천</option>
							<option value="부여">부여</option>
							<option value="논산">논산</option>
							<option value="대전">대전</option>
							<option value="옥천">옥천</option>
							<option value="금산">금산</option>
							<option value="영동">영동</option>
						</optgroup>
						<optgroup label="경상도">
							<option value="문경">문경</option>
							<option value="예천">예천</option>
							<option value="영주">영주</option>
							<option value="봉화">봉화</option>
							<option value="울진">울진</option>
							<option value="상주">상주</option>
							<option value="의성">의성</option>
							<option value="안동">안동</option>
							<option value="영양">영양</option>
							<option value="김천">김천</option>
							<option value="구미">구미</option>
							<option value="군위">군위</option>
							<option value="영천">영천</option>
							<option value="청송">청송</option>
							<option value="영덕">영덕</option>
							<option value="성주">성주</option>
							<option value="칠곡">칠곡</option>
							<option value="영천">영천</option>
							<option value="포항">포항</option>
							<option value="고령">고령</option>
							<option value="대구">대구</option>
							<option value="경산">경산</option>
							<option value="경주">경주</option>
							<option value="청도">청도</option>
						</optgroup>
						<optgroup label="전라도">
							<option value="전주">전주</option>
							<option value="군산">군산</option>
							<option value="익산">익산</option>
							<option value="남원">남원</option>
							<option value="정읍">정읍</option>
							<option value="김제">김제</option>
							<option value="완주">완주</option>
							<option value="진안">진안</option>
							<option value="무주">무주</option>
							<option value="장수">장수</option>
							<option value="임실">임실</option>
							<option value="순창">순창</option>
							<option value="고창">고창</option>
							<option value="부안">부안</option>
							<option value="목포">목포</option>
							<option value="여수">여수</option>
							<option value="순천">순천</option>
							<option value="나주">나주</option>
							<option value="광양">광양</option>
							<option value="담양">담양</option>
							<option value="곡성">곡성</option>
							<option value="구례">구례</option>
							<option value="고흥">고흥</option>
							<option value="보성">보성</option>
							<option value="화순">화순</option>
							<option value="장흥">장흥</option>
							<option value="강진">강진</option>
							<option value="해남">해남</option>
							<option value="영암">영암</option>
							<option value="무안">무안</option>
							<option value="함평">함평</option>
							<option value="영광">영광</option>
							<option value="장성">장성</option>
							<option value="완도">완도</option>
							<option value="진도">진도</option>
							<option value="신안">신안</option>
						</optgroup>
						<optgroup label="제주도">
							<option value="제주">제주</option>
							<option value="애월">애월</option>
							<option value="한림">한림</option>
							<option value="한경">한경</option>
							<option value="대정">대정</option>
							<option value="안덕">안덕</option>
							<option value="중문">중문</option>
							<option value="서귀포">서귀포</option>
							<option value="남원">남원</option>
							<option value="표선">표선</option>
							<option value="성산">성산</option>
							<option value="구좌">구좌</option>
							<option value="초천">초천</option>
						</optgroup>
	    			</select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="font_Style font_StyleBold">간략설명</td>
	    		<td>
	    			<input type="text" name="tSubContent" maxlength="15"  placeholder="15자 이내로 작성해주세요." required/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td id="middle" class="font_Style font_StyleBold">여행지설명</td>
	    		<td id="textarea_Style">
	    			<textarea id="info" cols="30" rows="10" name="tMainContent" maxlength="300"  placeholder="300자 이내로 작성해주세요." required></textarea>
	    			<div id="content_cnt">(0/300)</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="font_Style font_StyleBold">페이지링크</td>
	    		<td>
	    			<input type="text" name="tLink" maxlength="400" placeholder="예: http://www.chunhyang.org" required/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="font_Style font_StyleBold" >지도좌표</td>
	    		<td>
	    			<input id="map_Input" type="text" name="tLatitude" placeholder="위도를 입력하세요."/>
	    			<input id="map_Input2" type="text" name="tLongitude" placeholder="경도를 입력하세요."/>
	    			<button type="button" onclick="map_On()" id="map_Btn">지도펼치기</button>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td class="font_Style font_StyleBold">메인이미지</td>
	    		<td>
	    			<input id="file_Input" type="file" name="tImgName" maxlength="50" required/>
	    		</td>
	    	</tr>
	    </table>
    <div id="btn_Area">
		<button id="btn_Style">작성</button>
    </div>
	</form>
</body>
</html>