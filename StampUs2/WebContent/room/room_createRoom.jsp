<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../index.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Stampers</title>
    <style>
        /*추후 style.css로 따로 빼겠습니다*/
        /*웹페이지 공통 기본속성*/
        * {
            box-sizing: border-box;
        }

        /*메인부분*/
        input {
            outline: none;
        }

        .container-float {
            max-width: 1440px;
            height: 1200px;
            margin: auto;
            position: relative;
            content: '';
            display: block;
            clear: both;
            border: 1px solid black;
        }

        .main-left {
            float: left;
            width: 50%;
            height: 1000px;
            border: 1px solid red;
        }

        .main-right {
            float: left;
            width: 50%;
            height: 1000px;
            border: 1px solid green;
        }

        /*푸터부분*/
        .footer {
            clear: both;
        }
    </style>
</head>

<body>
    <div class="container">
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
                        <form action="nav2_createRoom_ok.jsp" method="post" enctype="multipart/form-data">
                            <div class="form-group row">
                                <label for="title" class="col-sm-2 col-form-label">방이름</label>
                                <div class="col-sm-10">
                                    <input type="text" name="title" class="form-control" id="title" placeholder="인증방의 특징을 잘 나타내는 이름을 입력하세요">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="start_day">시작일</label>
                                    <input type="date" name="start_day" class="form-control" id="start_day">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="end_day">종료일</label>
                                    <input type="date" name="end_day" class="form-control" id="end_day">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label for="category">카테고리</label>
                                    <select name="category" class="form-control" id="category">
                                        <option value="1">공부</option>
                                        <option value="2">운동</option>
                                        <option value="3">기상</option>
                                        <option value="4">식단</option>
                                        <option value="5">취미</option>
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="people">인원수</label>
                                    <select name="people" class="form-control" id="people">
                                        <option value="2">2명</option>
                                        <option value="3">3명</option>
                                        <option value="4">4명</option>
                                        <option value="5">5명</option>
                                        <option value="6">6명</option>
                                        <option value="7">7명</option>
                                        <option value="8">8명</option>
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="condition">참여제한</label>
                                    <select name="condition" class="form-control" id="condition">
                                        <option value="0">없음</option>
                                        <option value="1">나이</option>
                                        <option value="2">성별</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">인증일</label>
                                <div class="form-check form-check-inline">
                                    <input name="check_day" class="form-check-input" type="checkbox" id="check_day1" value="1">
                                    <label class="form-check-label" for="check_day">월</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="check_day" class="form-check-input" type="checkbox" id="check_day2" value="2">
                                    <label class="form-check-label" for="check_day2">화</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="check_day" class="form-check-input" type="checkbox" id="check_day3" value="3">
                                    <label class="form-check-label" for="check_day3">수</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="check_day" class="form-check-input" type="checkbox" id="check_day4" value="4">
                                    <label class="form-check-label" for="check_day4">목</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="check_day" class="form-check-input" type="checkbox" id="check_day5" value="5">
                                    <label class="form-check-label" for="check_day5">금</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="check_day" class="form-check-input" type="checkbox" id="check_day6" value="6">
                                    <label class="form-check-label" for="check_day6">토</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="check_day" class="form-check-input" type="checkbox" id="check_day7" value="7">
                                    <label class="form-check-label" for="check_day7">일</label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">인증방식</label>
                                <div class="form-check form-check-inline">
                                    <input name="certi_type" class="form-check-input" type="checkbox" id="certi_type1" value="1">
                                    <label class="form-check-label" for="certi_type1">사진</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="certi_type" class="form-check-input" type="checkbox" id="certi_type2" value="2">
                                    <label class="form-check-label" for="certi_type2">텍스트</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="certi_type" class="form-check-input" type="checkbox" id="certi_type3" value="3">
                                    <label class="form-check-label" for="certi_type3">동영상</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="certi_type" class="form-check-input" type="checkbox" id="certi_type4" value="4">
                                    <label class="form-check-label" for="certi_type4">시간</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input name="certi_type" class="form-check-input" type="checkbox" id="certi_type5" value="5">
                                    <label class="form-check-label" for="certi_type5">위치</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="img">배경이미지</label>
                                <input type="file" class="form-control-file" id="img" accept="image/*" name="room_img" onchange="setThumbnail(event)">
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">보증금</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="deposit" id="deposit1" value="5000">
                                    <label class="form-check-label" for="deposit1">5000원</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="deposit" id="deposit2" value="10000">
                                    <label class="form-check-label" for="deposit2">10000원</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="deposit" id="deposit3" value="15000">
                                    <label class="form-check-label" for="deposit3">15000원</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="deposit" id="deposit4" value="20000">
                                    <label class="form-check-label" for="deposit4">20000원</label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">패널티</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="penalty" id="penalty1" value="10">
                                    <label class="form-check-label" for="penalty1">-10%</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="penalty" id="penalty2" value="15">
                                    <label class="form-check-label" for="penalty2">-15%</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="penalty" id="penalty3" value="20">
                                    <label class="form-check-label" for="penalty3">-20%</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="penalty" id="penalty4" value="25">
                                    <label class="form-check-label" for="penalty4">-25%</label>
                                </div>
                            </div>
                            <div class="form-group">
							    <label for="content">방 소개</label>
							    <textarea name="content" class="form-control" id="content" rows="3"></textarea>
							</div>


                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck2"
                                        required>
                                    <label class="form-check-label" for="invalidCheck2">
                                        Agree to terms and conditions
                                    </label>
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">Submit form</button>
                        </form>
                    </div>
                </div>
                <div class="main-right">
                    <div class="main-right-title">방 미리보기</div>
                    <div id="image_container" style="border: 1px solid black;width:400px;height:400px;">img</div>
                    <div id="test"></div>
                </div>
                <script>
                    function setThumbnail(event) {
                        var reader = new FileReader()
                        reader.onload = function (event) {
                            var img = document.createElement("img")
                            img.setAttribute("src", event.target.result)
                            img.setAttribute("width", "400px")
                            img.setAttribute("height", "400px")
                            document.querySelector("div#image_container").appendChild(img)
                        }
                        reader.readAsDataURL(event.target.files[0])
                    }
                </script>
            </div>
        </main>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>