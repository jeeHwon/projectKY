<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	// 로그인 안했을 시 로그인 페이지로 강제 이동
	if(session.getAttribute("userid")==null){
		response.sendRedirect("../login/log.jsp");
	} 

	String dchk=request.getParameter("dchk");
	pageContext.setAttribute("dchk", dchk);
%>
<jsp:include page="../header.jsp" />

<style>
#roomCreate .roomCreate {padding: 50px 0; position: relative;}    
#roomCreate h2 {font-size: 30px; font-weight: 500; margin-bottom: 20px;}    
#roomCreate .left {position: relative; margin-right: 423px; height: 1000px; padding: 34px; box-sizing: border-box; background: #f0f0f0}  
    
#roomCreate .left .name {overflow: hidden; font-size: 16px; padding-bottom: 2px;}    
#roomCreate .left .name .n1_2 {float: left; width: 49%; margin-right: 2%;}    
#roomCreate .left .name .n2_2 {float: left; width: 49%;}  
#roomCreate .left .name .n1_3 {float: left; width: 32%; margin-right: 2%;}    
#roomCreate .left .name .n2_3 {float: left; width: 32%; margin-right: 2%;}    
#roomCreate .left .name .n3_3 {float: left; width: 32%;}    

#roomCreate .left .select {overflow: hidden; padding-bottom: 10px;}    
#roomCreate .left .select .s1_2 {float: left; width: 49%; margin-right: 2%;}    
#roomCreate .left .select .s2_2 {float: left; width: 49%; }  
#roomCreate .left .select .s1_3 {float: left; width: 32%; margin-right: 2%;}    
#roomCreate .left .select .s2_3 {float: left; width: 32%; margin-right: 2%;}    
#roomCreate .left .select .s3_3 {float: left; width: 32%;} 

#roomCreate .left .box {position: relative; padding:5px; }
#roomCreate .left .box .box_under {position: absolute; font-size: 16px; left: 20px;}

#roomCreate .left .btn {overflow: hidden; margin-top: 2%; text-align: center;}
#roomCreate .left .btn a {float: left; width: 40%; box-sizing: border-box; display: block; padding: 10px 30px 12px 30px;}
#roomCreate .left .btn a.white {background-color: #fff; margin-right: 2%; margin-left: 9%; color: #CB230C; border: 1px solid #CB230C;}
#roomCreate .left .btn a.white:hover {background: #fff; border-color: #000; color: #000;}
#roomCreate .left .btn a.red {background-color: #CB230C; color: #fff; border: 1px solid #E68D80;}
#roomCreate .left .btn a.red:hover {background: #E68D80; border-color: #CB230C; color: #fff;}    
    
#roomCreate .right {position: absolute; right: 0; top: 50px; width: 400px; height: 1000px; padding: 34px; box-sizing: border-box; background: url(../assets/img/room_preview.png); background-size: auto; }   
#roomCreate .right h2 {color: #CB230C;}
#roomCreate .right .right_content {position: relative;}
#roomCreate .right .right_content .image_container {position: absolute; top: 11px; left: -9px; width: 350px; height: 513px; }
</style>    
    
