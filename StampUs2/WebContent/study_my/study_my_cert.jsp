<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@include file="study_my_header.jsp" %>
<%

sDAO = new Study_my_DAO();

ArrayList<GoalDTO> allGList = sDAO.allGoalList(study_no);
pageContext.setAttribute("allGList", allGList);

%>    
<div id="study_list">
		<div class="study_my_list">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
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
			</div>
		</div>
</div>
<%@include file="study_my_footer.jsp" %>
