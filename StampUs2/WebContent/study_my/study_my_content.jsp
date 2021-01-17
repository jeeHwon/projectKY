<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="study_list">
            <%
	for(int i=0;i<list.size();i++)
	{
	%>
		<div class="study_my_list">
			<h2><strong><%=list.get(i).getStudy_title() %></strong></h2>
			<%if(list.get(i).getStudy_img()!=null)
			{
			%>
			<img src="../img/study_my/<%=list.get(i).getStudy_img()%>"/>
			<%
			}
			%>
			<div class="content"><%=list.get(i).getStudy_content() %></div>
			<div class="writeday"><%=list.get(i).getStudy_day() %></div>
			
			<p class="left_btn" id="dat_btn">
				<a class="white" href="javascript:openDat()">댓글 쓰기</a>
			</p>
			<%
			if(user_id.equals(list.get(i).getUser_id()))
			{
			%>
			<p class="right_btn">
				<a class="white" href="study_my_update.jsp?study_my_no=<%=list.get(i).getStudy_my_no()%>&study_no=<%=study_no%>">수정</a> 
				<a class="white" href="study_my_delete.jsp?study_my_no=<%=list.get(i).getStudy_my_no()%>&study_no=<%=study_no%>">삭제</a>
			</p>
			<%
			}
			%>
			<div class="study_dat_list">
				<%
					Study_dat_DAO sdDAO = new Study_dat_DAO();
					ArrayList<Study_dat_DTO> datList = sdDAO.list(list.get(i).getStudy_my_no());
				
					if(datList.size()>0)
					{
				%>
				
				<h3>댓글 리스트</h3>
				<table>
				<%
					
						for(int j=0;j<datList.size();j++)
						{	
				%>
				<tr>
					<td width="20%"><%=datList.get(j).getUser_id() %></td>
					<td width="40%"><%=datList.get(j).getStudy_dat_content() %></td>
					<td width="20%"><%=datList.get(j).getStudy_dat_day() %></td>
					<td width="20%">
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
					}
				%>
				</table>
			</div>
			<div id="study_dat_write">
			<h3 id="dat_title">댓글 쓰기</h3>
				<form name="study_dat_form" id="study_dat_form" method="post" action="study_dat_write_ok.jsp">
					<input type="hidden" name="study_dat_no" id="study_dat_no">
					<input type="hidden" name="study_no" value="<%=list.get(i).getStudy_no() %>">
					<input type="hidden" name="study_my_no" value="<%=list.get(i).getStudy_my_no() %>">
				<div class="dat_container"><textarea name="study_dat_content" placeholder="댓글을 입력하세요" id="study_dat_content"></textarea>
				<input id="dat_button" type="submit" value="댓글 작성">
				</div>
				</form>
			</div>
			
		</div>
		
        
        
		<%
		}
		%>
				</div>
</body>
</html>