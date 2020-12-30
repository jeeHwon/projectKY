<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/066a49883d.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="index.css"> 
<title>Stamp Us</title>
</head>
<body>
	<div class="container">
		<header>
			<div class="f1">지금 가입하고 특별한 혜택을 누리세요</div>
			<div class="f2">
			    <ul class="navbar_menu nav1">
			        <li><a href="nav1_login.jsp">로그인</a></li>
			        <li>|</li>
			        <li><a href="nav1_member.jsp">회원가입</a></li>
			        <li>|</li>
			        <li><a href="nav1_pay.jsp">결제</a></li>
			        <li>|</li>
			        <li><a href="nav1_service.jsp">고객센터</a></li>
			        <li>|</li>
			        <li><a href="nav1_notice.jsp">공지사항</a></li>
			        <li><i class="fab fa-twitter"></i></li>
			        <li><i class="fab fa-facebook-f"></i></li>
			    </ul>
			</div>
			<div class="f3">
			    <div class="logo">
			        <a href="index.jsp"><img src="img/logo_imsi.png"></a>
			    </div>
			</div>
			<div class="f4 navbar">
			    <ul class="nav2">
			        <li><a href="nav2_all.jsp">전체 카테고리</a></li>
			        <li>|</li>
			        <li><a href="nav2_createRoom.jsp">방만들기</a></li>
			        <li>|</li>
			        <li><a href="nav2_ranking.jsp">랭킹</a></li>
			        <li>|</li>
			        <li><a href="nav2_hugi.jsp">후기</a></li>
			        <li>|</li>
			        <li><a href="nav2_stats.jsp">통계</a></li>
			    </ul>
			    <div class="srchBox">
			        <form name="search" method="post">
			            <input type="text" name="sword" class="srch" placeholder="나에게 딱 맞는 방 검색하기">
			            <a href=""><i class="fas fa-search"></i></a>
			            <!-- <img src="img/search.png"> -->
			            </form>
			        </div>
			    </div>
		</header>
	</div>
</body>
</html>