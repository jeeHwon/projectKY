<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.FnqDao" %>
<%@ page import ="dto.FnqDto" %> 
<%
   // request값 가져오기
   String fnq_no=request.getParameter("fnq_no");

   // DB_Conn 클래스에서 content()실행
   FnqDao fdao=new FnqDao();
   FnqDto fdto=fdao.content(fnq_no);
   String id=(String)session.getAttribute("id");  
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 70%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<h1 align="center"><a href="fnq_list.jsp">FAQ</a></h1>
	<h3 align="center">stampus를 편리하게 이용해보세요</h3>
	<table width="800" align="center">
      <tr>
     	<td width="200">유형</td>
     	<td ><%=fdto.getFnq_type()%> </td>	
      </tr>
     <tr colspan="2">  
       <td > 상세질문 </td>
       <td ><%=fdto.getFnq_q()%> </td>
      </tr>
     <tr colspan="2">  
       <td > 답변 </td>
       <td > <%=fdto.getFnq_a()%>
       <img src="img/<%=fdto.getFnq_img()%>" width="200"></td>
      </tr>
     <tr colsapn="2">  
		<td align="center">
		<%
		if(id=="admin"){

		%>
		<a href="fnq_update.jsp?fnq_no=<%=fdto.getFnq_no()%>">수정/</a>
		<a href="fnq_delete.jsp?fnq_no=<%=fdto.getFnq_no()%>">삭제/</a> 
		<%
		}
		%>
		<a href="fnq_list.jsp"> 목록 </a></td>
	  
     </tr>
    

     </table>
   <form method="post" action="fnq_delete.jsp" id="del">
	
<%@include file="footer.jsp"%>
</body>
</html>