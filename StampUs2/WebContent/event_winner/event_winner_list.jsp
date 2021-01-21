<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.Event_winnerDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.Event_winnerDTO" %>
<%@page import="java.util.ArrayList" %>
<%
	String userid=(String)session.getAttribute("userid");
	request.setCharacterEncoding("utf-8");
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	Event_winnerDTO eDTO = new Event_winnerDTO();
	Event_winnerDAO eDAO = new Event_winnerDAO();
    
    //==========검색============
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String sword = (request.getParameter("sword") == null) ? "" : request.getParameter("sword");
    ArrayList<Event_winnerDTO> list=eDAO.list(cla,sword,pager);
%>
<jsp:include page="../header.jsp" />
<style>
.flist{
	width: 1100px;
}
table {
	width:1100px;
	border-top: 1px double #222;
	border-collapse: collapse;
}
tr {
	padding: 5px;
}
div.center{font-size:30pt;}
tr.top{
	border-bottom: 7px solid #222;
	font-size:17pt;
}
tr.mid {
	border-bottom:1px solid #222;
	font-size:12pt;
}
tr.bottom{
	font-size:17pt;
	
}
tr.page{
	font-size:17pt;
	height:100px;

}
.page>td>a{
	padding:7px;
}
.form{
	width:30%;
	padding:80px 0 15px 0;
	float:right;
	font-size:17pt;
}
button i {/*검색아이콘*/
	color:#CB230C;
	background:white;
	padding:0 0 0 10px;
	cursor:pointer;
}
/*===================== 이미지 슬라이더==================== */
.event_slider input[id*="slide"]{
    display: none;
}
.event_slider .event_img_slider{
    max-width: 1100px;
    margin: 0 auto;
    overflow: hidden;
    position: relative;
}
.event_slider .slidelist{
    white-space: nowrap;
    font-size: 0;
}
.event_slider .slidelist > li{
    display: inline-block;
    vertical-align: middle;
    width: 100%;
    transition: all.5s;
}
.event_slider .slidelist > li > a{
    display: block;
    position: relative;
}
.event_slider .slidelist > li > a img{
    width: 100%;
}
ul {
    list-style-type: disc;
}
.event_slider .slidelist label{
    position: absolute;
    z-index: 10;
    top: 50%;
    transform: translateY(-50%);
    padding: 50px;
    cursor: pointer;
}
.event_slider .slide-control .left{
    left: 30px;
    background:url('eventImg/left.png') center center / 100% no-repeat;
}
.event_slider .slide-control .right{
    right: 30px;
    background:url('eventImg/right.png') center center / 100% no-repeat;
}
.event_slider [id="slide1"]:checked ~ .event_img_slider .slidelist > li {transform:translateX(0%);}
.event_slider [id="slide2"]:checked ~ .event_img_slider .slidelist > li {transform:translateX(-100%);}
.event_slider [id="slide3"]:checked ~ .event_img_slider .slidelist > li {transform:translateX(-200%);}

/* 슬라이드 화살표 고정*/
.slide-control label {
    position: absolute;
    z-index: 1;
    top: 50%;
    transform: translateY(-50%);
    padding: 50px;
    cursor: pointer;
}
.event_slider .slide-control [class*="control"] {display:none;}
.event_slider [id="slide1"]:checked ~ .event_img_slider .control1 {display: block;}
.event_slider [id="slide2"]:checked ~ .event_img_slider .control2 {display: block;}
.event_slider [id="slide3"]:checked ~ .event_img_slider .control3 {display: block;}

