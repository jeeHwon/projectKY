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
	String userid = session.getAttribute("userid").toString();
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String sword = (request.getParameter("sword") == null) ? "" : request.getParameter("sword");
%>
<style>
#event h1{
	border-bottom:1px solid black;
	font-size:17;
}
#event{
	font-size:17;
	height:500px;
	width:800px;
	margin:100px 0 20px 0;
	border-bottom:1px solid black;
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

</style>
<jsp:include page="../header.jsp" />

<section id="event_content">
	<div class="container">
		<div class="event_row" align="center">
			<table id="event">
				<tr>
					<th colspan="2" align="center">
						<h1>이벤트에 지금 참여하세요!</h1>
					</th>
				</tr>
				<tr>
					<td>글번호</td>
					<td><%=edDTO.getEvent_no()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%=edDTO.getEvent_title()%></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<img src="img/<%=edDTO.getEvent_img()%>"><br>
						<%=edDTO.getEvent_content()%>
					</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td><%=edDTO.getEvent_view()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=edDTO.getEvent_postday()%></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<c:if test="${userid eq 'admin'}">
						<a href="event_update.jsp?event_no=<%=event_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">수정</a>
						<a onclick="return chkDel()" href="event_delete.jsp?event_no=<%=event_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">삭제</a>
					</c:if>
						<a href="event_list.jsp?pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">목록</a>
					</td>
				</tr>
			</table>
			<!---------------------------댓글 관련 작업---------------------------->
		    <!-- 댓글을 입력 폼  => 작성자, 내용, 비번 -->
				<div class="event_dat_write" id="event_dat_write">
					<form name="event_dat_form" id="event_dat_form" method="post" action="event_dat_write_ok.jsp">
						<input type="hidden" name="event_dat_no" id="event_dat_no">
						<input type="hidden" name="event_no" value="<%=edDTO.getEvent_no() %>">
						<textarea name="event_dat_content" placeholder="댓글을 입력하세요" id="event_dat_content"></textarea>
					<input id="dat_button" type="submit" value="댓글 작성">
					</form>
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