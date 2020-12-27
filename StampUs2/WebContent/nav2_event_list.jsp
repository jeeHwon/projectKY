<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.EventDTO" %>
<%@page import="java.util.ArrayList" %>
<%
	//list 메소드를 포함한 클래스객체생성
	EventDAO dao=new EventDAO();
	ArrayList<EventDTO> list=dao.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css"> 
</head>
<body>
<%@include file="header.jsp" %>
<table width="600" align="center">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<%for(int i=0; i<list.size(); i++){ %>
	<tr>
		<td><%=list.get(i).getEvent_no()%></td>
		<td><a href="nav2_event_content.jsp?no=<%=list.get(i).getEvent_no()%>"><%=list.get(i).getEvent_title()%></a></td>
		<td><%=list.get(i).getEvent_postday()%></td>
		<td><%=list.get(i).getEvent_view()%></td>
	</tr>
<% }%>
	<tr>
		<td colspan="4" align="center"><a href="nav2_event_write.jsp">글쓰기</a></td>
	</tr>
</table>
<%@include file="footer.jsp" %>
</body>
</html>