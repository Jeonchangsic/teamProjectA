<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
        <div id="inner">
            <h1>
            	<a href="<%=request.getContextPath()%>/index/index.do">
            		<img src="<%=request.getContextPath() %>/resources/images/index_images/logo.svg" alt="저긴어때">
            	</a>
            </h1>
            <ul>
	            <div class="search_background">
	            </div>
	                <li id="searchArea">
	                    <select name="searchType" class="search_bar font_Style" id="search_bar">
	                     	<option value="n"<c:out value="${searchType == null ? 'selected' : ''}"/>>-----</option>
	                     	<option value="ln"<c:out value="${searchType eq 'ln' ? 'selected' : ''}"/>>숙소명</option>
	                     	<option value="la"<c:out value="${searchType eq 'la' ? 'selected' : ''}"/>>지역</option>
	                     </select>
	                     <input type="text" name="keyword" id="keywordInput" class="font_Style" value="${keyword}"/>
	                	   	 <button class="btn-1 font_Style" type="button" id="searchBtn">검색</button>
	                </li>
                <li>
                	<a class="searchBarOn">
                		<i class="xi-search"></i>
                	</a>
                </li>
                <li>
                	<c:if test="${login == null }">
                		<a href="<%=request.getContextPath() %>/login/login.do" id="login" class="font_Style">로그인</a>
                	</c:if> 
                	<c:if test="${login.userType.equals('일반회원')}">
						<a href="<%=request.getContextPath() %>/logout/logout.do" class="logout font_Style">로그아웃</a>
						<a href="<%=request.getContextPath() %>/mypage/info.do" id="mypage" class="font_Style">마이페이지</a>
					</c:if> 
					 <c:if test="${login.userType.equals('판매자')}">
						<a href="<%=request.getContextPath() %>/logout/logout.do" class="logout font_Style">로그아웃</a>
						<a href="<%=request.getContextPath() %>/seller/sellerInfo.do" id="seller" class="font_Style">판매자페이지</a>
					</c:if>
					<c:if test="${login.userType.equals('관리자')}">
						<a href="<%=request.getContextPath() %>/logout/logout.do" class="logout font_Style" >로그아웃</a>
						<a href="<%=request.getContextPath() %>/manager/managerUser.do" id="manager" class="font_Style">관리자페이지</a>
					</c:if>
                </li>  
                                                 <!-- 폰트 스타일 수정-->
            </ul>
               
        </div>
    </header>