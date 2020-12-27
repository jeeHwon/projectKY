<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%
	session.setAttribute("user_id", "user1");

	String user_id = session.getAttribute("user_id").toString();
	String study_no = request.getParameter("study_no");

	Study_my_DAO sDAO = new Study_my_DAO();
	
	ArrayList<Study_my_DTO> list = sDAO.list(Integer.parseInt(study_no));
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="roomInfo">
<h1>방제목</h1>
<p>설명</p>
<p>요일</p>
<p>종료일</p>
<p>해시태그</p>
</div>
	<%
	for(int i=0;i<list.size();i++)
	{
	%>
		<div class="study_my_list">
			<h3><%=list.get(i).getStudy_title() %></h3>
			<img src="img/<%=list.get(i).getStudy_img()%>"/>
			<p><%=list.get(i).getStudy_content() %></p>
			<p><%=list.get(i).getStudy_day() %></p>
			<%
			if(user_id.equals(list.get(i).getUser_id()))
			{
			%>
			<p><a href="study_my_update.jsp?study_my_no=<%=list.get(i).getStudy_my_no()%>&study_no=<%=study_no%>">수정</a> 
			<a href="study_my_delete.jsp?study_my_no=<%=list.get(i).getStudy_my_no()%>&study_no=<%=study_no%>">삭제</a></p>
			<%
			}
			%>
		</div>
	<%
	}
	%>
</body>
</html>