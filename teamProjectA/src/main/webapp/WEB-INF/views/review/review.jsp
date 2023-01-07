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
    <link href="<%=request.getContextPath()%>/resources/css/review_css/review.css" rel="stylesheet"/>
    <!-- 파비콘 -->
    <link href="<%=request.getContextPath() %>/resources/images/login_images/logo2.svg" rel="shortcut icon">
    <!---- jQuery ---->
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
     
     <!-- 리뷰 content영역 글자 제한 -->
     <script>
     	$(document).ready(function(){
     		$("#info").on("keyup",function(){
     			$("#content_cnt").html("("+$(this).val().length+"/100)");
     			
     			if($(this).val().length > 100){
     				$(this).val($(this).val().substring(0,100));
     				$("#content_cnt").html("(100/100)");
     			}
     		});
     	});
     </script>
     
     <!-- 만족도 별점처리 -->
     <script>
	     function Rating(){};
	     Rating.prototype.rate = 0;
	     Rating.prototype.setRate = function(newrate){
	         //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
	         this.rate = newrate;
	         let items = document.querySelectorAll('.rate_radio');
	         items.forEach(function(item, idx){
	             if(idx < newrate){
	                 item.checked = true;
	             }else{
	                 item.checked = false;
	             }
	         });
	     }
	     let rating = new Rating();
	     
	     document.addEventListener('DOMContentLoaded', function(){
	    	    //별점선택 이벤트 리스너
	    	    document.querySelector('.rating').addEventListener('click',function(e){
	    	        let elem = e.target;
	    	        if(elem.classList.contains('rate_radio')){
	    	            rating.setRate(parseInt(elem.value));
	    	        }
	    	    })
	    	});
     </script>
</head>
<body>
    <header>
        <h2 class="font_Style">리뷰쓰기</h2>
    </header>
    <div id="headLine"></div>
                <!--end header-->

    <main>
        <div id="contentsArea">
            <form name="frm" action="<%=request.getContextPath() %>/review/review.do?lidx=${lidx}&ridx=${ridx}&reserv_idx=${reserv_idx}" method="POST">
                <table id="table1">
                	<tr>
                		<td class="td_vertical-align td_padding1"><img id="review_Img" src="<%=request.getContextPath()%>/resources/images/lodging_images/${limagename}"/> </td>
                		<td class="td_vertical-align td_padding2">
                			<div id="lodgingText" class="font_Style font_StyleBold">${lodgingname}</div>
                			<div id="rtypeText" class="font_Style">[${rtype}]</div>
                			<div id="dateText" class="font_Style">[${reserv_startDate}~${reserv_endDate}]</div>
                		</td>
                	</tr>
                	<tr>
                		<td class="tr_background"></td>
                		<td class="tr_background"></td>
                	</tr>
                    <tr>
                        <td class="margin2 vertical_middle font_Style font_StyleBold">만족도</td>
                        <td class="satisfactionStyle vertical_middle">
                        	<div class="rating">
				                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
				                <input type="checkbox"  name="rvSatisfactionAry" id="rating1" value="1.0" class="rate_radio" title="1.0" checked>
				                <label for="rating1"></label>
				                <input type="checkbox"  name="rvSatisfactionAry" id="rating2" value="2.0" class="rate_radio" title="2.0">
				                <label for="rating2"></label>
				                <input type="checkbox"  name="rvSatisfactionAry" id="rating3" value="3.0" class="rate_radio" title="3.0">
				                <label for="rating3"></label>
				                <input type="checkbox"  name="rvSatisfactionAry" id="rating4" value="4.0" class="rate_radio" title="4.0">
				                <label for="rating4"></label>
				                <input type="checkbox"  name="rvSatisfactionAry" id="rating5" value="5.0" class="rate_radio" title="5.0">
				                <label for="rating5"></label>
				            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="margin1 vertical_middle font_Style font_StyleBold">제목</td>
                        <td class="vertical_middle">
                        	<input type="text" class="info font_Style" name="rvTitle" placeholder="10자 이내 제목을 입력하세요." maxlength="10" required>
                        </td> 
                    </tr>
                    <tr>
                        <td id="margin1" class="vertical_middle font_Style font_StyleBold">리뷰 내용</td>
                        <td class="vertical_middle reviewContentArea">
                            <textarea id="info" class="font_Style" name="rvContent" cols="30" rows="10" placeholder="공백 포함 100자 이내 리뷰를 작성해주세요." required></textarea>
                        	<div id="content_cnt">(0/100)</div>
                        </td>
                    </tr>
                </table>
                <table id="table2">
                    <tr>
                        <td>
                            <input class="cursorStyle font_Style" type="submit" id="clearBtn" value="작성"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </main>
</body>
</html>