<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.RoomDAO" %>
<%@ page import="dto.RoomDTO" %>
<%
	String r_id = request.getParameter("r_id");
	RoomDAO rdao = new RoomDAO();
	RoomDTO rdto = rdao.content(r_id);
	
	// 카테고리 읽어와 변환해 출력
	String reCategory = null;
    switch(rdto.getCategory()){
	    case "s": 
	    	reCategory = "공부";	       
	        break;
	    case "x":
	    	reCategory = "운동";
	        break;
	    case "f" :
	    	reCategory = "음식";
	        break;
	    case "w" :
	    	reCategory = "기상";
	        break;
	    default :
	    	reCategory = "카테고리";
	}
	pageContext.setAttribute("reCategory", reCategory);
	
	// 세부카테고리 읽어와 변환해 출력
	String reCategory2 = rdto.getCategory2().substring(2);
	pageContext.setAttribute("reCategory2", reCategory2);
	
	// 인증요일 받아와 인증 안하는 요일 비활성화 css 적용
	String check_day = rdto.getCheck_day();
	pageContext.setAttribute("check_day", check_day);	
	String check_day_toKor = check_day.replace("mon", "월");
	check_day_toKor = check_day_toKor.replace("tue", "화");
	check_day_toKor = check_day_toKor.replace("wed", "수");
	check_day_toKor = check_day_toKor.replace("thu", "목");
	check_day_toKor = check_day_toKor.replace("fri", "금");
	check_day_toKor = check_day_toKor.replace("sat", "토");
	check_day_toKor = check_day_toKor.replace("sun", "일");
	pageContext.setAttribute("check_day_toKor", check_day_toKor);	
	
	// 인증타입 받아와 인증 안하는 타입 비활성화 css 적용
	String certi_type = rdto.getCerti_type();
	pageContext.setAttribute("certi_type", certi_type);
	
	
	//패널티 비율따른 차감액 계산
	int penaltyRate = Integer.parseInt(rdto.getPenalty());
	int penalty = (int)(10 * penaltyRate * Integer.parseInt(rdto.getDeposit()));
	pageContext.setAttribute("penalty", penalty);	
	
	
	
	
	pageContext.setAttribute("rdto", rdto);

%>
<jsp:include page="../header.jsp" />

