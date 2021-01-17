<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="header.jsp"%>
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
                       	   <%if(session.getAttribute("userid")!=null){ %>
                           <li class="line"><a href="<c:url value="member/mypage.jsp"/>">마이페이지</a></li>
                           <%} %>
                           <li class="line"><a href="<c:url value="/fboard/board_list.jsp"/>">자유게시판</a></li>
                           <li class="line"><a href="<c:url value="/customer/center.jsp"/>">고객센터</a></li>
                           <li class="line"><a href="<c:url value="/notice/notice_list.jsp"/>">공지사항</a></li>
                       </ul>
                       <ul>
                           <li class="white"><a href="<c:url value="/study_my/study_join_list.jsp"/>">내인증방</a></li>
                           <li class="red"><a href="<c:url value="/room/room_create.jsp"/>">방만들기</a></li>
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
                                <h2>목표달성<em>With StampUs</em></h2>
                                <p>한걸음씩 나아가는 당신을 응원합니다</p>                               
                           </div>
                       </div>              
                    </div>
                    <div class="swiper-slide ss3">
                       <div class="container">
                           <div class="row">
                                <h2>우리, 같이<em>With StampUs</em></h2>
                                <p>같은 목표를 가진 사람들이 함께합니다</p>                               
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
                                        <img src="assets/img/poster_s_01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>1</strong></div>
                                    <div class="mx">
                                        <span class="icon dep10 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_s ir_pm">study</span><strong>직장인 토익900점</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_x_01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>2</strong></div>
                                    <div class="mx">
                                        <span class="icon dep5 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_x ir_pm">study</span><strong>한강 주말런닝 :)</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_f_01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>3</strong></div>
                                    <div class="mx">
                                        <span class="icon dep15 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_f ir_pm">study</span><strong>다이어트 식단인증</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_w_01.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>4</strong></div>
                                    <div class="mx">
                                        <span class="icon dep20 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_w ir_pm">study</span><strong>평일 새벽6시 기상!</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//chart_cont1-->
                        <div class="chart_cont2">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_x_02.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>1</strong></div>
                                    <div class="mx">
                                        <span class="icon dep5 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_x ir_pm">study</span><strong>일주일 총거리 10km</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_f_02.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>2</strong></div>
                                    <div class="mx">
                                        <span class="icon dep10 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_f ir_pm">study</span><strong>건강한 아침식사 함께</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_w_02.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>3</strong></div>
                                    <div class="mx">
                                        <span class="icon dep20 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_w ir_pm">study</span><strong>기상후 모닝커피 인증</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_s_02.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>4</strong></div>
                                    <div class="mx">
                                        <span class="icon dep20 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_s ir_pm">study</span><strong>고3 수능 D-200일!!</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                        <!--//chart_cont2-->
                        <div class="chart_cont3">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_w_03.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>1</strong></div>
                                    <div class="mx">
                                        <span class="icon dep15 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_w ir_pm">study</span><strong>평일아침 7시기상방</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_s_03.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>2</strong></div>
                                    <div class="mx">
                                        <span class="icon dep5 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_s ir_pm">study</span><strong>도서관에서 공부하기</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_x_03.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>3</strong></div>
                                    <div class="mx">
                                        <span class="icon dep20 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_x ir_pm">study</span><strong>홈요가 1주 2회~!</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_f_03.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>4</strong></div>
                                    <div class="mx">
                                        <span class="icon dep10 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_f ir_pm">study</span><strong>샐러드 도시락 인증방</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//chart_cont3-->
                        <div class="chart_cont4">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_f_04.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>1</strong></div>
                                    <div class="mx">
                                        <span class="icon dep15 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_f ir_pm">study</span><strong>채식위주 식단인증방</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_w_04.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>2</strong></div>
                                    <div class="mx">
                                        <span class="icon dep10 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_w ir_pm">study</span><strong>아침 6시 기상 미션有</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_s_04.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>3</strong></div>
                                    <div class="mx">
                                        <span class="icon dep20 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_s ir_pm">study</span><strong>[부산]고2 노지각러들</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="assets/img/poster_x_04.jpg" alt="">
                                    </figure>
                                    <div class="rank"><strong>4</strong></div>
                                    <div class="mx">
                                        <span class="icon dep5 ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3><span class="icon cate_x ir_pm">study</span><strong>헬스장 입구사진 인증</strong></h3>
                                    <div class="infor_btn">
                                        <a href="">상세보기</a>
                                        <a href="">참여하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//chart_cont4-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //room -->
    
    <section id="event">
        <div class="container">
            <div class="row">
                <div class="event">
                    <h2>새로운 이벤트</h2>
                    <div class="event_left">
                        <div class="event_slider">
                            <img src="assets/img/event01.jpg" alt="이벤트 이미지1">
                        </div>
                        <div class="event_box1">
                            <img src="assets/img/event02.jpg" alt="이벤트 이미지2">
                        </div>
                        <div class="event_box2">
                            <img src="assets/img/event03.jpg" alt="이벤트 이미지3">
                        </div>
                    </div>
                    <div class="event_right">
                        <img src="assets/img/event04.jpg" alt="이벤트 이미지4">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //event -->
    
    <section id="opening">
       <div class="container">
           <div class="row">
               <div class="opening">
                   <h2><span class="icon grand ir_pm">Grand Opening</span></h2>
                   <strong class="date ir_pm">2021.01~2021.03</strong>
                   <p class="desc">하루 세끼 인증만 하면 경품이 쏟아진다</p>
                   <div class="open_box">
                       <div class="div">
                           <h3>건강식 코너</h3>
                           <p><em>저염식</em><strong>저지방</strong>채식식단</p>
                       </div>
                       <div class="div">
                           <h3>아침 식사</h3>
                           <p><em>식사인증</em><strong>식단관리</strong>필수영양소</p>
                       </div>
                       <div class="div">
                           <h3>점심 식사</h3>
                           <p><em>도시락</em><strong>급식</strong>식당메뉴</p>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </section>
    <!-- //opening -->
    
    <section id="review">
        <div class="container">
            <div class="row">
                <div class="review">
                    <h2>인증방 후기</h2>
                    <div class="review_left">
                        <div class="play">
                            <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                viewBox="0 0 120 120" style="enable-background:new 0 0 120 120;" xml:space="preserve">
                                <circle class="st0" cx="60" cy="60.4" r="56"/>
                                <path class="st1" d="M81,65.4c4.8-2.8,4.8-7.2,0-10L53.5,39.6c-4.8-2.8-8.7-0.5-8.7,5v31.7c0,5.5,3.9,7.8,8.7,5L81,65.4z"/>
                            </svg>
                        </div>
                    </div>
                    <div class="review_right">
                        <h3 class="title">100대 명산 등반 인증방</h3>
                        <span class="release">2021년 1월 1일 완료</span>
                        <div class="heart">
                            <span class="icon heart2"></span>
                            <span class="icon heart2"></span>
                            <span class="icon heart2"></span>
                            <span class="icon heart1"></span>
                            <span class="icon heart0"></span>
                            <strong>달성율 72.3%</strong>
                        </div>
                        <ul class="summary">
                            <li class="category"><span class="bar">운동</span><span>등산</span></li>
                            <li class="type"><span class="bar">20명</span><span>사진, 위치인증</span></li>
                            <li class="desc">코로나가 점점 심해져 집에만 있는 시간이 길어졌습니다. 실내운동은 제한사항이 많아 등산을 취미로 가지기로 하였습니다. 스탬프어스 등산 카테고리에서 본 100대 명산 인증방은 지난 6개월간 꾸준히 진행 되던 방이었고 달성율과 인증도 활발하여 꼭 참여해 보고싶던 방이었습니다. 마침 결원이 생겨 참여하게 되었고 매주 등산 인증을 올리며 팀원들과 공유하는 재미에 푹 빠지고 말았습니다. 3개월 간 13곳의 산을 방문하였고, 그중 3번은 인증방 팀원들과 만나 산행을 가기도 하였습니다. 인증방 기간이 만료되어 아쉽지만 또 다른 등산 인증방을 만들어 참여하려고 합니다. 이번에는 나이를 20대 또래로 구성하여 젊은 산행 팀원을 모집해보면 좋을 것 같습니다. 여러분 꼭 등산하세요 꼭이요~ㅎㅎ 혹시 서울 경기 지역 등산에 관심있는 20대 후반은 쪽지 보내주세요!!~~:) </li>
                        </ul>
                        <span class="user_id">jeehyeok0114</span>
                        <div class="btn">
                            <a href="#" class="white">결과보기</a>
                            <a href="#" class="red">프로필보기</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //review -->
    
    <section id="help">
        <div class="container">
            <div class="row">
                <div class="help">
                    <article class="help_box1">
                        <h3>공지사항</h3>
                        <div class="notice">
                            <ul>
                                <li class="active"><a href="">전체 공지</a>
                                    <ul>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">전체</strong><em>2021.01.05</em></dt>
                                                <dd><a href="">[위치인증]GPS 수신 동의를 하지 않은 경우 위치 인증을 받을 수 없습니다.</a></dd>
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">전체</strong><em>2021.01.02</em></dt>
                                                <dd><a href="">[시간인증]인증 완료 시간을 초과한 경우에는 인증을 받을 수 없습니다.</a></dd>
                                            </dl>                                                
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">전체</strong><em>2021.01.01</em></dt>
                                                <dd><a href="">[결제]결제 문제시 아래의 주소 링크를 클릭하여 문제를 해결하세요.</a></dd>
                                            </dl>                                            
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">전체</strong><em>2021.01.01</em></dt>
                                                <dd><a href="">[시스템점검]2021.01.05 새벽 4시~6시 접속이 제한됩니다</a></dd>
                                            </dl>                                            
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="">인증방 공지</a>
                                    <ul>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">운동</strong><em>2021.01.05</em></dt>
                                                <dd><a href="">[위치인증]GPS 수신 동의를 하셔야만 위치 인증을 받을 수 있습니다.</a></dd>
                                            </dl>
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">공부</strong><em>2021.01.02</em></dt>
                                                <dd><a href="">[시간인증]인증 완료 시간을 초과한 경우에는 인증을 받을 수 없습니다.</a></dd>
                                            </dl>                                                
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">기상</strong><em>2021.01.01</em></dt>
                                                <dd><a href="">[결제]결제 문제시 아래의 주소 링크를 클릭하여 문제를 해결하세요.</a></dd>
                                            </dl>                                            
                                        </li>
                                        <li>
                                            <dl>
                                                <dt><strong class="bar">운동</strong><em>2021.01.01</em></dt>
                                                <dd><a href="">[시스템점검]2021.01.05 새벽 4시~6시 접속이 제한됩니다</a></dd>
                                            </dl>                                            
                                        </li>
                                    </ul>                                
                                </li>
                            </ul>
                        </div>
                    </article>
                    <article class="help_box2">
                        <h3>할인카드</h3>
                        <div class="card">
                            <ul>
                                <li>
                                    <a href="#">
                                        <span><img src="assets/img/card01.jpg" alt="card01"></span>
                                        <strong>T멤버십 일반</strong>
                                        <em>5000원 결제시 1000원 추가적립 (1일 1회)</em>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span><img src="assets/img/card02.jpg" alt="card01"></span>
                                        <strong>LG U+</strong>
                                        <em>10000원 이상 결제시 200포인트 추가 적립</em>
                                    </a>                                    
                                </li>
                                <li>
                                    <a href="#">
                                        <span><img src="assets/img/card03.jpg" alt="card01"></span>
                                        <strong>KT 멤버십 할인</strong>
                                        <em>결제시 10% 추가적립 혜택 (1일 1회)</em>
                                    </a>                                    
                                </li>
                            </ul>
                        </div>
                    </article>
                    <article class="help_box3">
                        <h3>고객센터</h3>
                        <div class="service">
                            <ul>
                                <li>
                                    <a href="#">
                                        <span class="img_svg">
                                            <img src="assets/img/icon_cus_mail.png" alt="메일문의">
                                        </span>
                                        <strong>메일문의</strong>
                                    </a>
                                </li>                                
                                <li>
                                    <a href="#">
                                        <span class="img_svg">
                                            <img src="assets/img/icon_cus_phone.png" alt="전화문의">
                                        </span>
                                        <strong>전화문의</strong>
                                    </a>
                                </li>                                
                                <li>
                                    <a href="#">
                                        <span class="img_svg">
                                            <img src="assets/img/icon_cus_FAQ.png" alt="자주묻는 질문">
                                        </span>
                                        <strong>자주묻는 질문</strong>
                                    </a>
                                </li>                                
                                <li>
                                    <a href="#">
                                        <span class="img_svg">
                                            <img src="assets/img/icon_cus_messenger.png" alt="카톡문의">
                                        </span>
                                        <strong>카톡문의</strong>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </section>
    <!-- //help -->
    
        <!-- 자바스크립트 라이브러리 -->
    <script src="<c:url value="/assets/js/jquery.min_1.12.4.js"/>"></script>
    <script src="<c:url value="/assets/js/modernizr-custom.js"/>"></script><!-- =>html5 css3 감지 -->
    <script src="<c:url value="/assets/js/ie-checker.js"/>"></script><!-- =>익스플로러 ver 체크 -->
    <script src="<c:url value="/assets/js/swiper.min.js"/>"></script><!-- =>배너 스와이프 기능 -->
    <script>
        // 배너 이미지 슬라이드
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
        
        // 인증방 차트 탭 메뉴
        var roomBtn = $(".room_title> ul > li")
        var roomCont = $(".room_chart > div")
        roomCont.hide().eq(0).show()
        roomBtn.click(function(e){
            e.preventDefault()
            var target = $(this)
            var index = target.index()
            roomBtn.removeClass("active")
            target.addClass("active")
            roomCont.css("display", "none")
            roomCont.eq(index).css("display","block")
        })
        
        // 인증방 차트 이미지 슬라이드 - 미구현
        
        // 공지사항 탭 메뉴
        var tapMenu = $(".notice")
        
        // 컨텐츠 내용 감추기
        tapMenu.find("ul > li > ul").hide()
        tapMenu.find("li.active > ul").show()
        
        function tabList(e){
            e.preventDefault();     //#의 기능 차단
            var target = $(this)
            target.next().show().parent("li").addClass("active").siblings("li").removeClass("active").find("ul").hide()
            //버튼 클릭 시 ul를 보여주고, 부모 li 태그에 클래스 추가하고, 형제 li 태그에 클래스 제거하고, 제거한 자식의 ul 태그를 숨긴다
        }
        tapMenu.find("ul > li> a").click(tabList).focus(tabList)
    </script>
<%@ include file="footer.jsp"%>   
