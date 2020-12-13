<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/066a49883d.js" crossorigin="anonymous"></script>
    <title>Stamp Us</title>
    <link rel="stylesheet" href="index.css"> 
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">
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
                    <img src="img/logo_imsi.png">
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
        <main>
            <div class="mainPhoto">
                <img src="img/mainPhoto.jpg">
            </div>
        </main>
        <footer>
            <div class="footer_container">
                <div class="footer-text">
                    <p>
                        <span>(주)스탬프어스 | 서울 구로구 구로역1번출구, 한국통신사업자연합회 202호 | 
                        02-2039-2939</span><br>
                        <span>사업자등록번호: 816-81-01359 | 통신판매업신고: 2018-서울구로-03646</span><br>
                        <span>대표:이정삼,최홍준,박준우,이재근,지승원,김수연 | 개인정보책임자: 김수연 ㅣ이메일: support@stampus.com</span><br>
                    <p>copyright 2020. whitecube. All rights reserved.</p>
                </div>
                <div class="footer-links">
                    <a href="">이용약관</a>
                    <a href="">개인정보 수집방침</a>
                    <a href="">별도약관</a>
                </div>
            </div>
        </footer>
    </div>
</body> 
</html>