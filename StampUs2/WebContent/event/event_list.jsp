<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.EventDTO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dao.PageObject" %>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<%
	session.setAttribute("user_id", "user1");
%>
<%
	String pager=request.getParameter("pager");
	if(pager==null){
		pager="1";
	}
	EventDTO eDTO = new EventDTO();
	EventDAO eDAO = new EventDAO();
    ArrayList<EventDTO> list=eDAO.pageList(pager);
%>    
<jsp:include page="../header.jsp" />
<style>
	a {
	  text-decoration:none;
	  color:black;
	}
	a:hover {
	  text-decoration:underline;
	}
</style>
<section id="event_list">
	<div class="container">
	<table class="table table-hover">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<%for(int i=0; i<list.size(); i++){ %>
	<tr>
		<td><%=list.get(i).getEvent_no()%></td>
		<td><a href="event_getView.jsp?event_no=<%=list.get(i).getEvent_no()%>"><%=list.get(i).getEvent_title()%></a></td>
		<td><%=list.get(i).getEvent_postday()%></td>
		<td><%=list.get(i).getEvent_view()%></td>
	</tr>
<% }%>
	<tr>
		<td colspan="4" align="center"><a href="event_write.jsp">글쓰기</a>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
		<%
         // 총 페이지값을 구하기  
         	int page_cnt=eDAO.getTotalPage();
       		int pstart=eDAO.getPstart(page_cnt,pager);
		 	int pend=eDAO.getPend(page_cnt,pstart); 
		%>
        <!-- 이전페이지 -->
        <!-- 현재 페이지 그룹 이전 10페이지 -->
        <%
         if(pstart != 1){//(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이냐 => pstart=1)
        %>
         <a href="event_list.jsp?pager=<%=pstart-1%>"> ◀◀ </a>
        <% 
         }else{
        %>
                             ◀◀
       <%
         }
       %>
        <!-- 현재페이지 기준 1페이지 이전 -->
       <%
         if(Integer.parseInt(pager) != 1){
       %>  
        <a href="event_list.jsp?pager=<%=Integer.parseInt(pager)-1%>">◀  </a>
       <% 
         }else {
       %>
                      ◀
       <% 
         } for(int i=pstart;i<=pend;i++){
             String str="";
        	 if(Integer.parseInt(pager) == i)
        		 str="style='color:red;'";
       %>
         <a href="event_list.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a> <!-- 페이지네이션 -->
       <%
         }
       %>
       <!-- 다음페이지 -->
       <!-- 현재페이지 기준 1페이지 이후 -->
       <%
         if(Integer.parseInt(pager) != page_cnt){
       %>
      <a href="event_list.jsp?pager=<%=Integer.parseInt(pager)+1%>"> ▶ </a>
      <%
         }else{
      %>
                       ▶
      <%
         }
      %>
      <!-- 현재페이지 기준 다음 그룹으로 이동 -->
      <%
       if(page_cnt != pend){
      %>
        <a href="event_list.jsp?pager=<%=pend+1%>"> ▶▶  </a>
      <%
       }else{
      %>
                       ▶▶
      <%
       }
      %>
		</td>
	</tr>
</table>
</div>
</section>

<jsp:include page="../footer.jsp" />