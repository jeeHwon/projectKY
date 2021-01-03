<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"><!-- => 죽은 코드-->
    <meta name="author" content="ky_team">
    <meta name="description" content="당신의 일상을 공유하세요. 스탬프어스">
    <meta name="keywords" content="인증샷, 인증, 보증금, 챌린지, 기상인증, 공부인증, 홈트, 사진인증, 도전, 취미, 목표, 일상">
    <title>StampUs</title>
    
    <!-- CSS => 상대경로로 지정해주자-->
    <link rel="stylesheet" href="<c:url value="/assets/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/css/swiper.css"/>">

    
    <!-- 파비콘 =>웹브라우저 최상단에 뜨는 아이콘-->
    <link rel="shortcut icon" href="<c:url value="/assets/icons/favicon.ico"/>">
    <link rel="apple-touch-icon-precomposed" href="<c:url value="/assets/icons/favicon_72.png"/>" />
    <link rel="apple-touch-icon-precomposed" sizes="96x96" href="<c:url value="/assets/icons/favicon_96.png"/>" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/assets/icons/favicon_144.png"/>" />
    <link rel="apple-touch-icon-precomposed" sizes="192x192" href="<c:url value="/assets/icons/favicon_192.png"/>" />
    
    <!-- 페이스북 메타 태그 -->
    <meta property="og:title" content="스탬프어스 StampUs" />
    <meta property="og:url" content="https://github.com/jeeHwon/projectKY" />
    <meta property="og:image" content="https://raw.githubusercontent.com/jeeHwon/projectKY/master/logo_STAMPUS.jpg" />
    <meta property="og:description" content="인증샷을 통한 목표 공유 소셜서비스" />
   
    <!-- 트위터 메타 태그 -->
    <meta name="twitter:card" content="selfie">
    <meta name="twitter:title" content="스탬프어스 StampUs">
    <meta name="twitter:url" content="https://github.com/jeeHwon/projectKY">
    <meta name="twitter:image" content="https://raw.githubusercontent.com/jeeHwon/projectKY/master/logo_STAMPUS.jpg">
    <meta name="twitter:description" content="인증샷을 통한 목표 공유 소셜서비스">
    <!--웹 폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- HTLM5shiv ie6~8 -->
    <!--[if lt IE 9]> 
        <script src="assets/js/html5shiv.min.js"></script>
        <script type="text/javascript">
            alert("현재 브라우저는 지원하지 않습니다. 크롬 브라우저를 추천합니다.!");
        </script>
   <![endif]-->


</head>
<body>
    <header id="header">
        <div class="container clearfix">
            <div class="row">
                <div class="header">
                    <h1>
                        <a href="<c:url value="../index.jsp"/>">
                            <em><img src="<c:url value="/assets/img/logo.png"/>" alt="STAMPUS"></em>
                        </a>
                    </h1>
                    <nav class="nav">
                        <ul class="clearfix">
                            <li><a href="<c:url value="/room/room_list.jsp"/>">인증방</a></li>
                            <li><a href="#">랭킹</a></li>
                            <li><a href="#">후기</a></li>
                            <li><a href="#">통계</a></li>
                            <li><a href="#">결제</a></li>
                            <li><a href="<c:url value="/event/event_list.jsp"/>">이벤트</a></li>
                            <li><a href="#">로그인</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- //header-->