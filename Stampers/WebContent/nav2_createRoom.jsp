<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
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
        input{
            outline: none;
        }
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
    <%@include file="header.jsp"%>
    <main class="main">
        <div class="container-float">
            <div class="main-left">
                <div class="main-left-title">규칙을 선택하십시오</div>
                <div class="main-left-category">
                    <table>
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
                    <form action="nav2_createRoom_ok.jsp">
                        <table width="80%" border="1">
                            <tr>
                                <th>방이름</th>
                                <td><input type="text" name="title" size="30%"></td>
                            </tr>
                            <tr>
                                <th>날짜선택</th>
                                <td>
                                    시작일<input type="date" name="start_day">
                                    종료일<input type="date" name="end_day">
                                </td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <select name="category">
                                        <option value="study">공부</option>
                                        <option value="exer">운동</option>
                                        <option value="wakeup">기상</option>
                                        <option value="food">식단</option>
                                        <option value="hobby">취미</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>인원수</th>
                                <td>
                                    <select name="people">
                                        <option value="2">2명</option>
                                        <option value="3">3명</option>
                                        <option value="4">4명</option>
                                        <option value="5">5명</option>
                                        <option value="6">6명</option>
                                        <option value="7">7명</option>
                                        <option value="8">8명</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>인증일</th>
                                <td>
                                    <input type="checkbox" name="check_day" value="mon">월
                                    <input type="checkbox" name="check_day" value="tue">화
                                    <input type="checkbox" name="check_day" value="wed">수
                                    <input type="checkbox" name="check_day" value="thr">목
                                    <input type="checkbox" name="check_day" value="fri">금
                                    <input type="checkbox" name="check_day" value="sat">토
                                    <input type="checkbox" name="check_day" value="sun">일
                                </td>
                            </tr>
                            <tr>
                                <th>인증방식</th>
                                <td>
                                    <input type="checkbox" name="certi_type" value="cam">사진
                                    <input type="checkbox" name="certi_type" value="text">텍스트
                                    <input type="checkbox" name="certi_type" value="video">동영상
                                    <input type="checkbox" name="certi_type" value="time">시간
                                    <input type="checkbox" name="certi_type" value="loc">위치
                                </td>
                            </tr>
                            <tr>
                                <th>배경이미지</th>
                                <td><input type="file" id="img" accept="image/*" name="room_img" onchange="setThumbnail(event)"></td>
                            </tr>
                            <tr>
                                <th>참여제한</th>
                                <td>
                                    <input type="radio" name="condition" checked value="no">없음
                                    <input type="radio" name="condition" value="age">나이
                                    <input type="radio" name="condition" value="gender">성별
                                </td>
                            </tr>
                            <tr>
                                <th>보증금</th>
                                <td>
                                    <input type="radio" name="deposit" value="5000">5000원
                                    <input type="radio" name="deposit" value="10000">10000원
                                    <input type="radio" name="deposit" value="15000">15000원
                                    <input type="radio" name="deposit" value="20000">20000원
                            </td>
                            </tr>
                            <tr>
                                <th>패널티</th>
                                <td>
                                    <input type="radio" name="penalty" value="1000">-1000원
                                    <input type="radio" name="penalty" value="2000">-2000원
                                    <input type="radio" name="penalty" value="3000">-3000원
                                    <input type="radio" name="penalty" value="4000">-4000원
                                </td>
                            </tr>
                            <tr>
                                <th>방소개</th>
                                <td><textarea cols="50" rows="5" name="content"></textarea></td>
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
                <div id="image_container" style="border: 1px solid black;width:400px;height:400px;">img</div>
                <div id="test"></div>
            </div>
            <script>
                function setThumbnail(event){
                    var reader = new FileReader()
                    reader.onload = function(event){
                        var img = document.createElement("img")
                        img.setAttribute("src", event.target.result)
                        img.setAttribute("width", "400px")
                        img.setAttribute("height", "400px")
                        document.querySelector("div#image_container").appendChild(img)
                    }
                    reader.readAsDataURL(event.target.files[0])
                }
            </script>
    </main>
    <%@include file="footer.jsp" %>
    </div>
</body>
</html>