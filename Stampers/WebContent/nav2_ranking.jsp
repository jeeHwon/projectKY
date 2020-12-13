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
        .main-a{
            float:left;
            width: 33%;
            height: 1200px;
            border:1px solid green;
        }
        .main-b{
            float: left;
            width: 34%;
            height: 1200px;
            border: 1px solid orange;
        }
        .main-c{
            float: left;
            width: 33%;
            height: 1200px;
            border: 1px solid orange;
        }

        
        /*푸터부분*/
        .footer{
            clear:both;
        }
    </style>

</head>

<body>
    <header class="header" style="border:1px solid black;height: 100px;">헤더입니다</header>
    <main class="main">
        <div class="container-float">
            <div class="main-a">랭킹 타입 1</div>
            <div class="main-b">랭킹 타입 2</div>
            <div class="main-c">랭킹 타입 3</div>

        </div>

    </main>
    <footer class="footer" style="border:1px solid black;height: 100px;">푸터입니닷</footer>
</body>
</html>