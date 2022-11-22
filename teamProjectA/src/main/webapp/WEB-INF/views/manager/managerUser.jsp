<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자회원관리</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerUser.css">
<script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
</head>
<body style="overflow-x: hidden">
    <div id="header">
        <div class="top">
            <h3>관리자페이지</h3>
            <div id="manager">
                <ul>
                    <li>home</li>
                    <li>회원관리</li>
                    <li>숙소관리</li>
                    <li>리뷰관리</li>
                </ul>
            </div>
        </div>
    </div>
    <main class="inner">
        <nav>
            <div class="nav">
                <li id="user_list" onclick="click()">회원리스트</li>
                <li id="user2_list" onclick="click()">업체회원리스트</li>
                <li id="reserv_list" onclick="click()">예약내역</li>
                <li id="qna_list" onclick="click()">문의내역</li>
            </div>
        </nav>
       
        <div id="user_section">
            <h3>회원목록</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option value="id">아이디</option>
                            <option value="nickname">닉네임</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="keyword" size="30">
                    </td>
                    <td>
                        <button class="btn" type="submit" name="submit">검색</button>
                    </td>
                </tr>
            </tbody>
        </form>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>ID</th>
                    <th>닉네임</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>test</td>
                    <td>010-0000-0000</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>test</td>
                    <td>010-0011-1200</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>test</td>
                    <td>010-4400-1200</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>test</td>
                    <td>010-2311-1111</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>test</td>
                    <td>010-1414-1313</td>
                    <td>daadasa@naver.com</td>
                </tr>
            </tbody>
        </table>
        <ul>
            <li>
                <a href="">1</a>
            </li>
        </ul>
       </div>
        <div id="user2_section">
            <h3>업체회원목록</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option value="id">아이디</option>
                            <option value="nickname">업체명</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="keyword" size="30">
                    </td>
                    <td>
                        <button class="btn" type="submit" name="submit">검색</button>
                    </td>
                </tr>
            </tbody>
        </form>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>ID</th>
                    <th>업체명</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>A호텔</td>
                    <td>010-0000-0000</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>A모텔</td>
                    <td>010-0011-1200</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>B펜션</td>
                    <td>010-4400-1200</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>C풀빌라</td>
                    <td>010-2311-1111</td>
                    <td>daadasa@naver.com</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">test</a></td>
                    <td>D펜션</td>
                    <td>010-1414-1313</td>
                    <td>daadasa@naver.com</td>
                </tr>
            </tbody>
        </table>
        <ul>
            <li>
                <a href="">1</a>
            </li>
        </ul>
    </div>
        <div id="reserv_section">
            <h3>예약내역</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option value="id">닉네임</option>
                            <option value="nickname">예약번호</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="keyword" size="30">
                    </td>
                    <td>
                        <button class="btn" type="submit" name="submit">검색</button>
                    </td>
                </tr>
            </tbody>
        </form>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>닉네임</th>
                    <th>예약장소</th>
                    <th>예약번호</th>
                    <th>예약날짜</th>
                    <th>금액</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td>test</td>
                    <td>A호텔</td>
                    <td>202210271028</td>
                    <td>2022-10-27~2022-10-28</td>
                    <td>150,000원</td>
                </tr>
                <tr style="text-align:center;">
                    <td>test</td>
                    <td>A모텔</td>
                    <td>202210251026</td>
                    <td>2022-10-25~2022-10-26</td>
                    <td>70,000원</td>
                </tr>
                <tr style="text-align:center;">
                    <td>test</td>
                    <td>B펜션</td>
                    <td>202210231024</td>
                    <td>2022-10-23~2022-10~24</td>
                    <td>280,000원</td>
                </tr>
                <tr style="text-align:center;">
                    <td>test</td>
                    <td>C풀빌라</td>
                    <td>202210211022</td>
                    <td>2022-10-21~2022-10-22</td>
                    <td>400,000원</td>
                </tr>
                <tr style="text-align:center;">
                    <td>test</td>
                    <td>D펜션</td>
                    <td>202210101011</td>
                    <td>2022-10-10~2022-10-11</td>
                    <td>250,000원</td>
                </tr>
            </tbody>
        </table>
        <ul>
            <li>
                <a href="">1</a>
            </li>
        </ul>
    </div>
        <div id="qna_section">
            <h3>문의내역</h3>
             
        <hr/>
        <form>
            <tbody>
                <tr>
                    <td>
                        <select class="frm_select">
                            <option value="nickname">일반회원</option>
                            <option value="nickname">업체회원</option>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="keyword" size="30">
                    </td>
                    <td>
                        <button class="btn" type="submit" name="submit">검색</button>
                    </td>
                </tr>
            </tbody>
        </form>
        <table>
            <thead>
                <tr style="text-align:center;">
                    <th>제목</th>
                    <th>작성자/작성일</th>
                    <th>상태</th>
                    <th>구분</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align:center;">
                    <td><a href="">문의</a></td>
                    <td>test6/2022-10-29</td>
                    <td>처리중</td>
                    <td>업체회원</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">알려죠</a></td>
                    <td>test4/2022-10-26</td>
                    <td>처리중</td>
                    <td>일반회원</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">몰라요</a></td>
                    <td>test3/2022-10-24</td>
                    <td>처리완료</td>
                    <td>일반회원</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">얼마에요</a></td>
                    <td>test1/2022-10-23</td>
                    <td>처리완료</td>
                    <td>일반회원</td>
                </tr>
                <tr style="text-align:center;">
                    <td><a href="">빨리알려죠</a></td>
                    <td>test/2022-10-13</td>
                    <td>처리완료</td>
                    <td>일반회원</td>
                </tr>
            </tbody>
        </table>
        <ul>
            <li>
                <a href="">1</a>
            </li>
        </ul>
    </div>
    </main>
    <footer>

    </footer>
</body>
<script>
    $(document).ready(function(){
             $("#user_list").click(function(){
                 $("#user2_section, #reserv_section, #qna_section").css("display", "none");      
                 $("#user_section").css("display", "block");
                 $("#user_list").css("font-weight","bold")
                 $("#user2_list, #reserv_list, #qna_list").css("font-weight","normal")
             });
             $("#user2_list").click(function(){
                 $("#user_section, #reserv_section, #qna_section").css("display", "none");      
                 $("#user2_section").css("display", "block");
                 $("#user2_list").css("font-weight","bold")
                 $("#user_list, #reserv_list, #qna_list").css("font-weight","normal")
             });
             $("#reserv_list").click(function(){
                 $("#user_section, #user2_section, #qna_section").css("display", "none");      
                 $("#reserv_section").css("display", "block");
                 $("#reserv_list").css("font-weight","bold")
                 $("#user_list, #user2_list, #qna_list").css("font-weight","normal")
             });
             $("#qna_list").click(function(){
                 $("#user_section, #user2_section, #reserv_section").css("display", "none");      
                 $("#qna_section").css("display", "block");
                 $("#qna_list").css("font-weight","bold")
                 $("#user_list, #user2_list, #reserv_list").css("font-weight","normal")
             });
         })
 </script>
</html>