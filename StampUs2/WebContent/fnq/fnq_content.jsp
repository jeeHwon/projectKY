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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp" />

<section id="fnq_content">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
<!-- ========================================================================= -->	
<style>
.fnq_content table {
	width: 70%;
	border-top: 1px solid #000000;
	border-collapse: collapse;
}

.fnq_content th,td {
	border-bottom: 1.5px solid #000000;
	padding: 10px;
}
.fnq_content td.nav{
font-family:"HMKMRHD", sans-serif;
font-size:16pt;
}
.fnq_content.td.button{font-size:15pt;}
.fnq_content.div.center{font-size:30pt;}
.button {border-bottom:0px;}
</style>
<!-- ========================================================================= -->
<jsp:include page="../left_nav.jsp" />
	<title>상세답변</title>			

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
       <img src="img/fnq/<%=fdto.getFnq_img()%>" width="200"></td>
      </tr>
     <tr colsapn="2" id="button">  
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
<!-- ========================================================================= -->	
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />