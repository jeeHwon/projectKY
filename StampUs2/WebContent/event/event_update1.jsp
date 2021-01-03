<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.EventDTO" %>
<%
	String event_no=request.getParameter("event_no");

    EventDAO dao=new EventDAO();
	EventDTO dto = dao.content(event_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css">
</head>
<body>
<form method="post" action="event_update_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=event_no%>">
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
</form>
</body>
</html>