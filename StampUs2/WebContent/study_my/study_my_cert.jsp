<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
String user_id = session.getAttribute("userid").toString();
String study_no = request.getParameter("study_no");

Study_my_DAO sDAO = new Study_my_DAO();

ArrayList<GoalDTO> allGList = sDAO.allGoalList(study_no);
pageContext.setAttribute("allGList", allGList);

%>    
<div class="allGoalList">
<h2>전체 인증 현황</h2>
	<table>
		<tr>
			<th>아이디</th>
			<th>인증현황</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="dto" items="${allGList}">
			<tr>
				<td>${dto.user_id}</td>
				<td>${dto.isgoal}</td>
				<td>${dto.goal_day }</td>
			</tr>
		</c:forEach>
	</table>
</div>