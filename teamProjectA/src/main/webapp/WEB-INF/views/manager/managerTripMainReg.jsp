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
    <link href="<%=request.getContextPath()%>/resources/css/manager_css/managerTripMainReg.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!--XE아이콘-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> 
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
    <!-- 리스트 영역 클릭된 항목 백그라운드 효과 -->
	<script>
		window.onload =function(){
			 var div2 = document.getElementsByClassName("clickEvent");
			 function handleClick(event) {
			        if (event.target.classList[1] === "changeColor") {
			          event.target.classList.remove("changeColor");
			        } else {
			          for (var i = 0; i < div2.length; i++) {
			            div2[i].classList.remove("changeColor");
			          }
			          event.target.classList.add("changeColor");
			        }
			      }
			      function init() {
			        for (var i = 0; i < div2.length; i++) {
			          div2[i].addEventListener("click", handleClick);
			        }
			      }
			      init();
		};
	</script>
	
	<!-- 여행지 등록 -->
	<script>
		function tripReg(){
			var tidx = $(".changeColor > input").val();
			var tCnt = $(".clickEvent > .inputCnt").length;
			if(tCnt >= 6){
				alert("여행지 등록은 최대 6개까지만 가능합니다.");
			}else{
				if(tidx == null){
					alert("등록할 항목을 선택해 주세요.");
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/ajax/tripReg.do",
						type:"get",
						data:"tidx="+tidx,
						success:function(data){
							location.reload();
						}
					});
				}
			}
		};
	</script>
	<!-- 여행지 삭제 -->
	<script>
		function tripRegDt(){
			var tidx = $(".changeColor > input").val();
			
			if(tidx == null){
				alert("삭제할 항목을 선택해 주세요.");
			}else{
				$.ajax({
					url:"<%=request.getContextPath()%>/ajax/tripRegDt.do",
					type:"get",
					data:"tidx="+tidx,
					success:function(data){
						location.reload();
					}
				});
			}
		};
	</script>
	<!-- 페스티발 등록 리스트 미리보기 팝업창 -->
     <script>
     function preview(){
    	var url = "<%=request.getContextPath()%>/manager/tripListPreview.do";
 		var winWidth = 950;
 	    var winHeight = 270;
 	  	var popupX = (window.screen.width / 2) - (950 / 2);
 	  	var popupY= (window.screen.height / 2) - (270 / 2);
 	  	var popupOption= "width="+winWidth+", height="+winHeight+",left="+popupX+",top="+popupY;    //팝업창 옵션(optoin)
 		window.open(url,"",popupOption);
     };
     </script>
</head>
<body>
    <header>
        <h2 class="font_Style">메인 리스트 관리</h2>
    </header>
    <div id="headLine"></div>
                <!--end header-->
    <div id="main_Area">
	    <div class="list_Style">
	    	<span>여행지 항목</span>
	    	<c:forEach var ="notVO" items="${notVO}">
	    		<div class="select_Div clickEvent">
	    			<input type="hidden" value="${notVO.tidx}"/>
	    			<p class="clickEvent">[${notVO.tAddr}]</p> 
	    		${notVO.tName}
	    		</div>
	   		</c:forEach>
  		</div>
	   	<div id="btn_div">
	   		<button onclick="tripReg()" class="first_btn"><i class="xi-arrow-right"></i></button>
	   		<button onclick="tripRegDt()" class="last_btn"><i class="xi-arrow-left"></i></button>
	   	</div>
	   	<div class="list_Style">
	   		<span>등록된 리스트</span>
		    <c:forEach var ="vo" items="${vo}">
	    		<div class="select_Div clickEvent">
	    			<input type="hidden" value="${vo.tidx}" class="inputCnt"/>
	    			<p class="clickEvent">[${vo.tAddr}]</p> 
	    		${vo.tName}
	    		</div>
	    	</c:forEach>
	   	</div>
	</div>
	<div id="test_btnArea">
   		<button type="button" onclick="preview()">리스트 미리보기</button>
   	</div>
	<div class="guide_Area">
		<h3>안내사항</h3>
		<ul>
			<li>등록 / 제거 시에는 해당 항목을 한 개씩 등록 / 제거  해야 합니다.</li>
			<li>리스트 등록은 최대 6개까지 가능합니다.</li>
			<li>메인 리스트의 정렬 순서는 등록된 순서입니다.</li>
			<li>등록 시 발생하는 오차 범위로 인해 리스트 순서에 오차가 생길 수 있습니다.</li>
			<li>등록된 리스트는 미리보기 버튼을 통해 보실 수 있습니다.</li>
		</ul>
	</div>
	<div id="btn_Area">
		<button type="button" onclick="opener.parent.location.reload(); window.close();" id="clear_btn">확인</button>
	</div>
</body>
</html>