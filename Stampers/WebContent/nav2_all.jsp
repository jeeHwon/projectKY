<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;700;900&display=swap" rel="stylesheet">
    <title>Stampers</title>
    <style>
        /*추후 style.css로 따로 빼겠습니다*/
        /*웹페이지 공통 기본속성*/
        html{font-size: 12px;}
        *{
            box-sizing: border-box;
            font-family: roboto, sans-serif;
            margin: 0;
        }
        body{
            margin: 0;
            font-size:1.5rem;
        }
        a{text-decoration:none;color:black}
        a:link{text-decoration:none;}
        a:visited{text-decoration:none;}
        a:hover{text-decoration:none; color:#CB230C;}
        ul{list-style: none;}
        
        /*헤더부분*/

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
        .main-sidebar{
            float:left;
            width: 20%;
            height: 1200px;
            border:1px solid green;
        }
        .main-content{
            float: left;
            width: 80%;
            height: 1200px;
            border: 1px solid orange;
        }
        .nav_sub{
            display: none;
        }
        .main_f4{
            align-items: center;
        }
        .room_container{
            width: 200px;
            height: 300px;
            border:1px solid pink;
        }
        
        /*푸터부분*/
        .footer{
            clear:both;
        }
    </style>

    <!--추후 script.js로 따로 빼겠습니다-->
    <script>
        function sub_view(index){   //메뉴 클릭하면 서브 메뉴 보여주는 함수
            for(i = 0; i<7; i++){
                document.getElementsByClassName("nav_sub")[i].style.display="none"
                document.getElementsByClassName("nav_main_a")[i].style.color="black"
            }
            document.getElementsByClassName("nav_sub")[index].style.display="block"
            show_title(index)
        }
        function show_title(index){ //메뉴 클릭하면 메인에 카테고리 제목 출력하는 함수
            var title = document.getElementsByClassName("nav_main")[index].innerHTML
            document.getElementsByClassName("nav_main_a")[index].style.color="#CB230C"
            document.getElementById("main_f1_title").innerHTML=title
        }
    </script>
</head>

<body>
    <header class="header" style="border:1px solid black;height: 100px;">헤더입니다</header>
    <main class="main">
        <div class="container-float">
            <div class="main-sidebar">
                <ul>
                    <li class="nav_main" onclick="sub_view(0)" value="공부"><a class="nav_main_a" href="#">공부</a></li>
                    <li class="nav_sub">
                        <ul>
                            <li><a class="nav_sub_a" href="#">자격증</a></li>
                            <li><a class="nav_sub_a" href="#">공무원</a></li>
                            <li><a class="nav_sub_a" href="#">취업</a></li>
                            <li><a class="nav_sub_a" href="#">수능</a></li>
                            <li><a class="nav_sub_a" href="#">어학</a></li>
                            <li><a class="nav_sub_a" href="#">기타</a></li>
                        </ul>
                    </li>
                    <li class="nav_main" onclick="sub_view(1)" value="운동"><a class="nav_main_a" href="#">운동</a></li>
                    <li class="nav_sub">
                        <ul>
                            <li><a class="nav_sub_a" href="#">헬스장</a></li>
                            <li><a class="nav_sub_a" href="#">홈트레이닝</a></li>
                            <li><a class="nav_sub_a" href="#">런닝</a></li>
                            <li><a class="nav_sub_a" href="#">걸음수</a></li>
                            <li><a class="nav_sub_a" href="#">다이어트</a></li>
                            <li><a class="nav_sub_a" href="#">자유운동</a></li>
                        </ul>
                    </li>
                    <li class="nav_main" onclick="sub_view(2)" value="기상"><a class="nav_main_a" href="#">기상</a></li>
                    <li class="nav_sub">
                        <ul>
                            <li><a class="nav_sub_a" href="#">5시이전</a></li>
                            <li><a class="nav_sub_a" href="#">5시~5시59분</a></li>
                            <li><a class="nav_sub_a" href="#">6시~6시59분</a></li>
                            <li><a class="nav_sub_a" href="#">7시~7시59분</a></li>
                            <li><a class="nav_sub_a" href="#">8시~8시59분</a></li>
                            <li><a class="nav_sub_a" href="#">9시~9시59분</a></li>
                        </ul>
                    </li>
                    <li class="nav_main" onclick="sub_view(3)" value="음식"><a class="nav_main_a" href="#">음식</a></li>
                    <li class="nav_sub">
                        <ul>
                            <li><a class="nav_sub_a" href="#">다이어트식단</a></li>
                            <li><a class="nav_sub_a" href="#">건강식단</a></li>
                            <li><a class="nav_sub_a" href="#">아침식사</a></li>
                            <li><a class="nav_sub_a" href="#">점심식사</a></li>
                            <li><a class="nav_sub_a" href="#">저녁식사</a></li>
                            <li><a class="nav_sub_a" href="#">기타</a></li>
                        </ul>
                    </li>
                    <li class="nav_main" onclick="sub_view(4)" value="장소"><a class="nav_main_a" href="#">장소</a></li>
                    <li class="nav_sub">
                        <ul>
                            <li><a class="nav_sub_a" href="#">독서실</a></li>
                            <li><a class="nav_sub_a" href="#">도서관</a></li>
                            <li><a class="nav_sub_a" href="#">집</a></li>
                            <li><a class="nav_sub_a" href="#">회사</a></li>
                            <li><a class="nav_sub_a" href="#">학원</a></li>
                            <li><a class="nav_sub_a" href="#">기타</a></li>
                        </ul>
                    </li>
                    <li class="nav_main" onclick="sub_view(5)" value="목표"><a class="nav_main_a" href="#">목표</a></li>
                    <li class="nav_sub">
                        <ul>
                            <li><a class="nav_sub_a" href="#">저축</a></li>
                            <li><a class="nav_sub_a" href="#">가계부</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                        </ul>
                    </li>
                    <li class="nav_main" onclick="sub_view(6)" value="취미"><a class="nav_main_a" href="#">취미</a></li>
                    <li class="nav_sub">
                        <ul>
                            <li><a class="nav_sub_a" href="#">독서</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                            <li><a class="nav_sub_a" href="#">추후추가</a></li>
                        </ul>
                    </li>
                </ul>
                
            </div>
            <div class="main-content">
                <div class="main_f1" id="main_f1_title">카테고리 제목</div>
                <div class="main_f2">검색창 배치예정</div>
                <div class="main_f3">검색필터 배치예정</div>
                <div class="main_f4">
                    <table>
                        <tr>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                        </tr>
                    </table>
                </div>
                <div class="main_f5">
                    <table>
                        <tr>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                        </tr>
                    </table>
                </div>
                <div class="main_f6">
                    <table>
                        <tr>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                            <td><div class=room_container>room#</div></td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </main>
    <footer class="footer" style="border:1px solid black;height: 100px;">푸터입니닷</footer>
</body>
</html>