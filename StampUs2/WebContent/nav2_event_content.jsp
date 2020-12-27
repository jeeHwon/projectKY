<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.EventDTO" %>
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
<link rel="stylesheet" href="index.css">
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
				<a href="nav2_event_update.jsp?no=<%=no%>">수정</a>
				<a href="nav2_event_delete.jsp?no=<%=no%>">삭제</a>
				<a href="nav2_event_list.jsp">목록</a>
			</td>
		</tr>
	</table>
	<!------------------------------------------------- 댓글 관련 작업---------------------------->
    <!-- 댓글을 입력 폼  => 작성자, 내용, 비번 -->
   <div align="center">
    <form name="dat" method="post" action="event_dat_write_ok.jsp">
   	  <input type="hidden" name="did" value="<%=no%>"> 
      <input type="text" name="name" size="5" placeholder="작성자" id="name">
      <input type="text" name="content" size="50" placeholder="댓글 내용" id="content">
      <input type="text" name="pwd" size="5" placeholder="비밀번호">
      <input type="submit" value="댓글달기">
    </form>
   </div>  
   <!-- 댓글 출력 -->
<%@include file="footer.jsp" %>
</body>
</html>