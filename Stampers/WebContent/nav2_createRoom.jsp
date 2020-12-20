<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="index.css"> 
    <title>Stampers</title>
    <style>
        /*추후 style.css로 따로 빼겠습니다*/
        /*웹페이지 공통 기본속성*/
		*{
		    box-sizing: border-box;
		}
        /*메인부분*/
        .container-float{
            max-width: 1440px;
            height:1200px;
            margin: auto;
            position: relative;
            content: '';
            display:block;
            clear: both;
            border:1px solid black;
        }
        .main-left{
            float:left;
            width: 50%;
            height: 600px;
            border:1px solid red;
        }
        .main-right{
            float:left;
            width: 50%;
            height: 600px;
            border:1px solid green;
        }

        /*푸터부분*/
        .footer{
            clear:both;
        }
    </style>


</head>

<body>
	<div class="container">
    <%@include file="header.jsp" %>
    <main class="main">
        <div class="container-float">
            <div class="main-left">
                <div class="main-left-title">규칙을 선택하십시오</div>
                <div class="main-left-category">
                    <table width="80%" border="1">
                        <tr>
                            <td>공부</td>
                            <td>운동</td>
                        </tr>
                        <tr>
                            <td>기상</td>
                            <td>음식</td>
                        </tr>
                        <tr>
                            <td>장소</td>
                            <td>목표</td>
                        </tr>
                        <tr>
                            <td>취미</td>
                            <td>기타</td>
                        </tr>
                    </table>
                </div>
                <div class="main-left-rule">
                    <form action="#">
                        <table width="80%" border="1">
                            <tr>
                                <th class="test">방이름</th>
                                <td><input type="text" name="title"></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td><textarea cols="10" rows="5" name="content"></textarea></td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <select name="category">
                                        <option value="study">공부</option>
                                        <option value="study">운동</option>
                                        <option value="study">기상</option>
                                        <option value="study">식단</option>
                                        <option value="study">취미</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>기간</th>
                                <td>
                                    <select name="period">
                                        <option value="1m">1개월</option>
                                        <option value="3m">3개월</option>
                                        <option value="6m">6개월</option>
                                        <option value="9m">9개월</option>
                                        <option value="12m">12개월</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>인원수</th>
                                <td>
                                    <input type="text" name="number" size="3">명
                                </td>
                            </tr>
                            <tr>
                                <th>인증방식</th>
                                <td>
                                    <select name="period">
                                        <option value="1m">1개월</option>
                                        <option value="3m">3개월</option>
                                        <option value="6m">6개월</option>
                                        <option value="9m">9개월</option>
                                        <option value="12m">12개월</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>배경이미지</th>
                                <td><input type="file" name="backgroundimg"></td>
                            </tr>
                            <tr>
                                <th>참여조건</th>
                                <td>
                                <input type="radio" name="condition" value="yes">있음
                                <input type="radio" name="condition" checked value="no">없음
                                </td>
                            </tr>
                            <tr>
                                <th>보증금체크</th>
                                <td>
                                <input type="radio" name="deposit" value="5w">5000원
                                <input type="radio" name="deposit" value="10w">10000원
                                <input type="radio" name="deposit" value="15w">15000원
                                <input type="radio" name="deposit" value="20w">20000원
                                </td>
                            </tr>
                            <tr>
                                <th>패널티</th>
                                <td>
                                <input type="radio" name="penalty" value="100p">100%
                                <input type="radio" name="penalty" value="80p">80%
                                <input type="radio" name="penalty" value="50p">50%
                                <input type="radio" name="penalty" value="30p">30%
                                </td>
                            </tr>
                            <tr>
                            <td colspan="6">
                            <input type="submit" value="방만들기">
                            <input type="reset" value="취소">
                            </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="main-right">
                <div class="main-right-title">방 미리보기</div>
                <div style="border: 1px solid black;width:80%;height:400px;"><img src="" alt="">img</div>
            </div>
        </div>
    </main>
    <%@include file="footer.jsp" %>
    </div>
</body>
</html>