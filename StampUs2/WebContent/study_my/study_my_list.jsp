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
	Study_join_DAO sjDAO = new Study_join_DAO(); 
	
	ArrayList<Study_my_DTO> list = sDAO.list(Integer.parseInt(study_no));
	
	ArrayList<GoalDTO> gList = sDAO.isCertDay(study_no);
	
	ArrayList<GoalDTO> allGList = sDAO.allGoalList(study_no);
	
	Study_join_DTO sjDTO=sjDAO.study_content(study_no);
	
	pageContext.setAttribute("gList", gList);
	pageContext.setAttribute("sjDTO", sjDTO);
	pageContext.setAttribute("allGList", allGList);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function dat_update(study_dat_no, study_dat_content)
	{
		document.getElementById('dat_title').innerText='댓글 수정';
		document.getElementById('dat_button').value='댓글 수정';
		document.getElementById('study_dat_form').action='study_dat_update_ok.jsp';
		document.getElementById('study_dat_no').value=study_dat_no;
		document.getElementById('study_dat_content').innerText=study_dat_content;
		
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />

<section id="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
			
<div class="roomInfo">
<h1>${sjDTO.room_title }</h1>
<p>${sjDTO.room_content }</p>
<p>${sjDTO.room_check_day}</p>
<p>시작일 ${sjDTO.room_start_day}</p>
<p>종료일 ${sjDTO.room_end_day}</p>

</div>

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
<div class="goalList">
<h2>오늘의 인증 현황</h2>
<table>
	<tr>
		<th>아이디</th>
		<th>인증현황</th>
	</tr>
		<c:forEach var="dto" items="${gList}">
			<tr>
				<td>${dto.user_id}</td>
				<td>${dto.isgoal}</td>
			</tr>
		</c:forEach>
	</table>
</div>
	<%
	for(int i=0;i<list.size();i++)
	{
	%>
		<div class="study_my_list">
			<h3><%=list.get(i).getStudy_title() %></h3>
			<img src="../img/<%=list.get(i).getStudy_img()%>"/>
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
			<div class="study_dat_list">
				<h3>댓글 리스트</h3>
				<table>
				<%
					Study_dat_DAO sdDAO = new Study_dat_DAO();
					ArrayList<Study_dat_DTO> datList = sdDAO.list(list.get(i).getStudy_my_no());
					
					for(int j=0;j<datList.size();j++)
					{	
				%>
				<tr>
					<td><%=datList.get(j).getUser_id() %></td>
					<td><%=datList.get(j).getStudy_dat_content() %></td>
					<td><%=datList.get(j).getStudy_dat_day() %></td>
					<td>
						<%
						if(user_id.equals(datList.get(j).getUser_id()))
						{
						%>
						<a href="javascript:dat_update(<%=datList.get(j).getStudy_dat_no()%>, '<%=datList.get(j).getStudy_dat_content() %>');">수정</a>
						<a href="study_dat_delete.jsp?study_dat_no=<%=datList.get(j).getStudy_dat_no() %>&study_no=<%=study_no%>">삭제</a>
						<%
						}
						%>
					</td>
				</tr>
				<%
					}
				%>
				</table>
			</div>
			<div class="study_dat_write">
			<h3 id="dat_title">댓글 쓰기</h3>
				<form name="study_dat_form" id="study_dat_form" method="post" action="study_dat_write_ok.jsp">
					<input type="hidden" name="study_dat_no" id="study_dat_no">
					<input type="hidden" name="study_no" value="<%=list.get(i).getStudy_no() %>">
					<input type="hidden" name="study_my_no" value="<%=list.get(i).getStudy_my_no() %>">
					<textarea name="study_dat_content" placeholder="댓글을 입력하세요" id="study_dat_content"></textarea>
				<input id="dat_button" type="submit" value="댓글 작성">
				</form>
			</div>
			
		</div>
	<%
	}
	%>
	<div><a href="study_my_write.jsp?study_no=<%=study_no%>">글쓰기</a></div>
	</div>
	</div>
	</div>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>