/*=======================카테고리===========================*/
.event{
	max-width:1100px;
	padding:0;
}
#cate{
	padding:50px 0 0 0;
}
.cate_title ul {overflow: hidden; width: 100%; margin: 0 auto 20px auto; }    
.cate_title li {float: left; width: 120px; text-align: center; border: 1px solid #D85543; margin-right: -1px;}    
.cate_title li a {display: block; padding: 15px 0; font-size: 18px; color: #666; font-weight: 700;}    
.cate_title li.active a {background: #CB230C; color: #fff;}
.cate_title{padding: 50px 0; position: relative;}  

/*======================정렬======================*/
h3{
	font-size: 30px;
    font-weight: 500;
    margin-top:70px;
    float:left;
}
.checked{
    background: #CB230C;
    color: #fff;
}
</style>
<script src="https://kit.fontawesome.com/066a49883d.js" crossorigin="anonymous"></script>
<section id="event_slider">
	<div class="container">
		<div class="row">
		</div>
	</div>
</section>

<!-- list -->
<section id="event_winner_list">
	<div class="container" align="center">
		<div class="row">
			<!-- ==============이미지 슬라이더 =================-->
			<div class="event_slider">
				<input type="radio" name="slide" id="slide1" checked> <input
					type="radio" name="slide" id="slide2"> <input type="radio"
					name="slide" id="slide3">
				<div class="event_img_slider">
					<ul class="slidelist">
						<li><a href="#"><img src="eventImg/event_img1.jpg"
								alt="이벤트" class="event_img"></a></li>
						<li><a href="#"><img src="eventImg/event_img2.png"
								alt="이벤트" class="event_img"></a></li>
						<li><a href="#"><img src="eventImg/event_img3.jpg"
								alt="이벤트" class="event_img"></a></li>
					</ul>
					<div class="slide-control">
						<div class="control1">
							<label for="slide3" class="left"></label> <label for="slide2"
								class="right"></label>
						</div>
						<div class="control2">
							<label for="slide1" class="left"></label> <label for="slide3"
								class="right"></label>
						</div>
						<div class="control3">
							<label for="slide2" class="left"></label> <label for="slide1"
								class="right"></label>
						</div>
					</div>
				</div>
			</div>
			<!--=================카테고리&오늘의 추천이벤트 =================-->
			<div class="event">
			    <div class="cate_title" id="cate">
			        <ul>
			            <li><a href="#">오늘의 추천</a></li>
			            <li><a class="" href="#">관심집중</a></li>
			            <li><a class="" href="#">NEW</a></li>
			            <li><a class="" href="#">마감임박</a></li>
			            <li class="active"><a class="nav_sub_a" href="event_winner_list.jsp">당첨자발표</a></li>
			        </ul>
			    </div>
                <div class="event_left">
                    <div class="event_slider">
                        <a href="#"><img src="../assets/img/event01.jpg" alt="이벤트 이미지1"></a>
                    </div>
                    <div class="event_box1">
                        <a href="#"><img src="../assets/img/event02.jpg" alt="이벤트 이미지2"></a>
                    </div>
                    <div class="event_box2">
                        <a href="#"><img src="../assets/img/event03.jpg" alt="이벤트 이미지3"></a>
                    </div>
                </div>
                <div class="event_right">
                     <a href="#"><img src="../assets/img/event04.jpg" alt="이벤트 이미지4"></a>
                </div>
            </div>
			<!--==================검색=====================-->
			<div class="flist">
                <h3>당첨자발표</h3>
				<div class="form">
					<form name="eventSearchFrm" action="event_winner_list.jsp">
						<select name="cla">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> 
						<input type="text" name="sword" value="<%=sword%>"> 
						<button><i class="fas fa-search fa-2x"></i></button> 
					</form>
				</div>
				<table>
					<tr align="center" class="top" height="50">
						<td>글번호</td>
						<td>제목</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
					<%for (int i = 0; i < list.size(); i++) {	%>
					<tr class="mid" height="50">
						<td align="center"><%=list.get(i).getEvent_winner_no()%></td>
						<td align="center">
							<a href="event_winner_getView.jsp?event_winner_no=<%=list.get(i).getEvent_winner_no()%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>"><%=list.get(i).getEvent_winner_title()%></a>
						</td>
						<td align="center"><%=list.get(i).getEvent_winner_postday()%></td>
						<td align="center"><%=list.get(i).getEvent_winner_view()%></td>
					</tr>
					<% }%>
					<c:if test="${userid eq 'admin'}">
						<tr class="bottom" height="50">
						<td colspan="4" align="center" id="">
							<a href="event_write.jsp">글쓰기</a>
						</td>
						</tr>
					</c:if>
					<tr class="page" height="50">
						<td colspan="4" align="center">
					  <%
				         // 총 페이지값을 구하기  
				          int page_cnt=eDAO.getTotalPage();
				          int pstart=eDAO.getPstart(page_cnt,pager);
				          int pend=eDAO.getPend(page_cnt,pstart); 
				      %> <!-- 이전페이지 --> <!-- 현재 페이지 그룹 이전 10페이지 --> 
				      <% if(pstart != 1){//(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이냐 => pstart=1)  %>
							<a href="event_winner_list.jsp?pager=<%=pstart-1%>&cla=<%=cla%>&sword=<%=sword%>">
								<i class="fas fa-angle-double-left"></i></a> 
					  <% }else{ %><i class="fas fa-angle-double-left"></i> <% }%> <!-- 현재페이지 기준 1페이지 이전 --> <% if(Integer.parseInt(pager) != 1){ %>
							<a href="event_winner_list.jsp?pager=<%=Integer.parseInt(pager)-1%>&cla=<%=cla%>&sword=<%=sword%>">
								<i class="fas fa-angle-left"></i>
							</a> 
						<% }else { %> <i class="fas fa-angle-left"></i>
						<% } for(int i=pstart;i<=pend;i++){
				             String str="";
				            if(Integer.parseInt(pager) == i)
				               str="style='color:red;'";  %> 
				               <a href="event_winner_list.jsp?pager=<%=i%>&cla=<%=cla%>&sword=<%=sword%>" <%=str%>> <%=i%>
						</a> 
						<!-- 페이지네이션 --> 
						<% }%> <!-- 다음페이지 --> 
						<!-- 현재페이지 기준 1페이지 이후 --> 
						<% if(Integer.parseInt(pager) != page_cnt){%>
							<a href="event_winner_list.jsp?pager=<%=Integer.parseInt(pager)+1%>&cla=<%=cla%>&sword=<%=sword%>">
								<i class="fas fa-angle-right"></i>
						    </a> 
						<%}else{ %><i class="fas fa-angle-right"></i><% }%> <!-- 현재페이지 기준 다음 그룹으로 이동 -->
						<%if(page_cnt != pend){%>
							<a href="event_winner_list.jsp?pager=<%=pend+1%>&cla=<%=cla%>&sword=<%=sword%>">
								<i class="fas fa-angle-double-right"></i>
							</a> 
						<% }else{ %> <i class="fas fa-angle-double-right"></i> <%} %>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
<script>
function init(){
   document.eventSearchFrm.cla.value="<%=cla%>"
   if (document.eventSearchFrm.cla.value==""){
 	  document.eventSearchFrm.cla.value="title"
   }
}
init();
</script>
<jsp:include page="../footer.jsp" />