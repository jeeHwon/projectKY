<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dto.EventDTO" %>
<%@page import="dao.Event_dat_DAO" %>
<%@page import="dto.Event_dat_DTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.setAttribute("user_id", "user1");

	String user_id = session.getAttribute("user_id").toString();
	int event_no=Integer.parseInt(request.getParameter("event_no"));
    EventDAO dao=new EventDAO();
	EventDTO edDTO = dao.content(event_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css">
<script>
function dat_update(event_dat_no, event_dat_content){
	document.getElementById('dat_title').innerText='댓글 수정';
	document.getElementById('dat_button').value='댓글 수정';
	document.getElementById('event_dat_form').action='event_dat_update_ok.jsp';
	document.getElementById('event_dat_no').value=event_dat_no;
	document.getElementById('event_dat_content').innerText=event_dat_content;	
}
</script>
</head>
<body>
<%@include file="..\\header.jsp" %>
	<table width="600" align="center">
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
				<a href="event_update.jsp?event_no=<%=event_no%>">수정</a>
				<a href="event_delete.jsp?event_no=<%=event_no%>">삭제</a>
				<a href="event_list.jsp">목록</a>
			</td>
		</tr>
	</table>
	<!---------------------------댓글 관련 작업---------------------------->
    <!-- 댓글을 입력 폼  => 작성자, 내용, 비번 -->
<%--    <div align="center">
    <form name="dat" method="post" action="nav2_event_dat_write_ok.jsp">
   	  <input type="hidden" name="study_dat_no" id="study_dat_no">
	  <input type="hidden" name="event_no" value="<%=edDTO.getEvent_no() %>">
      <input type="text" name="name" size="5" placeholder="작성자" id="name">
      <input type="text" name="content" size="50" placeholder="댓글 내용" id="content">
      <input type="text" name="pwd" size="5" placeholder="비밀번호">
      <input type="submit" value="댓글달기">
    </form>
   </div>  --%> 
	<div class="event_dat_write">
		<form name="event_dat_form" id="event_dat_form" method="post" action="event_dat_write_ok.jsp">
			<input type="hidden" name="event_dat_no" id="event_dat_no">
			<input type="hidden" name="event_no" value="<%=edDTO.getEvent_no() %>">
			<%-- <input type="hidden" name="study_my_no" value="<%=list.get(i).getEvent_my_no() %>"> --%>
			<textarea name="event_dat_content" placeholder="댓글을 입력하세요" id="event_dat_content"></textarea>
		<input id="dat_button" type="submit" value="댓글 작성">
		</form>
	</div>
   <!----------------------댓글 출력---------------------->
   <div class="event_dat_list" align="center">
		<table>
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
				<%
				if(user_id.equals(datList.get(j).getUser_id())){
				%>
				<a href="javascript:dat_update(<%=datList.get(j).getEvent_dat_no()%>, '<%=datList.get(j).getEvent_dat_content() %>');">수정</a>
				<a href="event_dat_delete.jsp?event_dat_no=<%=datList.get(j).getEvent_dat_no() %>&event_no=<%=event_no%>">삭제</a>
				<%
				}
				%>
			</td>
		</tr>
		<%
			}
		%>
		</table>
	</div>
<%@include file="..\\footer.jsp" %>
</body>
</html>