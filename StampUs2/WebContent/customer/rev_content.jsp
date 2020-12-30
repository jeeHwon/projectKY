<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="custom.dao.RevDao" %>
<%@ page import ="custom.dto.RevDto" %>
<%
   // request값 가져오기
   String rev_no=request.getParameter("rev_no");

   // DB_Conn 클래스에서 content()실행
   RevDao rdao=new RevDao();
   RevDto rdto=rdao.content(rev_no);
    
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
	<h1 align="center"><a href="rev_list.jsp">협력업체</a></h1>
	<h3 align="center">stampus의 업체를 확인하고 이용해보세요</h3>
	<table width="600" align="center">
      <tr>
     	<td rowspan="5">대표사진</td>
     	<td  rowspan="5" align="center"><img src="img/<%=rdto.getRev_img()%>" width="200"></td>	
      </tr>
     <tr>	
       <td> 업체명 </td>
       <td > <%=rdto.getRev_company()%> </td>
      </tr>
     <tr >  
       <td> 홈페이지주소 </td>
       <td > <%=rdto.getRev_addr()%> </td>
      </tr>
     <tr >  
       <td> 연락처 </td>
       <td > <%=rdto.getRev_tel()%></td>
      </tr>
     <tr >  
       <td> 금액 </td>
       <td ><%=rdto.getRev_pay()%> </td>
     </tr>

     <tr >  
       <td colsapn="2" align="center">
			<a href="rev_update.jsp?rev_no=<%=rdto.getRev_no()%>">수정</a> /
			<a href="rev_delete.jsp?rev_no=<%=rdto.getRev_no()%>">삭제</a> / 
			<a href="rev_list.jsp"> 목록 </a></td>
	  </td>

     </table>
   <form method="post" action="rev_delete.jsp" id="del">
	
		<%@include file="footer.jsp"%>
</body>
</html>