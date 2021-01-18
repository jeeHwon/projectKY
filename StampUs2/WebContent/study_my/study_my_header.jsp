<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	String user_id = session.getAttribute("userid").toString();
	String study_no = request.getParameter("study_no");

	Study_my_DAO sDAO = new Study_my_DAO();
	Study_join_DAO sjDAO = new Study_join_DAO(); 
	
	ArrayList<Study_my_DTO> list = sDAO.list(Integer.parseInt(study_no));
	sDAO = new Study_my_DAO();
	ArrayList<GoalDTO> gList = sDAO.isCertDay(study_no);
	
	pageContext.setAttribute("list",list);

	pageContext.setAttribute("gList", gList);
	
	String r_id = request.getParameter("r_id");
	RoomDAO rdao = new RoomDAO();
	RoomDTO rdto = rdao.content(study_no);
	
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

<script src="../assets/js/jquery.min_1.12.4.js"></script>
<script>
$(function (){ 
	$("#dat_btn").click(function (){ 
		$("#study_dat_write").toggle(); 
	}); 
});


	function dat_update(study_dat_no, study_dat_content)
	{
		$("#study_dat_write").toggle();
		document.getElementById('dat_title').innerText='댓글 수정';
		document.getElementById('dat_button').value='댓글 수정';
		document.getElementById('study_dat_form').action='study_dat_update_ok.jsp';
		document.getElementById('study_dat_no').value=study_dat_no;
		document.getElementById('study_dat_content').innerText=study_dat_content;
		
	}
</script>

<style>

	#roomContent .room_title {font-size: 36px; text-align: left; color: #000; padding:10px; margin:0px;}
    #roomContent .header{height:160px;}
    
    #roomContent .preview_btn {float:right; margin-top: 2%; text-align: center; width:50%;}
    #roomContent .preview_btn a {font-size: 18px; box-sizing: border-box; display: inline-block; padding: 10px 30px 12px 30px;}
    #roomContent .preview_btn a.white {background-color: #fff; margin-right: 1%; margin-left: 1%; color: #CB230C; border: 1px solid #CB230C;}
    #roomContent .preview_btn a.white:hover {background: #fff; border-color: #000; color: #000;}
    #roomContent .preview_btn a.red {background-color: #CB230C; margin-right: 1%; margin-left: 1%; color: #fff; border: 1px solid #E68D80;}
    #roomContent .preview_btn a.red:hover {background: #E68D80; border-color: #CB230C; color: #fff;}  
    	
	#flexContent {display: flex; flex-wrap: wrap; flex-direction: row;}
	    
    #roomContent .preview_left {background: #2c2f34;}
    #roomContent .preview_left {order:0; height: 1000px; padding:20px;}
    #roomContent .preview_left > div {text-align: left;}

    #roomContent .preview_left .title strong{border-bottom: 1px solid #d7d7d7; padding: 0 0 10px 0;}
    #roomContent .preview_left .category {font-size: 24px; margin-top: 20px; text-align: left; color: #fff;}
    #roomContent .preview_left .date_1 {font-size: 18px; margin-top: 20px; text-align: left; color: #fff;}
    #roomContent .preview_left .date_2 {font-size: 18px; margin-top: 10px; text-align: left; color: #fff;}
    #roomContent .preview_left .date_1_box {width: 133px; display: inline-block;}
    #roomContent .preview_left .date_2_box {width: 90px; display: inline-block;}
    #roomContent .preview_left .day {font-size: 18px; margin-top: 20px; text-align: left; color: #fff; height: 30px; position: relative;}
    #roomContent .preview_left .day li {display: inline;}
    #roomContent .preview_left .day li.deactive {color: #717171;}
    #roomContent .preview_left .day_box {width: 50px; display: inline-block;}    
    #roomContent .preview_left .type {font-size: 18px; margin-top:20px; text-align: left; color: #fff; height: 30px; position: relative;}
    #roomContent .preview_left .type li {display: inline;}
    #roomContent .preview_left .type li.deactive {color: #717171;}
    #roomContent .preview_left .type_box {width: 35px; display: inline-block;}
    #roomContent .preview_left .money_1 {font-size: 18px; margin-top: 20px; text-align: left; color: #fff;}
    #roomContent .preview_left .money_2 {font-size: 18px; margin-top: 10px; text-align: left; color: #fff;}
    #roomContent .preview_left .money_1_box {width: 133px; display: inline-block;}
    #roomContent .preview_left .money_2_box {width: 115px; display: inline-block;}
    #roomContent .preview_left .text_box {position: absolute; margin-top: 30px; margin-left: 10px; width: 330px; height: 120px; border: 1px solid white; border-radius: 10px; padding:10px; text-align: left; overflow: hidden;}
    #roomContent .preview_left .text_box p {font-size: 16px; color: #fff;}
    #roomContent .preview_left .wrapper{height:500px;}
    
    #roomContent .goalList {background: #eee; padding:20px; }
    #roomContent .goalList h2 {font-size:24px; display:block;}
    #roomContent .goalList table {display:block; width:100%; font-size:18px;}
	#roomContetn .goalList table tr {border-bottom: 1px solid black; line-height: 40px;}    
    #roomContent .goalList table th {border-bottom: 1px solid black; width:160px;}

	#roomContent #study_list {order:1; width:65%; height: 100%;}
	#roomContent .study_my_list { margin-left:2%; padding:20px; border:1px solid black; border-radius: 10px; height: 100%; margin-bottom: 20px;}
	#roomContent .study_my_list h2 {font-size:24px; padding: 20px; border-bottom: 1px solid black;}
	#roomContent .study_my_list h3 {font-size:18px; padding: 20px; border-bottom: 1px solid black;}
	
	#roomContent .study_my_list .left_btn {float: left; width:70%;}
	#roomContent .study_my_list .right_btn {float: right; width:30%;}
	
	#roomContent .study_my_list a {font-size: 18px; box-sizing: border-box; display: inline-block; padding: 10px 30px 12px 30px;}
	#roomContent .study_my_list a.white {background-color: #fff; margin-right: 1%; margin-left: 1%; color: #CB230C; border: 1px solid #CB230C;}
    #roomContent .study_my_list a.white:hover {background: #fff; border-color: #000; color: #000;}
    #roomContent .study_my_list a.red {background-color: #CB230C; margin-right: 1%; margin-left: 1%; color: #fff; border: 1px solid #E68D80;}
    #roomContent .study_my_list a.red:hover {background: #E68D80; border-color: #CB230C; color: #fff;}  
    
    .study_my_list .content{font-size: 18px; padding: 20px;}
    .study_my_list .writeday{font-size: 18px; text-align: right;}
    
	.study_my_list table{width:100%;}
	.study_my_list table a{font-size:12px !important; padding-right:0px !important;}
	.study_my_list tr{line-height: 30px;}

	#study_dat_write{display: none;}
	#roomContent::after{clear:both;content:"";display:block;}
	#clear {clear:both; display:block;}
	
	#study_dat_content{width:75%; float:left; display: inline-block; padding: 20px; margin-top:5px;}
	#dat_button{font-size: 18px; float:right; box-sizing: border-box; display: inline-block; margin-top:5px; padding: 10px 30px 12px 30px; background-color: #CB230C; margin-right: 1%; margin-left: 1%; color: #fff; border: 1px solid #E68D80;}
	#dat_button:hover{background: #E68D80; border-color: #CB230C; color: #fff;}
	.dat_container::after{clear:both;content:"";display:block;}
	
	
	
