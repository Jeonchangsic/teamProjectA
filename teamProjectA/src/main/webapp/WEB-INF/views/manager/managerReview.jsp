<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 리뷰</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/manager_css/managerReview.css">
</head>
    <body style="overflow-x: hidden">
        <div id="header">
            <div class="top">
                <h3>관리자페이지</h3>
                <div id="manager">
                    <ul>
                        <li><a href="">home</a></li>
                        <li><a href="">회원관리</a></li>
                        <li><a href="">숙소관리</a></li>
                        <li><a href="">리뷰관리</a></li>                
                    </ul>
                </div>
            </div>
        </div>
        <main class="inner">
            <div>
                <h3>리뷰관리</h3>
            </div>     
            <hr/>
            <form>
                <tbody>
                    <tr>
                        <td>
                            <select class="frm_select">
                                <option value="nickname">제목</option>
                                <option value="nickname">아이디</option>
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
                        <th>작성자/작성일</th>
                        <th>제목</th>
                        <th>상세관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="text-align:center;">                       
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="button" value="삭제"></td>
                    </tr>
                    <tr style="text-align:center;">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="button" value="삭제"></td>
                    </tr>
                    <tr style="text-align:center;">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="button" value="삭제"></td>
                    </tr>
                    <tr style="text-align:center;">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="button" value="삭제"></td>
                    </tr>
                    <tr style="text-align:center;">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="button" value="삭제"></td>
                    </tr>
                    <tr style="text-align:center;">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="button" value="삭제"></td>
                    </tr>
                </tbody>
            </table>
            <ul>
                <li>
                    <a href="">1</a>
                </li>
            </ul>
        </main>
        <footer>

        </footer>
</body>
</html>