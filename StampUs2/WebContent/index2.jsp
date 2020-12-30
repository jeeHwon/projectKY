<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
    
    <!-- 파비콘 =>웹브라우저 최상단에 뜨는 아이콘-->
    <link rel="shortcut icon" href="assets/icons/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="assets/icons/favicon_72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="96x96" href="assets/icons/favicon_96.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/icons/favicon_144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="192x192" href="assets/icons/favicon_192.png" />
    
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
                        <a href="#">
                            <em><img src="assets/img/logo.png" alt="STAMPUS"></em>
                        </a>
                    </h1>
                    <nav class="nav">
                        <ul class="clearfix">
                            <li><a href="#">인증방</a></li>
                            <li><a href="#">랭킹</a></li>
                            <li><a href="#">후기</a></li>
                            <li><a href="#">통계</a></li>
                            <li><a href="#">결제</a></li>
                            <li><a href="#">이벤트</a></li>
                            <li><a href="#">로그인</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- //header-->
    
    <section id="banner">
        <div class="banner_menu">
           <h2 class="ir_so">인증샷 이벤트</h2>
           <div class="container">
               <div class="row">
                   <div class="bm_left">
                       <ul>
                           <li class="total"><a href="#">전체메뉴</a></li>
                       </ul>
                   </div>
                   <div class="bm_right">
                       <ul>
                           <li class="line"><a href="#">고객센터</a></li>
                           <li class="line"><a href="#">공지사항</a></li>
                       </ul>
                       <ul>
                           <li class="white"><a href="#">카테고리별</a></li>
                           <li class="red"><a href="#">빠른 검색</a></li>
                       </ul>
                   </div>
               </div>
           </div>
        </div>
        <div class="slider">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide ss1">
                       <div class="container">
                           <div class="row">
                                <h2>인증샷<em>With StampUs</em></h2>
                                <p>당신의 일상을 공유 하세요</p>                               
                           </div>
                       </div>
                    </div>
                    <div class="swiper-slide ss2">
                       <div class="container">
                           <div class="row">
                                <h2>인증샷<em>With StampUs</em></h2>
                                <p>당신의 일상을 공유 하세요</p>                               
                           </div>
                       </div>              
                    </div>
                    <div class="swiper-slide ss3">
                       <div class="container">
                           <div class="row">
                                <h2>인증샷<em>With StampUs</em></h2>
                                <p>당신의 일상을 공유 하세요</p>                               
                           </div>
                       </div>                  
                    </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </section>
    <!-- //banner -->
    
    <section id="room">
        <div class="container">
            <div class="row">
                <div class="room">
                    <h2 class="ir_so">인증방 게시</h2>
                    <div class="room_title">
                        <ul>
                            <li class="active"><a href="#">추천순</a></li>
                            <li><a href="#">최근생성순</a></li>
                            <li><a href="#">요즘뜨는순</a></li>
                            <li><a href="#">마감임박순</a></li>
                        </ul>
                    </div>
                    <div class="room_chart">
                        <div class="chart_cont1">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>1</strong></div>
                                    <div class="mx">
                                        <span class="icon dep15 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate02 ir_pm">study</span><strong>한강 주말런닝:)</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>2</strong></div>
                                    <div class="mx">
                                        <span class="icon dep15 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate01 ir_pm">study</span><strong>고3_매일인증반</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>3</strong></div>
                                    <div class="mx">
                                        <span class="icon dep15 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate01 ir_pm">study</span><strong>고3_매일인증반</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>4</strong></div>
                                    <div class="mx">
                                        <span class="icon dep15 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate01 ir_pm">study</span><strong>고3_매일인증반</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//chart_cont1-->
                        <div class="chart_cont2">
                            
                        </div><!--//chart_cont2-->
                        <div class="chart_cont3">
                            
                        </div>
                        <!--//chart_cont3-->
                        <div class="chart_cont4">
                            
                        </div>
                        <!--//chart_cont4-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 자바스크립트 라이브러리 -->
    <script src="assets/js/jquery.min_1.12.4.js"></script>
    <script src="assets/js/modernizr-custom.js"></script><!-- =>html5 css3 감지 -->
    <script src="assets/js/ie-checker.js"></script><!-- =>익스플로러 ver 체크 -->
    <script src="assets/js/swiper.min.js"></script><!-- =>배너 스와이프 기능 -->
    <script>
        var mySwiper = new Swiper('.swiper-container', {
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',   
            },
            autoplay: {
                delay: 5000,
            },
            
        });
    </script>
</body>
</html>