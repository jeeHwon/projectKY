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
    // DB 연결
    Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
    Connection conn=DriverManager.getConnection(url,uid,upw); // db정보,아이디,비번
   
    // limit에 들어갈 index번호 생성
    int index;  // limit에 전달할 index값
    int pager;  // 현재 나타내고자 하는 페이지 값을 저장
    if(request.getParameter("pager")==null){
    	pager=1;
    }else{
    	pager=Integer.parseInt(request.getParameter("pager"));
    }
    // index 만들기
    index=(pager-1)*10;
    // 쿼리 생성
     String sql = "select * from (select row_number() over (order by event_no desc) num, A.* from event A order by event_no desc) where num between " 
    				+ index + " and " + (index + 10);
    // 심부름꾼생성
    Statement stmt=conn.createStatement();
    // 쿼리 실행 => ResultSet
    ResultSet rs=stmt.executeQuery(sql);
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
<%while(rs.next()){ %>
	<tr>
		<td><%=rs.getInt("event_no")%></td>
		<td><a href="event_getView.jsp?event_no=<%=rs.getInt("event_no")%>"><%=rs.getString("event_title")%></a></td>
		<td><%=rs.getString("event_postday")%></td>
		<td><%=rs.getInt("event_view")%></td>
	</tr>
<% }%>
	<tr>
		<td colspan="4" align="center"><a href="event_write.jsp">글쓰기</a>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			   <%
         // 총 페이지값을 구하기     총레코드수/페이지당레코드수
         sql="select count(*) as cnt from event";
         ResultSet rs2=stmt.executeQuery(sql);
         rs2.next();
         int page_cnt=rs2.getInt("cnt")/10+1;
         
         if(rs2.getInt("cnt")%10 == 0) 
             page_cnt--;

         int pstart;
       
         pstart=pager/10; 
         if(pager%10 ==0)
        	 pstart=pstart-1;
         
         pstart=Integer.parseInt(pstart+"1");
         
         int pend=pstart+9;  // 251+9 => 260  총페이지 :254
         
         if(page_cnt < pend)
        	 pend=page_cnt;
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
         if(pager != 1){
       %>  
        <a href="event_list.jsp?pager=<%=pager-1%>">◀  </a>
       <% 
         }else {
       %>
                      ◀
       <% 
         } for(int i=pstart;i<=pend;i++){
             String str="";
        	 if(pager == i)
        		 str="style='color:red;'";
       %>
         <a href="event_list.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a> <!-- 페이지네이션 -->
       <%
         }
       %>
       <!-- 다음페이지 -->
       <!-- 현재페이지 기준 1페이지 이후 -->
       <%
         if(pager != page_cnt){
       %>
      <a href="event_list.jsp?pager=<%=pager+1%>"> ▶ </a>
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