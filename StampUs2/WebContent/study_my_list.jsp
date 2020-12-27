<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%
	session.setAttribute("user_id", "user2");

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
</body>
</html>