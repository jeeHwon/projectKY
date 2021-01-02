<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <section id="footer">
        <div id="footer_sns">
            <div class="container">
                <div class="footer_sns">
                    <ul>
                        <li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
                        <li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
                        <li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
                        <li class="icon s4"><a href="#"><span class="ir_pm">구글 플레이</span></a></li>
                        <li class="icon s5"><a href="#"><span class="ir_pm">아이폰 앱스토어</span></a></li>
                    </ul>
                    <div class="tel">
                        <a href="#">ARS <em>1544-0000</em></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer_info">
            <div class="container">
                <div class="row">
                    <div class="footer_info">
                        <h2><img src="<c:url value="/assets/img/logo_footer.png"/>" alt="STAMPUS"></h2>
                        <ul>
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">채용정보</a></li>
                            <li><a href="#">제휴/광고/부대사업문의</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">고객센터</a></li>
                            <li><a href="#">윤리경영</a></li>
                        </ul>
                        <address>
                            <p>
                                (주)스탬프어스 | 서울 구로구 구로역1번출구, 한국통신사업자연합회 202호 |  02-2039-2939<br>
                                사업자등록번호: 816-81-0135a | 통신판매업신고: 2018-서울구로-0364a<br>
                                대표: 김수연, 박준우, 유재석, 이재근, 이정삼, 지승원, 최홍준 | 이메일: support@stampus.com
                            </p>
                            <p>copyright 2021. StampUs. All rights reserved.</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //footer -->
    
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
</body>
</html>