<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="stampUs2.dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="stampUs2.dto.EventDTO" %>
<%
	String no=request.getParameter("no");

    EventDAO dao=new EventDAO();
	EventDTO dto = dao.content(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
	<table width="600" align="center">
		<tr>
			<td>글번호</td>
			<td><%=dto.getNo() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<img src="img/<%=dto.getImg()%>"><br>
				<%=dto.getContent() %>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getView() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostday()%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="event_update.jsp?no=<%=no%>">수정</a>
				<a href="event_delete.jsp?no=<%=no%>">삭제</a>
				<a href="event_list.jsp">목록</a>
			</td>
		</tr>
	</table>
<%@include file="footer.jsp" %>
</body>
</html>