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
		*{
		    box-sizing: border-box;
		}
        /*메인부분*/
        .container-float{
            max-width: 1440px;
            height:800px;
            margin: auto;
            position: relative;
            content: '';
            display:block;
            clear: both;
            border:1px solid black;
        }
        .main-f1{
            height: 50px;
            border:1px solid red;
        }
        .main-f2{
            height: 50px;
            border:1px solid green;
        }
        .main-f3{
            height: 700px;
            border:1px solid blue;
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
            <div class="main-f1">카테고리 선택</div>
            <div class="main-f2">검색창 및 필터 배치예정</div>
            <div class="main-f3">게시판 형식</div>

        </div>

    </main>
    <%@include file="footer.jsp" %>
    </div>
</body>
</html>