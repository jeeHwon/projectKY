<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dto.EventDTO" %>
<%@page import="dao.Event_dat_DAO" %>
<%@page import="dto.Event_dat_DTO" %>
<%
	String event_no=request.getParameter("event_no");
    EventDAO dao=new EventDAO();
	EventDTO dto = dao.content(event_no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css">
</head>
<body>
<%@include file="header.jsp" %>
	<table width="600" align="center">
		<tr>
			<td>글번호</td>
			<td><%=dto.getEvent_no()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=dto.getEvent_title()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<img src="img/<%=dto.getEvent_img()%>"><br>
				<%=dto.getEvent_content()%>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getEvent_view()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getEvent_postday()%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="nav2_event_update.jsp?no=<%=event_no%>">수정</a>
				<a href="nav2_event_delete.jsp?no=<%=event_no%>">삭제</a>
				<a href="nav2_event_list.jsp">목록</a>
			</td>
		</tr>
	</table>
	<!---------------------------댓글 관련 작업---------------------------->
    <!-- 댓글을 입력 폼  => 작성자, 내용, 비번 -->
   <div align="center">
    <form name="dat" method="post" action="nav2_event_dat_write_ok.jsp">
   	  <input type="hidden" name="study_dat_no" id="study_dat_no">
	  <input type="hidden" name="event_no" value="<%=dto.getEvent_no() %>">
      <input type="text" name="name" size="5" placeholder="작성자" id="name">
      <input type="text" name="content" size="50" placeholder="댓글 내용" id="content">
      <input type="text" name="pwd" size="5" placeholder="비밀번호">
      <input type="submit" value="댓글달기">
    </form>
   </div>  
   <!----------------------댓글 출력---------------------->
   <div align="center">
     <table align="center" width="600">
     <!-- 레코드를 출력 -->
     <%
      Event_dat_DAO edDAO=new Event_dat_DAO();
      Event_dat_DTO edDTO=new Event_dat_DTO();
      ArrayList<Event_dat_DTO> list=edDAO.list(event_no);
      
       for(int i=1; i<list.size(); i++){   // 하나의 tr에 하나의 레코드가 출력
     %>
      <tr>
        <td width="60"> <%=list.get(i).getUser_id()%></td>  <!-- 작성자 -->
        <td> <%=list.get(i).getEvent_dat_content()%></td>  <!-- 내용  -->
        <td width="100"><%=list.get(i).getEvent_dat_day()%></td>  <!-- 작성일 -->
      </tr>
     <%
       }
     %>
     </table>
   </div>
<%@include file="footer.jsp" %>
</body>
</html>