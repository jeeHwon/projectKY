<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Study_join_DTO" %>
<%@ page import="dao.Study_join_DAO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

session.setAttribute("userid", "user2");

Study_join_DAO sjDAO=new Study_join_DAO();
 
ArrayList<Study_join_DTO> list = sjDAO.study_join_list(session.getAttribute("userid").toString());

pageContext.setAttribute("list", list);

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
<c:forEach var="dto" items="${list}">
	<a href="study_my_list.jsp?study_no=${dto.room_no}">${dto.room_title}</a>
	<br>
</c:forEach>
</table>
</div>
</body>
</html>