<style>
    #roomContent {background: #2c2f34;}
    #roomContent .roomPreview {padding: 50px 0; position: relative;}    
    #roomContent .roomPreview h2 {font-size: 30px; font-weight: 500; margin-bottom: 20px; color: #fff}
    #roomContent .preview_left {position: relative; width: 49%; height: 600px;}
    #roomContent .preview_left .preview_img {position: absolute; left: 200px; width: 350px; height: 513px; background-size: cover;}
    #roomContent .preview_left .current_people {position: absolute; left: 200px; top:513px; width: 350px;}
    #roomContent .preview_left .current_people > span > strong.left {font-size: 24px; color: #fff}
    #roomContent .preview_left .current_people > span > strong.right {float: right; font-size: 24px; color: #fff;}
    
    #roomContent .preview_right {position: absolute; width: 50%; height: 600px; top: 115px; right: 0; }
    #roomContent .preview_right > div {width: 550px; text-align: right;}
    #roomContent .preview_right .title {font-size: 36px; text-align: right; color: #fff; }
    #roomContent .preview_right .title strong{border-bottom: 1px solid #d7d7d7; padding: 0 0 10px 0;}
    #roomContent .preview_right .category {font-size: 24px; margin-top: 20px; text-align: right; color: #fff;}
    #roomContent .preview_right .date_1 {font-size: 18px; margin-top: 20px; text-align: right; color: #fff;}
    #roomContent .preview_right .date_2 {font-size: 18px; margin-top: 10px; text-align: right; color: #fff;}
    #roomContent .preview_right .date_1_box {width: 133px; display: inline-block;}
    #roomContent .preview_right .date_2_box {width: 90px; display: inline-block;}
    #roomContent .preview_right .day {font-size: 18px; margin-top: 20px; text-align: right; color: #fff; height: 30px; position: relative;}
    #roomContent .preview_right .day li {display: inline;}
    #roomContent .preview_right .day li.deactive {color: #717171;}
    #roomContent .preview_right .day_box {width: 50px; display: inline-block;}    
    #roomContent .preview_right .type {font-size: 18px; margin-top:20px; text-align: right; color: #fff; height: 30px; position: relative;}
    #roomContent .preview_right .type li {display: inline;}
    #roomContent .preview_right .type li.deactive {color: #717171;}
    #roomContent .preview_right .type_box {width: 35px; display: inline-block;}
    #roomContent .preview_right .money_1 {font-size: 18px; margin-top: 20px; text-align: right; color: #fff;}
    #roomContent .preview_right .money_2 {font-size: 18px; margin-top: 10px; text-align: right; color: #fff;}
    #roomContent .preview_right .money_1_box {width: 133px; display: inline-block;}
    #roomContent .preview_right .money_2_box {width: 115px; display: inline-block;}
    #roomContent .preview_right .text_box {position: absolute; margin-top: 30px; left: 180px; width: 350px; height: 120px; border: 1px solid white; border-radius: 10px; padding:10px; text-align: left; overflow: hidden;}
    #roomContent .preview_right .text_box p {font-size: 16px; color: #fff;}
    
    #roomContent .preview_btn {overflow: hidden; margin-top: 2%; text-align: center; padding-left: 380px;}
    #roomContent .preview_btn a {float: left; font-size: 18px; width: 150px; box-sizing: border-box; display: block; padding: 10px 30px 12px 30px;}
    #roomContent .preview_btn a.white {background-color: #fff; margin-right: 2%; margin-left: 9%; color: #CB230C; border: 1px solid #CB230C;}
    #roomContent .preview_btn a.white:hover {background: #fff; border-color: #000; color: #000;}
    #roomContent .preview_btn a.red {background-color: #CB230C; color: #fff; border: 1px solid #E68D80;}
    #roomContent .preview_btn a.red:hover {background: #E68D80; border-color: #CB230C; color: #fff;}    
    
    #roomDetail {padding: 100px 0; background: #f8f8f8;}
    #roomDetail .detail_title {margin-bottom: 60px;}
    #roomDetail .detail_title ul {overflow: hidden; width: 100%; margin: 0 auto; padding-left: 0%}
    #roomDetail .detail_title li {float: left; width: 308px; text-align: center;  margin-right: -1px;}
    #roomDetail .detail_title li a {display: block; padding: 15px 0; font-size: 18px; color: #666; font-weight: 700; border-bottom: 1px solid #CB230C; border-top: 1px solid #c4c4c4; border-right: 1px solid #c4c4c4; border-left: 1px solid #c4c4c4;}
    #roomDetail .detail_title li.active a {border: 2px solid #CB230C; border-bottom: 0px; color: #CB230C;font-weight: 700; position: relative;}
    #roomDetail .detail_cont{width: 100%; height: 500px; background: #fff; border: 1px solid #c4c4c4; padding: 50px 30px; box-sizing: border-box;}
    #roomDetail .detail_cont strong {font-size: 18px; margin-right: 30px; color: #555555;}
    #roomDetail .detail_cont span {font-size: 18px; color: #555555; display: inline-block; margin-bottom: 5px; width: 80%;}
    
    
    
</style>
<section id="roomContent">
    <div class="container">
        <div class="row">
            <div class="roomPreview">
                <h2>Preview</h2>
                <div class="preview_left">
                    <div class="preview_img" style="background: #ccc url(../assets/img/${rdto.file_name});"></div>
                    <div class="current_people">
                        <span><strong class="left">현재인원</strong></span>
                        <span><strong class="right">1 / ${rdto.people} </strong></span>
                    </div>
                </div>
                <!--//preview_left-->
                 
                <div class="preview_right">
                    <div class="title"><strong>${rdto.title}</strong></div>
                    <div class="category"><strong># ${reCategory} # ${reCategory2}</strong></div>
                    <div class="date_1"><strong>시작일<span class="date_1_box"></span>종료일</strong></div>
                    <div class="date_2">${rdto.start_day}<span class="date_2_box"></span>${rdto.end_day}</div>
                    <div class="day">
                        <ul class="clearfix">
                            <li class="day" id="mon">월&nbsp;</li>
                            <li class="day" id="tue">화&nbsp;</li>
                            <li class="day" id="wed">수&nbsp;</li>
                            <li class="day" id="thu">목&nbsp;</li>
                            <li class="day" id="fri">금&nbsp;</li>
                            <li class="day" id="sat">토&nbsp;</li>
                            <li class="day" id="sun">일&nbsp;</li>
                            <span class="day_box"></span>
                            <li><strong>인증일</strong></li>
                        </ul>
                    </div>
                    <div class="type">
                        <ul class="clearfix">
                            <li class="type" id="pic">사진&nbsp;</li>
                            <li class="type" id="txt">텍스트&nbsp;</li>
                            <li class="type" id="mov">동영상&nbsp;</li>
                            <li class="type" id="tim">시간&nbsp;</li>
                            <li class="type" id="spa">위치&nbsp;</li>
                            <span class="type_box"></span>
                            <li><strong>인증방식</strong></li>
                        </ul>
                    </div>
                    <div class="money_1"><strong>보증금<span class="money_1_box"></span>패널티</strong></div>
                    <div class="money_2">${rdto.deposit},000원<span class="money_2_box"></span>-${penalty}원</div>
                    <div class="text_box">
                        <p>${rdto.content}</p>
                    </div>
                </div>
                <!--//preview_right-->
                
                <div class="preview_btn">
                    <a href="room_list.jsp" class="white">목록보기</a>
                    <a href="#" class="red">참여하기</a>
                </div>
                <!--//preview_btn-->
            </div>
        </div>
    </div>