<section id="roomCreate">
   <div class="container">
       <div class="row">
           <div class="roomCreate">
           		<form method="post" id="frm" name="frm" action="room_create_ok.jsp"  enctype="multipart/form-data">
                <div class="left">
                    <h2 class="title">인증방 만들기</h2>
                    
                    <div class="name">방 이름</div>
                    <div class="select">
                        <label for="r_title" class="ir_so">인증방 이름을 입력하여 주세요</label>
                        <input type="text" id="r_title" name="r_title" class="ui_input" placeholder="인증방 이름을 입력하여 주세요">
                    </div>
                    
                    <div class="name">
                        <div class="n1_2">시작일</div>
                        <div class="n2_2">종료일</div>
                    </div>
                    <div class="select">
                        <div class="s1_2">
                            <label for="r_start_day" class="ir_so">시작일</label>
                            <select id="r_start_day" name="r_start_day" class="ui_select"></select>
                        </div>
                        <div class="s2_2">
                            <label for="r_end_day" class="ir_so">종료일</label>
                            <select id="r_end_day" name="r_end_day" class="ui_select">
                            	<option>시작일을 선택하세요</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="name">
                        <div class="n1_3">카테고리</div>
                        <div class="n2_3">세부항목</div>
                        <div class="n3_3">인원수</div>
                    </div>
                    <div class="select">
                        <div class="s1_3">
                            <label for="r_cate_big" class="ir_so">카테고리</label>
                            <select id="r_cate_big" name="r_cate_big" class="ui_select">
                                <option value="s">공부</option>
                                <option value="x">운동</option>
                                <option value="w">기상</option>
                                <option value="f">음식</option>
                            </select>
                        </div>
                        <div class="s2_3">
                            <label for="r_cate_small" class="ir_so">세부항목</label>
                            <select name="r_cate_small" class="ui_select cate_small_def">
                                <option>카테고리 선택</option>
                            </select>
                            <select id="cate_small_s" name="r_cate_small" class="ui_select cate_small">
                                <option value="s_자격증">자격증</option>
                                <option value="s_공무원">공무원</option>
                                <option value="s_취업">취업</option>
                                <option value="s_수능">수능</option>
                                <option value="s_어학">어학</option>
                                <option value="s_기타">기타</option>
                            </select>
                            <select id="cate_small_x" name="r_cate_small" class="ui_select cate_small">
                                <option value="x_헬스">헬스</option>
                                <option value="x_홈트레이닝">홈트레이닝</option>
                                <option value="x_런닝">런닝</option>
                                <option value="x_걸음수">걸음수</option>
                                <option value="x_다이어트">다이어트</option>
                                <option value="x_요가">요가</option>
                            </select>
                            <select id="cate_small_w" name="r_cate_small" class="ui_select cate_small">
                                <option value="w_5시이전">5시이전</option>
                                <option value="w_5시~5시59분">5시~5시59분</option>
                                <option value="w_6시~6시59분">6시~6시59분</option>
                                <option value="w_7시~7시59분">7시~7시59분</option>
                                <option value="w_8시~8시59분">8시~8시59분</option>
                                <option value="w_9시~9시59분">9시~9시59분</option>
                            </select>
                            <select id="cate_small_f" name="r_cate_small" class="ui_select cate_small">
                                <option value="f_다이어트식단">다이어트식단</option>
                                <option value="f_건강식단">건강식단</option>
                                <option value="f_아침식사">아침식사</option>
                                <option value="f_점심식사">점심식사</option>
                                <option value="f_저녁식사">저녁식사</option>
                                <option value="f_기타">기타</option>
                            </select>
                        </div>                            
                        <div class="s3_3">
                            <label for="r_people" class="ir_so">인원수</label>
                            <select id="r_people" name="r_people" class="ui_select">
								<c:forEach var="i" begin="2" end="8" step="1">
									<option value="${i}">${i}명</option>
								</c:forEach>
                            </select>
                        </div>
                    </div>
                    
                    <div class="name">
                        <div class="n1_2">인증일</div>
                        <div class="n2_2">인증방식</div>
                    </div>
                    <div class="select">
                        <div class="s1_2 ui_checkbox box">
                            <div class="box_under">
                                <input type="checkbox" name="r_check_day" id="r_check_day_mon" value="mon">월&nbsp;&nbsp;
                                <input type="checkbox" name="r_check_day" id="r_check_day_tue" value="tue">화&nbsp;&nbsp;
                                <input type="checkbox" name="r_check_day" id="r_check_day_wed" value="wed">수&nbsp;&nbsp;
                                <input type="checkbox" name="r_check_day" id="r_check_day_thu" value="thu">목&nbsp;&nbsp;
                                <input type="checkbox" name="r_check_day" id="r_check_day_fri" value="fri">금&nbsp;&nbsp;
                                <input type="checkbox" name="r_check_day" id="r_check_day_sat" value="sat">토&nbsp;&nbsp;
                                <input type="checkbox" name="r_check_day" id="r_check_day_sun" value="sun">일&nbsp;
                            </div>
                        </div>
                        <div class="s2_2 ui_checkbox box">
                            <div class="box_under">
                                <input type="checkbox" name="r_certi_type" id="r_certi_type_pic" value="pic">사진&nbsp;&nbsp;
                                <input type="checkbox" name="r_certi_type" id="r_certi_type_txt" value="txt">텍스트&nbsp;&nbsp;
                                <input type="checkbox" name="r_certi_type" id="r_certi_type_mov" value="mov">동영상&nbsp;&nbsp;
                                <input type="checkbox" name="r_certi_type" id="r_certi_type_tim" value="tim">시간&nbsp;&nbsp;
                                <input type="checkbox" name="r_certi_type" id="r_certi_type_spa" value="spa">위치&nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
                    <div class="name">
                        <div class="n1_2">보증금</div>
                        <div class="n2_2">패널티</div>
                    </div>
                    <div class="select">
                        <div class="s1_2 ui_radio box">
                            <div class="box_under">
                                <input type="radio" name="r_deposit" id="r_deposit_5" value="5">5,000원&nbsp;&nbsp;
                                <input type="radio" name="r_deposit" id="r_deposit_10" value="10">10,000원&nbsp;&nbsp;
                                <input type="radio" name="r_deposit" id="r_deposit_15" value="15">15,000원&nbsp;&nbsp;
                                <input type="radio" name="r_deposit" id="r_deposit_20" value="20">20,000원&nbsp;&nbsp;
                  
                            </div>
                        </div>
                        <div class="s2_2 ui_radio box">
                            <div class="box_under">
                                <input type="radio" name="r_penalty" id="r_penaltyt_10" value="10">-10% &nbsp;&nbsp;
                                <input type="radio" name="r_penalty" id="r_penaltyt_15" value="15">-15% &nbsp;&nbsp;
                                <input type="radio" name="r_penalty" id="r_penaltyt_20" value="20">-20% &nbsp;&nbsp;
                                <input type="radio" name="r_penalty" id="r_penaltyt_25" value="25">-25% &nbsp;&nbsp;
                                <input type="radio" name="r_penalty" id="r_penaltyt_30" value="30">-30% &nbsp;&nbsp;
                            </div>                              
                        </div>
                    </div>
                    
                    <div class="name">방 소개</div>
                    <div class="select">
                        <label for="r_content" class="ir_so">인증방 소개를 해주세요</label>
                        <textarea class="ul_textarea" name="r_content" id="r_content" maxlength="200" placeholder="인증방의 목표와 특별한 점을 소개를 해주세요~"></textarea>
                    </div>
                    
                    <div class="name">방 배경이미지</div>
                    <div class="select">
                        <label for="r_content" class="ir_so">방 배경 이미지 파일을 선택해 주세요</label>
                        <input type="file" id="r_img" accept="image/*" name="r_img" onchange="setThumbnail(event)">
                    </div>
                    
                    <div class="name">
                        <div class="n1_3">참여제한</div>
                        <div class="n2_3">참여제한</div>
                        <div class="n3_3">참여제한</div>
                    </div>
                    <div class="select">
                        <div class="s1_3">
                            <label for="r_condition" class="ir_so">참여제한</label>
                            <select id="r_condition" name="r_condition" class="ui_select">
                                <option value="none">없음</option>
                                <option value="age">나이</option>
                                <option value="sex">성별</option>
                            </select>
                        </div>
                        <div class="s2_3">
                            <label for="r_condition2" class="ir_so">참여제한</label>
                            <select id="r_condition2" name="r_condition2" class="ui_select">
                                <option value="none">없음</option>
                                <option value="age">나이</option>
                                <option value="sex">성별</option>
                            </select>
                        </div>                            
                        <div class="s3_3">
                            <label for="r_condition3" class="ir_so">참여제한</label>
                            <select id="r_condition3" name="r_condition3" class="ui_select">
                                <option value="none">없음</option>
                                <option value="age">나이</option>
                                <option value="sex">성별</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="btn">
                        <a href="#" class="white">미리보기</a>
                        <a href="#" class="red" onclick="document.getElementById('frm').submit()">방만들기</a>
                    </div>
                </div>
                </form>
                   
                <div class="right">
                    <h2 class="title">방 미리보기</h2>
                    <div class="right_content">
                        <div class="image_container" id="image_container"></div>
                    </div>
                </div>                
           </div>
       </div>
   </div>
