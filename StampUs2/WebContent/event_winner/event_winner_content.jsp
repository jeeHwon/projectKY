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
	Event_winnerDTO ewDTO = dao.content(event_winner_no);
	String userid = (String)session.getAttribute("userid")==null ? "" : (String)session.getAttribute("userid"); 
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String sword = (request.getParameter("sword") == null) ? "" : request.getParameter("sword");
%>
<style>
#erow{
	width:1000px;
	height:1180px;
}
.event_row h1{
	font-size:20;
	padding:100px 0 15px 0;
}
#event{
	font-size:17;
	height:800px;
	width:1000px;
	border-top:1px solid black;
	border-bottom:1px solid black;
	margin-bottom:15px;
}

/*content 테이블=============*/

#event img{
	border-top:1px solid #a0a0a0;
	padding:15px 0 20px 0;
	width:800px;
	height:600px;
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
	padding-top:5px;
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
#getCon{
	width:800px;
	padding-bottom:45px;
	border-bottom:1px solid #a0a0a0;
}
/*수정삭제버튼*/
.upDel{
	width:800px;
	margin-bottom:15px;
	padding:0 0 10px 0 ;
	font-size:15;
}
.upDel a{
	padding:10px;
}
/*목록버튼*/
#listBtn a{
	font-size: 22px;
    font-weight: 500;
    
}
#listBtn{
	float:right;
	margin:30px 0 20px 0;
}
</style>
<jsp:include page="../header.jsp" />

<section id="event_content">
<div class="container">
	<div class="event_row" align="center">
	<div id="erow">
			<h1>이벤트 당첨을 축하합니다!</h1>
		<div id="event">
			<div class="head_view">
				<p class="h_tit"><strong><%=ewDTO.getEvent_winner_title()%></strong></p>
				<div class="h_info">
					<ul>
						<li class="info_item"><strong>조회수</strong><span><%=ewDTO.getEvent_winner_view()%></span></li>
						<li class="info_item"><strong>작성일</strong><span><%=ewDTO.getEvent_winner_postday()%></span></li>
					</ul>
				</div>
			</div>
			<div id="contentimg">	
				<img src="../img/event/<%=ewDTO.getEvent_winner_img()%>">
			</div>
			<div id="getCon">
				<%=ewDTO.getEvent_winner_content()%>
			</div>
		</div>
			<c:if test="${userid eq 'admin'}">
				<div class="upDel">
					<a href="event_winner_update.jsp?event_winner_no=<%=event_winner_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">수정</a>
					<a onclick="return chkDel()" href="event_winner_delete.jsp?event_winner_no=<%=event_winner_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">삭제</a>
				</div>
			</c:if>
			<div id="listBtn">
				<a href="event_winner_list.jsp?pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">목록으로</a>
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