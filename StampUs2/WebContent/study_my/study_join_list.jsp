<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Study_join_DTO" %>
<%@ page import="dao.Study_join_DAO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%

Study_join_DAO sjDAO=new Study_join_DAO();
 
ArrayList<Study_join_DTO> list = sjDAO.study_join_list(session.getAttribute("userid").toString());

pageContext.setAttribute("list", list);

%>
<style>
#roomList .roomList h2 {font-size: 30px; font-weight: 500; margin-bottom: 20px;} 
#roomList .roomList h3 {font-size: 20px; font-weight: 500; margin-bottom: 5px;} 

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
#roomList .roomList .room_list > div > div .infor .infor_btn a {display: inline-block; color:white; background: #D85543; font-size: 18px; padding: 15px 30px; width:75%; margin:0 auto; text-align: center;}
</style>
<jsp:include page="../header.jsp" />
<section id="roomList">
	<div class="container">
		<div class="row">
			<div class="roomList">
			<h2>현재 참여 중인 방 정보</h2>
			<c:if test="${list.size()==0}">
			참여중인 방이 없습니다
			</c:if>
			<c:if test="${list.size()>0}">
				<c:forEach var="i" begin="0" end="${fn:length(list)-1}" step="4">
                    <div class="room_list">
                        <div class="list_cont1">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i].room_file_name}" alt="">
                                    </figure>
                                    <div class="mx">
                                        <span class="icon dep${list[i].room_deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i].room_category} ir_pm">study</span><strong>${list[i].room_title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="study_my_list.jsp?study_no=${list[i].room_no}">인증방 가기</a>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${list[i+1]!=null}">
                            <div>
                            
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i+1].room_file_name}" alt="">
                                    </figure>
                                    <div class="mx">
                                        <span class="icon dep${list[i+1].room_deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i+1].room_category} ir_pm">study</span><strong>${list[i+1].room_title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="study_my_list.jsp?study_no=${list[i+1].room_no}">인증방 가기</a>
                                    </div>
                                </div>
                            </div>
                             </c:if>
                             
                            <c:if test="${list[i+2]!=null}">
                            <div>
                           
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i+2].room_file_name}" alt="">
                                    </figure>
                                    <div class="mx">
                                        <span class="icon dep${list[i+2].room_deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i+2].room_category} ir_pm">study</span><strong>${list[i+2].room_title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="study_my_list.jsp?study_no=${list[i+2].room_no}">인증방 가기</a>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                            <c:if test="${list[i+3]!=null}">
                            <div>
                                <div class="poster">
                                    <figure>
                                        <img src="../img/room/${list[i+3].room_file_name}" alt="">
                                    </figure>
                                    <div class="mx">
                                        <span class="icon dep${list[i+3].room_deposit} ir_pm">deposit</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="infor">
                                    <div class="infor_title"><h3><span class="icon cate_${list[i+3].room_category} ir_pm">study</span><strong>${list[i+3].room_title}</strong></h3></div>
                                    <div class="infor_btn">
                                        <a href="study_my_list.jsp?study_no=${list[i+3].room_no}">인증방 가기</a>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                        </div>
                    </div>
                    </c:forEach>
			</c:if>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp" />
    <!-- 자바스크립트 라이브러리 -->
    <script src="../assets/js/jquery.min_1.12.4.js"></script>
    <script src="../assets/js/modernizr-custom.js"></script><!-- =>html5 css3 감지 -->
    <script src="../assets/js/ie-checker.js"></script><!-- =>익스플로러 ver 체크 -->