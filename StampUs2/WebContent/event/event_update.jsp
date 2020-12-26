<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="stampUs.com.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="stampUs.com.EventDTO" %>
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
<form method="post" action="event_update_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=no%>">
	<table width="600" align="center">
		<tr>
			<td>글번호</td>
			<td><%=dto.getNo() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=dto.getTitle() %>"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<input type="file" name="img"><p>
					<img src="img/<%=dto.getImg() %>"><p>
				<textarea name="content" rows="4" cols="40"><%=dto.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getView() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostday() %></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button>수정</button>
				<a href="event_content.jsp?no=<%=no%>">뒤로</a>
			</td>
		</tr>
	</table>
<%@include file="footer.jsp" %>
</form>
</body>
</html>