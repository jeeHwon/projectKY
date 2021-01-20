<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.RoomDAO" %>
<%@ page import="dto.RoomDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
	String check = "";
	String category = "";
	if (request.getParameter("cate1")==null & request.getParameter("cate2")==null){
		RoomDAO rdao = new RoomDAO();
		ArrayList<RoomDTO> list = rdao.list();
		pageContext.setAttribute("list", list);
		String chk=request.getParameter("chk");
		String dchk=request.getParameter("dchk");
		pageContext.setAttribute("chk", chk);	
		pageContext.setAttribute("dchk", dchk);
	} else{
		String cate1 = request.getParameter("cate1");
		String cate2 = request.getParameter("cate2");
		switch (cate1){
		case "공부":	category="s_";break;
		case "운동":	category="x_";break;
		case "기상":	category="w_";break;
		case "음식":	category="f_";break;
		default:category="_";break;
		}
		category = category + cate2;	
		
		RoomDAO rdao = new RoomDAO();
		ArrayList<RoomDTO> list = rdao.cateList(category);
		pageContext.setAttribute("list", list);
		String chk=request.getParameter("chk");
		String dchk=request.getParameter("dchk");
		pageContext.setAttribute("chk", chk);	
		pageContext.setAttribute("dchk", dchk);
	}
	if(request.getParameter("sort")!=null){
		RoomDAO rdao = new RoomDAO();
		ArrayList<RoomDTO> list = rdao.sort_list(request.getParameter("sort"));
		pageContext.setAttribute("list", list);
		String chk=request.getParameter("chk");
		String dchk=request.getParameter("dchk");
		pageContext.setAttribute("chk", chk);
		pageContext.setAttribute("dchk", dchk);
	}
	


%>

<jsp:include page="../header.jsp" />

<style>
#roomList .roomList {padding: 50px 0; position: relative;}    
#roomList .roomList h2 {font-size: 30px; font-weight: 500; margin-bottom: 20px;} 
#roomList .roomList h3 {font-size: 20px; font-weight: 500; margin-bottom: 5px;} 
    
#roomList .roomList .cate_title ul {overflow: hidden; width: 100%; margin: 0 auto 20px auto; }    
#roomList .roomList .cate_title li {float: left; width: 120px; text-align: center; border: 1px solid #D85543; margin-right: -1px;}    
#roomList .roomList .cate_title li a {display: block; padding: 15px 0; font-size: 18px; color: #666; font-weight: 700;}    
#roomList .roomList .cate_title li.active a {background: #CB230C; color: #fff;}
    
#roomList .roomList .cate_detail > div > ul {overflow: hidden; width: 100%; margin: 0 auto 20px auto;}
#roomList .roomList .cate_detail > div > ul > li {float: left; width: 120px; text-align: center; border: 1px solid #D85543; margin-right: -1px;}        
#roomList .roomList .cate_detail > div > ul > li a {display: block; padding: 15px 0; font-size: 18px; color: #666; font-weight: 700;}    
#roomList .roomList .cate_detail > div > ul > li.active a {background: #CB230C; color: #fff;}

#roomList .roomList .cate_search {width: 200px; height:30px; border-radius: 30px; margin-top:30px; margin-bottom: 30px; text-align: center; border: 1px solid #CB230C; background:#CB230C;}
#roomList .roomList .cate_search ul li a {display: block; color: #fff; font-size: 18px;}
#roomList .roomList .cate_search ul li a:hover {color: #333; }

#roomList .roomList .sort {margin-bottom: 30px;}
#roomList .roomList .sort ul {width: 380px; padding-left: 10px; border-bottom: 2px solid #c4c4c4;}
#roomList .roomList .sort li {display: inline; position: relative; margin-right: 30px;}
#roomList .roomList .sort li a {font-size: 16px;}
#roomList .roomList .sort li.checked a {font-weight: 500; color:#CB230C }