</style>
<jsp:include page="../header.jsp" />
<section id="roomContent">
    <div class="container">
        <div class="row">
        	<div class="header">
        	<div class="room_title">
        		<div class="title"><strong>${rdto.title}</strong></div>
        	</div>
        	<div class="preview_btn">
                    <a href="study_my_list.jsp?study_no=<%=study_no %>" class="white">방으로 돌아가기</a>
                    <a href="study_my_cert.jsp?study_no=<%=study_no%>" class="white">전체 인증 현황 보기</a>
                    <a href="study_my_write.jsp?study_no=<%=study_no%>" class="white">글쓰기</a>
             </div>
             </div>
             <div id="flexContent">
            <div class="roomPreview">
               <!--//preview_left-->
                 
                <div class="preview_left">
                <div class="wrapper">
                    <div class="category"><strong># ${reCategory} # ${reCategory2}</strong></div>
                    <div class="date_1"><strong>시작일<span class="date_1_box"></span>종료일</strong></div>
                    <div class="date_2">${rdto.start_day}<span class="date_2_box"></span>${rdto.end_day}</div>
                    <div class="day">
                        <ul class="clearfix">
                        	<li><strong>인증일</strong></li>
                            <li class="day" id="mon">월&nbsp;</li>
                            <li class="day" id="tue">화&nbsp;</li>
                            <li class="day" id="wed">수&nbsp;</li>
                            <li class="day" id="thu">목&nbsp;</li>
                            <li class="day" id="fri">금&nbsp;</li>
                            <li class="day" id="sat">토&nbsp;</li>
                            <li class="day" id="sun">일&nbsp;</li>
                            <span class="day_box"></span>
                            
                        </ul>
                    </div>
                    <div class="type">
                        <ul class="clearfix">
   							<li><strong>인증방식</strong></li>
                            <li class="type" id="pic">사진&nbsp;</li>
                            <li class="type" id="txt">텍스트&nbsp;</li>
                            <li class="type" id="mov">동영상&nbsp;</li>
                            <li class="type" id="tim">시간&nbsp;</li>
                            <li class="type" id="spa">위치&nbsp;</li>
                            <span class="type_box"></span>
   
                        </ul>
                    </div>
                    <div class="money_1"><strong>보증금<span class="money_1_box"></span>패널티</strong></div>
                    <div class="money_2">${rdto.deposit},000원<span class="money_2_box"></span>-${penalty}원</div>
                    <div class="text_box">
                        <p>${rdto.content}</p>
                    </div>
                    </div>
                    <div class="goalList">
					<h2><strong>오늘의 인증 현황</strong></h2>
						<table>
							<tr>
								<th>아이디</th>
								<th>인증현황</th>
							</tr>
							<c:forEach var="dto" items="${gList}">
							<tr>
								<td>${dto.user_id}</td>
								<td>${dto.isgoal}</td>
							</tr>
						</c:forEach>
					</table>
			</div>
               </div>
            </div>