<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="custom.dao.NoticeDao" %>
<%@ page import ="custom.dto.NoticeDto" %>
<%
   // request값 가져오기
   String notice_no=request.getParameter("notice_no");

   // DB_Conn 클래스에서 content()실행
   NoticeDao ndao=new NoticeDao();
   NoticeDto ndto=ndao.content(notice_no);
    
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   td,tr {
    border:1px solid #cccccc;
    
   }
 
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<h1 align="center"><a href="notice_list.jsp">공지사항</a></h1>
	<h3 align="center">stampus의 소식 및 안내사항을 확인하세요</h3>
	<table width="600" align="center">
		<tr>
			<td width="550" colspan="2"><%=ndto.getNotice_title()%></td>

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
			<td colspan="2" align="center">
			<a href="notice_update.jsp?notice_no=<%=ndto.getNotice_no()%>">수정</a> 
			<a href="notice_delete.jsp?notice_no=<%=ndto.getNotice_no()%>">삭제</a> 
			<a href="notice_list.jsp"> 목록 </a></td>
		</tr>
	</table>
	<form method="post" action="notice_delete.jsp" id="del">
	      <input type="hidden" name="notice_no" value="<%=ndto.getNotice_no()%>">
	
		<%@include file="footer.jsp"%>
</body>
</html>