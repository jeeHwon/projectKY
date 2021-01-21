<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dto.EventDTO" %>
<%@page import="dao.Event_dat_DAO" %>
<%@page import="dto.Event_dat_DTO" %>
<% 
	int event_no=Integer.parseInt(request.getParameter("event_no"));
    EventDAO dao=new EventDAO();
	EventDTO edDTO = dao.content(event_no);
	String userid = (String)session.getAttribute("userid")==null ? "" : (String)session.getAttribute("userid"); 
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String sword = (request.getParameter("sword") == null) ? "" : request.getParameter("sword");
%>
<style>
#erow{
	width:1000px;
	height:1280px;
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

	margin-bottom:15px;
}
/*댓글폼*/
.event_dat{
	font-size:13;
	height:300px;
	width:400px;	
}

.dat_frm{
	width:1000px;
	border-bottom:1px solid black;
	padding-bottom:15px;
	padding-top:10px;
}

#event_dat_content{
	width:500px; 
	height:80px;
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
	padding-bottom:90px;
	border-bottom:1px solid #a0a0a0;
}
/*수정삭제버튼*/
.upDel{
	width:800px;
	margin-bottom:15px;
	border-bottom:1px solid #a0a0a0;
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
		<h1>이벤트에 지금 참여하세요!</h1>
			<div id="event">
				<div class="head_view">
					<p class="h_tit"><strong><%=edDTO.getEvent_title()%></strong></p>
					<div class="h_info">
						<ul>
							<li class="info_item"><strong>조회수</strong><span><%=edDTO.getEvent_view()%></span></li>
							<li class="info_item"><strong>작성일</strong><span><%=edDTO.getEvent_postday()%></span></li>
						</ul>
					</div>
				</div>
				<div><img src="../img/event/<%=edDTO.getEvent_img()%>"></div>
				<div id="getCon"><%=edDTO.getEvent_content()%></div>
			</div>
				<c:if test="${userid eq 'admin'}">
					<div class="upDel">
						<a href="event_update.jsp?event_no=<%=event_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">수정</a>
						<a onclick="return chkDel()" href="event_delete.jsp?event_no=<%=event_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">삭제</a>
					</div>
				</c:if>
			<!---------------------------댓글 관련 작업---------------------------->
		    <!-- 댓글을 입력 폼  => 작성자, 내용, 비번 -->
				<div class="event_dat_write" id="event_dat_write">
					<div class="dat_frm">
						<form name="event_dat_form" id="event_dat_form" method="post" action="event_dat_write_ok.jsp">
							<input type="hidden" name="event_dat_no" id="event_dat_no">
							<input type="hidden" name="event_no" value="<%=edDTO.getEvent_no() %>">
							<textarea name="event_dat_content" placeholder="댓글을 입력하세요" id="event_dat_content"></textarea>
						<input id="dat_button" type="submit" value="댓글 작성">
						</form>
					</div>
					<div id="listBtn">
						<a href="event_list.jsp?pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">목록으로</a>
					</div>
				</div>
		   <!----------------------댓글 출력---------------------->
		  		<div class="event_dat_list" align="center">
					<table class="event_dat">
					<%
						Event_dat_DAO edDAO = new Event_dat_DAO();
						ArrayList<Event_dat_DTO> datList = edDAO.list(event_no);
						
						for(int j=0;j<datList.size();j++){	
					%>
					<tr>
						<td><%=datList.get(j).getUser_id() %></td>
						<td><%=datList.get(j).getEvent_dat_content() %></td>
						<td><%=datList.get(j).getEvent_dat_day() %></td>
						<td>
							<% if(userid.equals(datList.get(j).getUser_id())){ %>
								<a href="javascript:dat_update(<%=datList.get(j).getEvent_dat_no()%>, '<%=datList.get(j).getEvent_dat_content() %>');">수정</a>
								<a onclick="chkDel()" href="event_dat_delete.jsp?event_dat_no=<%=datList.get(j).getEvent_dat_no() %>&event_no=<%=event_no%>">삭제</a>
							<% } %>
						</td>
					</tr>
					<% } %>
					</table>
				</div>
				</div>	
			</div>
		</div>
</section>
<script>
function dat_update(event_dat_no, event_dat_content){
	document.getElementById('dat_button').value='댓글 수정';
	document.getElementById('event_dat_form').action='event_dat_update_ok.jsp';
	document.getElementById('event_dat_no').value=event_dat_no;
	document.getElementById('event_dat_content').innerText=event_dat_content;	
}

function chkDel(){
	if(!confirm("삭제하시겠습니까?")){
		return false;
	}
}
</script>
<jsp:include page="../footer.jsp" />