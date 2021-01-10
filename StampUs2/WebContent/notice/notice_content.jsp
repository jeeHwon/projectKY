<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.NoticeDao" %>
<%@ page import ="dto.NoticeDto" %>
<%
   // request값 가져오기
   String notice_no=request.getParameter("notice_no");

   // DB_Conn 클래스에서 content()실행
   NoticeDao ndao=new NoticeDao();
   NoticeDto ndto=ndao.content(notice_no);
   String id=(String)session.getAttribute("id");   
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<style>
   td,tr {
    border:1px solid #000000;
    
   }
 td.button{font-size:15pt; border:0px;}
div.center{font-size:30pt;}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
  <div align="center"  class="center">  
		<a href="../customer/center.jsp">고객센터></a>
		<a href="rev_list.jsp">협력업체</a>
  </div>
  <div align="center">
	<table width="1000" height="600" align="center">
		<tr>
			<td height="50" colspan="2"><%=ndto.getNotice_title()%></td>

		</tr>
		<tr>
			<td><pre><%=ndto.getNotice_content()%></pre></td>
			<td align="center"><img
				src="img/<%=ndto.getNotice_file()%>" width="400"></td>
		</tr>
		<tr>
			<td>공지날짜 <%=ndto.getNotice_postday()%>
			</td>
			<td align="center">조회수<%=ndto.getNotice_view()%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"  class="button">
		<%
		if(id=="admin"){
		%>
			<a href="notice_update.jsp?notice_no=<%=ndto.getNotice_no()%>">수정</a> 
			<a href="notice_delete.jsp?notice_no=<%=ndto.getNotice_no()%>">삭제</a> 
		<%
		}
		%>
			<a href="notice_list.jsp"> 목록 </a></td>
		</tr>
	</table>
	</div>
	<form method="post" action="notice_delete.jsp" id="del">
	      <input type="hidden" name="notice_no" value="<%=ndto.getNotice_no()%>">
	
<jsp:include page="../footer.jsp" />
</body>
</html>