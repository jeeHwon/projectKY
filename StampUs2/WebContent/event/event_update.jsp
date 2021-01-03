<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.EventDTO" %>
<%
	int event_no=Integer.parseInt(request.getParameter("event_no"));

    EventDAO dao=new EventDAO();
	EventDTO dto = dao.content(event_no);
	session.setAttribute("user_id", "user1");
	String user_id = session.getAttribute("user_id").toString();
%>
<jsp:include page="../header.jsp" />

<section id="event_update">
	<form method="post" action="event_update_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" name="event_no" value="<%=event_no%>">
	<input type="hidden" name="user_id" value="<%=user_id%>">
	<table width="600" align="center">
		<tr>
			<td>글번호</td>
			<td><%=dto.getEvent_no() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=dto.getEvent_title()%>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<input type="file" name="img"><p>
					<img src="img/<%=dto.getEvent_img()%>"><p>
				<textarea name="content" rows="4" cols="40"><%=dto.getEvent_content()%></textarea>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getEvent_view()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getEvent_postday()%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button>수정</button>
				<a href="event_content.jsp?event_no=<%=event_no%>">뒤로</a>
			</td>
		</tr>
	</table>
</section>

<jsp:include page="../footer.jsp" />