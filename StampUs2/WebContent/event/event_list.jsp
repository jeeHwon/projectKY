<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.EventDTO" %>
<%@page import="java.util.ArrayList" %>
<%
	session.setAttribute("user_id", "admin");
	String user_id = (String)session.getAttribute("user_id");

	request.setCharacterEncoding("utf-8");
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	EventDTO eDTO = new EventDTO();
	EventDAO eDAO = new EventDAO();
    
    //==========검색============
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String sword = (request.getParameter("sword") == null) ? "" : request.getParameter("sword");
    ArrayList<EventDTO> list=eDAO.pageList(cla,sword,pager);
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
		<div class="row">
<!-- 필드와 검색단어를 입력할 폼태그 -->
	      <form name="eventSearchFrm" action="event_list.jsp">
	         <select name="cla">
	            <option value="title">제목</option>         
	            <option value="content">내용</option>         
	         </select>
	         <input type="text" name="sword" value="<%=sword%>">      
	         <input type="submit" value="검색">      
	      </form>
			   <table>
			   <tr>
			      <td>글번호</td>
			      <td>제목</td>
			      <td>작성일</td>
			      <td>조회수</td>
			   </tr>
			<%for(int i=0; i<list.size(); i++){ %>
			   <tr>
			      <td><%=list.get(i).getEvent_no()%></td>
			      <td><a href="event_getView.jsp?event_no=<%=list.get(i).getEvent_no()%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>"><%=list.get(i).getEvent_title()%></a></td>
			      <td><%=list.get(i).getEvent_postday()%></td>
			      <td><%=list.get(i).getEvent_view()%></td>
			   </tr>
			<% }%>
			<%if(user_id.equals("admin")){ %>
			   <tr>
			      <td colspan="4" align="center"><a href="event_write.jsp">글쓰기</a>
			      </td>
			   </tr>
			<% }%>
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
			        <% if(pstart != 1){//(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이냐 => pstart=1)  %>
			         <a href="event_list.jsp?pager=<%=pstart-1%>&cla=<%=cla%>&sword=<%=sword%>"> ◀◀ </a>
			        <% }else{ %>
			                             ◀◀
			       <% }%>
			        <!-- 현재페이지 기준 1페이지 이전 -->
			       <% if(Integer.parseInt(pager) != 1){ %> 
			        <a href="event_list.jsp?pager=<%=Integer.parseInt(pager)-1%>&cla=<%=cla%>&sword=<%=sword%>">◀  </a>
			       <% }else { %>
			                      ◀
			       <% } for(int i=pstart;i<=pend;i++){
			             String str="";
			            if(Integer.parseInt(pager) == i)
			               str="style='color:red;'";  %>
			               
			         <a href="event_list.jsp?pager=<%=i%>&cla=<%=cla%>&sword=<%=sword%>" <%=str%>> <%=i%> </a> <!-- 페이지네이션 -->
			       <% }%>
			       <!-- 다음페이지 -->
			       <!-- 현재페이지 기준 1페이지 이후 -->
			       <% if(Integer.parseInt(pager) != page_cnt){%>
			      <a href="event_list.jsp?pager=<%=Integer.parseInt(pager)+1%>&cla=<%=cla%>&sword=<%=sword%>"> ▶ </a>
			      <%}else{ %>
			                       ▶   
			      <% }%>
			      <!-- 현재페이지 기준 다음 그룹으로 이동 -->
			      <%if(page_cnt != pend){%>
			        <a href="event_list.jsp?pager=<%=pend+1%>&cla=<%=cla%>&sword=<%=sword%>"> ▶▶  </a>
			      <% }else{ %>
			                       ▶▶
			      <%} %>
			      </td>
			   </tr>
			</table>
		</div>
	</div>
</section>
<script>
   function init(){
      document.eventSearchFrm.cla.value="<%=cla%>"
      if (document.eventSearchFrm.cla.value==""){
    	  document.eventSearchFrm.cla.value="title"
      }
   }
   init();
</script>
<jsp:include page="../footer.jsp" />