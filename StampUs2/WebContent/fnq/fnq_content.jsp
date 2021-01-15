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
   String userid="";
   if(session.getAttribute("userid")!=null)
   {
      userid=session.getAttribute("userid").toString();
   }  
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">															
<title>상세답변</title>
<style>
table {
	width: 70%;
	border-top: 1px solid #000000;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #000000;
	padding: 10px;
}
td.nav{
font-family:"HMKMRHD", sans-serif;
font-size:16pt;
}
td.button{font-size:15pt;}
div.center{font-size:30pt;}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div align="center"  class="center">  
	<a href="../customer/center.jsp">고객센터></a>
	<a href="fnq_list.jsp">FQA</a>
	</div>
	<div align="center">
	<table width="800" height="800" align="center">
      <tr height="50">
     	<td width="200" class="nav">유형</td>
     	<td ><%=fdto.getFnq_type()%> </td>	
      </tr>
     <tr colspan="2">  
       <td class="nav"> 상세질문 </td>
       <td ><%=fdto.getFnq_q()%> </td>
      </tr>
     <tr colspan="2">  
       <td  class="nav"> 답변 </td>
       <td > <%=fdto.getFnq_a()%>
       <img src="img/<%=fdto.getFnq_img()%>" width="200"></td>
      </tr>
     <tr colsapn="2">  
		<td align="center" class="button">
		<%
		if(userid.equals("admin")){
		%>
		<a href="fnq_update.jsp?fnq_no=<%=fdto.getFnq_no()%>">수정/</a>
		<a href="fnq_delete.jsp?fnq_no=<%=fdto.getFnq_no()%>">삭제/</a> 
		<%
		}
		%>
		<a href="fnq_list.jsp"> 목록 </a></td>
	  
     </tr>
    

     </table>
     </div>
   <form method="post" action="fnq_delete.jsp" id="del">
	
<jsp:include page="../footer.jsp" />
</body>
</html>