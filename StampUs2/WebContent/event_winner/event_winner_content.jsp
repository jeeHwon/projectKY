<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.Event_winnerDAO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dto.Event_winnerDTO" %>
<%@page import="dao.Event_dat_DAO" %>
<%@page import="dto.Event_dat_DTO" %>
<% 
	int event_winner_no=Integer.parseInt(request.getParameter("event_winner_no"));
    Event_winnerDAO dao=new Event_winnerDAO();
	Event_winnerDTO edDTO = dao.content(event_winner_no);
	String userid = (String)session.getAttribute("userid")==null ? "" : (String)session.getAttribute("userid"); 
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String sword = (request.getParameter("sword") == null) ? "" : request.getParameter("sword");
%>
<style>
.event_row h1{
	font-size:20;
	padding: 15px 0 15px 0;
	border-bottom:1px solid black;
}
#event{
	font-size:17;
	height:800px;
	width:1000px;
	border-top:1px solid black;
	border-bottom:1px solid black;
	margin-bottom:15px;
}
.event_dat{
	font-size:13;
	height:300px;
	width:400px;	
}
#event_dat_content{
	width:500px; 
	height:100px;
}
#contentimg img{
	border-top:1px solid #a0a0a0;
	padding:15px 0 20px 0;
	width:800px;
	height:600px;
}
#event{
	margin-bottom:15px;
}
.head_view .h_tit {
    width: 500px;
    float: left;
    margin: 0;
    padding: 14px 0;
    font-size: 16px;
    word-wrap: break-word;
    word-break: break-all;
}
.head_view .h_info {
    float: right;
    width: 460px;
    text-align: right;
}
.h_info .info_item {
    display: inline-block;
}
.h_info .info_item strong, .info_item span {
    font-size: 14px;
    color: #a0a0a0;
    line-height: 45px;
    margin-right:10px;
}
.h_info .info_item + .info_item:before {
    content: '';
    display: inline-block;
    width: 1px;
    height: 14px;
    background: #c8c8c8;
    vertical-align: -2px;
    margin: 0 16px 0 10px;
}
</style>
<jsp:include page="../header.jsp" />

<section id="event_content">
<div class="container">
	<div class="event_row" align="center">
		<div id="event">
			<h1>이벤트에 당첨을 축하합니다!</h1>
			<div class="head_view">
				<p class="h_tit"><strong><%=edDTO.getEvent_winner_title()%></strong></p>
				<div class="h_info">
					<ul>
						<li class="info_item"><strong>조회수</strong><span><%=edDTO.getEvent_winner_view()%></span></li>
						<li class="info_item"><strong>작성일</strong><span><%=edDTO.getEvent_winner_postday()%></span></li>
					</ul>
				</div>
					<div id="contentimg">	
						<img src="../img/event/<%=edDTO.getEvent_winner_img()%>">
					</div>
				<div><%=edDTO.getEvent_winner_content()%></div>
			</div>
			<div id="listBtn">
				<a href="event__winner_list.jsp?pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">목록으로</a>
			</div>
		</div>
	</div>
</div>
</section>
<script>
function chkDel(){
	if(!confirm("삭제하시겠습니까?")){
		return false;
	}
}
</script>
<jsp:include page="../footer.jsp" />