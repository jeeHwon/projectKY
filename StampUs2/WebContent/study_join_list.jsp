<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Study_join_DTO" %>
<%@ page import="dao.Study_join_DAO" %>
<%@ page import="java.util.*" %>
<%
session.setAttribute("user_id", "user1");

 Study_join_DAO sjDAO=new Study_join_DAO();
 
ArrayList<Study_join_DTO> list = sjDAO.study_join_list(session.getAttribute("user_id").toString());


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>현재 참여 중인 방 정보</h1>
<div>
<table>
	<%
	for(int i=0;i<list.size();i++)
	{
	%>
	<tr>
		<td><a href="study_my_write.jsp?study_no=<%=list.get(i).getStudy_no()%>"><%=list.get(i).getStudy_title() %></a></td>
		<td><%=list.get(i).getStudy_end() %></td>
	</tr>
	<%
	}
	%>
</table>
</div>
</body>
</html>