</section>
<script src="../assets/js/jquery.min_1.12.4.js"></script>
<script src="../assets/js/modernizr-custom.js"></script><!-- =>html5 css3 감지 -->
<script src="../assets/js/ie-checker.js"></script><!-- =>익스플로러 ver 체크 -->  
<script>
	// 파일첨부시 방미리보기 div에 이미지 파일 썸네일 적용 함수
    function setThumbnail(event) {
        var reader = new FileReader()
        reader.onload = function (event) {
            var img = document.createElement("img")
            img.setAttribute("src", event.target.result)
            img.setAttribute("width", "350px")
            img.setAttribute("height", "513px")
            document.querySelector("div#image_container").appendChild(img)
        }
        reader.readAsDataURL(event.target.files[0])
    }
   
	// 카테고리 선택시 그에 따른 세부카테고리 선택 함수
	$(function (){
		$('.cate_small').hide()
		
		$(document).on('change','#r_cate_big',function(){
			$('.cate_small').hide()
			$('.cate_small_def').hide()
			if ($('select[name=r_cate_big]>option:selected').index() == 0){
				$('.cate_small').removeAttr('name')
				$('.cate_small_def').removeAttr('name')
				$('#cate_small_s').attr({name:"r_cate_small"})
				$('#cate_small_s').show()
			}
			if ($('select[name=r_cate_big]>option:selected').index() == 1){
				$('.cate_small').removeAttr('name')
				$('.cate_small_def').removeAttr('name')
				$('#cate_small_x').attr({name:"r_cate_small"})
				$('#cate_small_x').show()
			}
			if ($('select[name=r_cate_big]>option:selected').index() == 2){
				$('.cate_small').removeAttr('name')
				$('.cate_small_def').removeAttr('name')
				$('#cate_small_w').attr({name:"r_cate_small"})
				$('#cate_small_w').show()
			}
			if ($('select[name=r_cate_big]>option:selected').index() == 3){
				$('.cate_small').removeAttr('name')
				$('.cate_small_def').removeAttr('name')
				$('#cate_small_f').attr({name:"r_cate_small"})
				$('#cate_small_f').show()
			}
		})
	})
	
	// 오늘 날짜로부터 10일 구하는 함수
	$(function (){
		for(var i = 0; i < 10; i++){    
			var today = new Date();
			today.setDate(today.getDate() + i); 
			
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var day = today.getDate();
			var value = year+"-"+month+"-"+day
			var option = $("<option value='"+value+"'>"+year+"년 "+month+"월 "+day+"일</option>");
			$('#r_start_day').append(option);
		}
	})
	
	// 시작일로부터 60일 구하는 함수
	$('#r_start_day').change(function() {
		$('#r_end_day').empty();
		var selectedDate = $('#r_start_day option:selected').val().split("-")
		for(var i = 1; i < 60; i++){    
			var targetDate = new Date(selectedDate[0], selectedDate[1], selectedDate[2])
			targetDate.setDate(targetDate.getDate() + i); 
			var year = targetDate.getFullYear();
			var month = targetDate.getMonth();
			var day = targetDate.getDate();
			var value = year+"-"+month+"-"+day
			var option = $("<option value='"+value+"'>"+year+"년 "+month+"월 "+day+"일</option>");
			$('#r_end_day').append(option);
		}

	})
	
	//보증금 부족시 방 생성되지 않게
	var dchk = ${dchk}+"";
	if(dchk==1)
	{
		alert('보증금이 부족합니다. 충전해주세요');
	}
</script>

<jsp:include page="../footer.jsp" />