</section>    
<!-- //roomContent -->
   
<section id="roomDetail">
   <div class="container">
       <div class="row">
            <div class="roomDetail">
                <h2 class="ir_so">주요정보</h2>
                <div class="detail_title">
                    <ul>
                        <li class="active"><a href="">주요정보</a></li>
                        <li><a href="">인증상세</a></li>
                        <li><a href="">참여인정보</a></li>
                        <li><a href="">일정상세</a></li>
                    </ul>
                </div>
                <div class="detail_cont">
                    <strong>방생성일</strong><span>${rdto.write_day}</span><br/>
                    <strong>방제목</strong><span>${rdto.title}</span><br/>
                    <strong>시작일</strong><span>${rdto.start_day}</span><br/>
                    <strong>종료일</strong><span>${rdto.end_day}</span><br/>
                    <strong>카테고리</strong><span>${reCategory}</span><br/>
                    <strong>세부카테고리</strong><span>${reCategory2}</span><br/>
                    <strong>인원수</strong><span>최대 ${rdto.people}명</span><br/>
                    <strong>인증일</strong><span>${check_day_toKor}</span><br/>
                    <strong>인증방식</strong><span>사진 - 아침 식사 먹기전, 음식사진, 정중앙에, 메뉴 식별가능하게</span><br/>
                    <strong>인증방식2</strong><span>시간제한 - 아침 09시 00분까지</span><br/>
                    <strong>보증금</strong><span>${rdto.deposit},000원</span><br/>
                    <strong>패널티</strong><span>회당 ${penalty}원 차감</span><br/>
                    <strong>참여제한</strong><span>제한없음</span><br/>
                </div>
                
            </div>
       </div>
   </div>
</section>
<script src="../assets/js/jquery.min_1.12.4.js"></script>
<script src="../assets/js/modernizr-custom.js"></script><!-- =>html5 css3 감지 -->
<script src="../assets/js/ie-checker.js"></script><!-- =>익스플로러 ver 체크 -->   
<script>
    // 방 세부정보 탭 메뉴
    var detailBtn = $(".detail_title> ul > li")
    //var detailCont = $(".detail_chart > div")
    //detailCont.hide().eq(0).show()
    detailBtn.click(function(e){
        e.preventDefault()
        var target = $(this)
        var index = target.index()
        detailBtn.removeClass("active")
        target.addClass("active")
        //detailCont.css("display", "none")
        //detailCont.eq(index).css("display","block")
    })
    
    //인증요일 비활성화
   	var day_li = $(".day > ul > li.day")

	$(document).ready(function() { 
		var check_day = '<c:out value="${check_day}"/>'
		day_li.addClass('deactive')
		dayList = ['mon','tue','wed','thu','fri','sat','sun']
		for(var i=0; i<dayList.length; i++) {
			if(check_day.includes(dayList[i])){
				$('#'+dayList[i]).removeClass('deactive')
			}
		}
	})
	
	//인증타입 비활성화
   	var type_li = $(".type > ul > li.type")

	$(document).ready(function() { 
		var certi_type = '<c:out value="${certi_type}"/>'
		type_li.addClass('deactive')
		typeList = ['pic','txt','mov','tim','spa']
		for(var i=0; i<typeList.length; i++) {
			if(certi_type.includes(typeList[i])){
				$('#'+typeList[i]).removeClass('deactive')
			}
		}
	})

    
    
</script>

<jsp:include page="../footer.jsp" />