#roomList .roomList .room_list {height: 592px; margin: 30px 0;}  
#roomList .roomList .room_list > div {overflow: hidden;}
#roomList .roomList .room_list > div > div {float: left; width: 292px; height: 592px; margin-right: 18px;}
#roomList .roomList .room_list > div > div:last-child {margin-right: 0;}
#roomList .roomList .room_list > div > div .poster {position: relative;}
#roomList .roomList .room_list > div > div .poster img {display: block; width:292px; height:427.98px;}
#roomList .roomList .room_list > div > div .poster .rank {position: absolute; top: 17px; left: 0; width: 50px; height: 50px; font-size: 22px; box-shadow: 3px 3px 8px rgba(0,0,0,0.5); line-height: 50px; background-color: #CB230C; text-align: center;}
#roomList .roomList .room_list > div > div .poster .rank strong {color: #fff; text-shadow: 2px 2px 3px rgba(0,0,0,1);}
#roomList .roomList .room_list > div > div .poster .mx {position: absolute; top: 17px; right: 17px;}
#roomList .roomList .room_list > div > div .poster .mx span {width: 103px; height: 25px; display: block;}
#roomList .roomList .room_list > div > div .poster .mx .dep5 {background-image: url(../assets/img/icon_dep5.png); background-size: cover;}
#roomList .roomList .room_list > div > div .poster .mx .dep10 {background-image: url(../assets/img/icon_dep10.png); background-size: cover;}
#roomList .roomList .room_list > div > div .poster .mx .dep15 {background-image: url(../assets/img/icon_dep15.png); background-size: cover;}
#roomList .roomList .room_list > div > div .poster .mx .dep20 {background-image: url(../assets/img/icon_dep20.png); background-size: cover;}
#roomList .roomList .room_list > div > div .infor {background: #fff; padding: 17px; border: 1px solid #d9d9d9;}
#roomList .roomList .room_list > div > div .infor .infor_title {width:260px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
#roomList .roomList .room_list > div > div .infor h3 {color: #333; font-size: 24px; font-weight: 700; margin-bottom: 20px;}
#roomList .roomList .room_list > div > div .infor h3 strong {}
#roomList .roomList .room_list > div > div .infor h3 span {width: 29px; height: 29px; display: inline-block; margin-top: 9px; margin-right: 3px; vertical-align: -5px;}
#roomList .roomList .room_list > div > div .infor h3 span.cate_s{background-image: url(../assets/img/icon_cate_s.png); background-size: cover;}
#roomList .roomList .room_list > div > div .infor h3 span.cate_x{background-image: url(../assets/img/icon_cate_x.png); background-size: cover;}
#roomList .roomList .room_list > div > div .infor h3 span.cate_f{background-image: url(../assets/img/icon_cate_f.png); background-size: cover;}
#roomList .roomList .room_list > div > div .infor h3 span.cate_w{background-image: url(../assets/img/icon_cate_w.png); background-size: cover;}
#roomList .roomList .room_list > div > div .infor .infor_btn a {display: inline-block; background: #f2f2f2; font-size: 18px; padding: 15px 30px;}
</style>
    
    <section id="roomList">
        <div class="container">
            <div class="row">
                <div class="roomList">
                    <h2>인증방 찾기</h2>
                    <h3>카테고리 선택</h3>
                    <div class="cate_title">
                        <ul>
                            <li class="active"><a class="nav_sub_a" href="#">공부</a></li>
                            <li><a class="" href="#">운동</a></li>
                            <li><a class="" href="#">기상</a></li>
                            <li><a class="" href="#">음식</a></li>
                            <li><a class="" href="#">장소</a></li>
                            <li><a class="" href="#">목표</a></li>
                            <li><a class="" href="#">취미</a></li>
                            <li><a class="" href="#">기타</a></li>
                        </ul>
                    </div>
                    
                    <h3>세부 카테고리 선택</h3>
                    <div class="cate_detail">
                        <div class="cate_detail_01">
                            <ul>
                                <li class="active"><a class="" href="#">자격증</a></li>
                                <li><a class="" href="#">공무원</a></li>
                                <li><a class="" href="#">취업</a></li>
                                <li><a class="" href="#">수능</a></li>
                                <li><a class="" href="#">어학</a></li>
                                <li><a class="" href="#">기타</a></li>
                            </ul>
                        </div>                    
                        <div class="cate_detail_02">
                            <ul>
                                <li class="active"><a class="" href="#">헬스</a></li>
                                <li><a class="" href="#">홈트레이닝</a></li>
                                <li><a class="" href="#">런닝</a></li>
                                <li><a class="" href="#">걸음수</a></li>
                                <li><a class="" href="#">다이어트</a></li>
                                <li><a class="" href="#">요가</a></li>
                            </ul>
                        </div>                         
                        <div class="cate_detail_03">
                            <ul>
                                <li class="active"><a class="" href="#">5시이전</a></li>
                                <li><a class="" href="#">5시~5시59분</a></li>
                                <li><a class="" href="#">6시~6시59분</a></li>
                                <li><a class="" href="#">7시~7시59분</a></li>
                                <li><a class="" href="#">8시~8시59분</a></li>
                                <li><a class="" href="#">9시~9시59분</a></li>
                            </ul>
                        </div> 
                        <div class="cate_detail_04">
                            <ul>
                                <li class="active"><a class="" href="#">다이어트식단</a></li>
                                <li><a class="" href="#">건강식단</a></li>
                                <li><a class="" href="#">아침식사</a></li>
                                <li><a class="" href="#">점심식사</a></li>
                                <li><a class="" href="#">저녁식사</a></li>
                                <li><a class="" href="#">기타</a></li>
                            </ul>
                        </div>                         
                        <div class="cate_detail_05">
                            <ul>
                                <li class="active"><a class="" href="#">독서실</a></li>
                                <li><a class="" href="#">도서관</a></li>
                                <li><a class="" href="#">집</a></li>
                                <li><a class="" href="#">회사</a></li>
                                <li><a class="" href="#">학원</a></li>
                                <li><a class="" href="#">기타</a></li>
                            </ul>
                        </div>                       
                        <div class="cate_detail_06">
                            <ul>
                                <li class="active"><a class="" href="#">저축</a></li>
                                <li><a class="" href="#">가계부</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                            </ul>
                        </div>                         
                        <div class="cate_detail_07">
                            <ul>
                                <li class="active"><a class="" href="#">독서</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                            </ul>
                        </div>                         
                        <div class="cate_detail_08">
                            <ul>
                                <li class="active"><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                                <li><a class="" href="#">추후추가</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="cate_search">
                    	<ul>
                    		<li><a href="#" onclick="cate_search()">카테고리로 검색하기</a></li>
                    	</ul>
                    </div>
                    
                    <h3>정렬</h3>
                    <div class="sort">
                        <ul>
                            <li class="checked"><a href="#" onclick="list_sort(0)">최신순</a></li>
                            <li><a href="#" onclick="list_sort(1)">인기순</a></li>
                            <li><a href="#" onclick="list_sort(2)">오래된순</a></li>
                            <li><a href="#" onclick="list_sort(3)">마감임박순</a></li>
                        </ul>
                    </div>
                   
                    <h3>인증방 목록</h3>
                    <c:forEach var="i" begin="0" end="${fn:length(list)-1}" step="4">
                    <div class="room_list">
                        <div class="list_cont1">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i].file_name}" alt="">
                                    </figure>
                                    <div class="rank"><strong>${i+1}</strong></div>
                                    <div class="mx">
                                        <span class="icon dep${list[i].deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i].category} ir_pm">study</span><strong>${list[i].title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="room_content.jsp?r_id=${list[i].id}">상세보기</a>
                                        <a href="../study_my/study_join_ok.jsp?room_no=${list[i].id}">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i+1].file_name}" alt="">
                                    </figure>
                                    <div class="rank"><strong>${i+2}</strong></div>
                                    <div class="mx">
                                        <span class="icon dep${list[i+1].deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i+1].category} ir_pm">study</span><strong>${list[i+1].title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="room_content.jsp?r_id=${list[i+1].id}">상세보기</a>
                                        <a href="../study_my/study_join_ok.jsp?room_no=${list[i+1].id}">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i+2].file_name}" alt="">
                                    </figure>
                                    <div class="rank"><strong>${i+3}</strong></div>
                                    <div class="mx">
                                        <span class="icon dep${list[i+2].deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i+2].category} ir_pm">study</span><strong>${list[i+2].title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="room_content.jsp?r_id=${list[i+2].id}">상세보기</a>
                                        <a href="../study_my/study_join_ok.jsp?room_no=${list[i+2].id}">참여하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i+3].file_name}" alt="">
                                    </figure>
                                    <div class="rank"><strong>${i+4}</strong></div>
                                    <div class="mx">
                                        <span class="icon dep${list[i+3].deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i+3].category} ir_pm">study</span><strong>${list[i+3].title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="room_content.jsp?r_id=${list[i+3].id}">상세보기</a>
                                        <a href="../study_my/study_join_ok.jsp?room_no=${list[i+3].id}">참여하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>    
            </div>            
        </div>
    </section>
    
    <!-- 자바스크립트 라이브러리 -->
    <script src="../assets/js/jquery.min_1.12.4.js"></script>
    <script src="../assets/js/modernizr-custom.js"></script><!-- =>html5 css3 감지 -->
    <script src="../assets/js/ie-checker.js"></script><!-- =>익스플로러 ver 체크 -->
    <script>
        // 인증방 찾기 cate_title 탭 메뉴
        var roomBtn = $(".cate_title> ul > li")
        var roomCont = $(".cate_detail > div")
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
        
        // 인증방 찾기 cate_detail 탭 메뉴
        var detailBtn = $(".cate_detail> div > ul > li")
        detailBtn.click(function(e){
            e.preventDefault()
            var target = $(this)
            var index = target.index()
            detailBtn.removeClass("active")
            target.addClass("active")
        })        
        
        // 인증방 찾기 정렬 체크하기
        var checkA = $(".sort > ul > li")
        checkA.click(function(e){
            e.preventDefault()
            var target = $(this)
            var index = target.index()
            checkA.removeClass("checked")
            target.addClass("checked")
        })
        
        // 인증방 중복 참여시 경고창
        var chk = ${chk}+"";
        if(chk==1)
        {
        	alert('이미 참여중인 방입니다')
        }
        else
        {
        	
        }
        
        // 인증방 보증금 부족시 경고창
        var dchk = ${dchk}+"";
        if(dchk==1)
        {
        	alert('보증금이 부족합니다. 충전해주세요')
        }
        else
        {
        	
        }
        
        //카테고리 검색시 파라미터 전송
        function cate_search(){
        	var activeCate = document.getElementsByClassName("active");
        	cate1 = activeCate.item(0).innerText	        	
        	cate2 = activeCate.item(1).innerText
        	
            var form = document.createElement('form');
            form.setAttribute('method', 'post'); 
            form.setAttribute('action', 'room_list.jsp');
            document.charset = "utf-8";
            params = {'cate1':cate1, 'cate2':cate2}
            for ( var key in params) {
                var hiddenField = document.createElement('input');
                hiddenField.setAttribute('type', 'hidden'); 
                hiddenField.setAttribute('name', key);
                hiddenField.setAttribute('value', params[key]);
                form.appendChild(hiddenField);
            }
            document.body.appendChild(form);
            form.submit();
        }
        
        function list_sort(n){
            var form = document.createElement('form');
            form.setAttribute('method', 'post'); 
            form.setAttribute('action', 'room_list.jsp');
            document.charset = "utf-8";
            params = {'sort':n}
            var hiddenField = document.createElement('input');
            hiddenField.setAttribute('type', 'hidden'); 
            hiddenField.setAttribute('name', 'sort');
            hiddenField.setAttribute('value', n);
            form.appendChild(hiddenField);
            document.body.appendChild(form);
            form.submit();
        }

    </script>

<jsp:include page="../footer.jsp" />