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
							<h1>이벤트 당첨을 축하합니다!</h1>
						</th>
					</tr>
					<tr>
						<td>글번호</td>
						<td><%=edDTO.getEvent_winner_no()%></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><%=edDTO.getEvent_winner_title()%></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<img src="../img/event/<%=edDTO.getEvent_winner_img()%>"><br>
							<%=edDTO.getEvent_winner_content()%>
						</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><%=edDTO.getEvent_winner_view()%></td>
					</tr>
					<tr>
						<td>작성일</td>
						<td><%=edDTO.getEvent_winner_postday()%></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<c:if test="${userid eq 'admin'}">
							<a href="event_winner_update.jsp?event_winner_no=<%=event_winner_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">수정</a>
							<a onclick="return chkDel()" href="event_winner_delete.jsp?event_winner_no=<%=event_winner_no%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">삭제</a>
						</c:if>
							<a href="event_winner_list.jsp?pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>">목록</a>
						</td>
					</tr>
				</table>
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