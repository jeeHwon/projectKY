<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.RevDao" %>
<%@ page import ="dto.RevDto" %>
<%
   // request값 가져오기
   String rev_no=request.getParameter("rev_no");

   // DB_Conn 클래스에서 content()실행
   RevDao rdao=new RevDao();
   RevDto rdto=rdao.content(rev_no);
   String userid="";
   if(session.getAttribute("userid")!=null)
   {
	   userid=session.getAttribute("userid").toString();
   }  
%>   
<jsp:include page="../header.jsp" />

<section id="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
<!-- ========================================================================= -->	
			
<style>
table {
	width: 70%;
	border-top: 1px solid #000000;
	border-collapse: collapse;
}

th, td {
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
	padding: 10px;
}
td.button{font-size:15pt;}
div.center{font-size:30pt;}
</style>	
<!-- ========================================================================= -->	
<jsp:include page="../left_nav.jsp" />
<title>협력업체<%=rdto.getRev_company()%></title>	
	<div align="center"  class="center">  
	<a href="rev_list.jsp">협력업체</a>
	</div>
	<div align="center">
	<table width="400" height="600" align="center">
      <tr width="150" >
     	<td colsapn="2" rowspan="5" align="center"><img src="img/<%=rdto.getRev_img()%>" width="200"></td>	
      </tr>
     <tr >	
       <td width="100" > 업체명 </td>
       <td width="200" > <%=rdto.getRev_company()%> </td>
      </tr>
     <tr >  
       <td> 홈페이지주소 </td>
       <td > <a href="<%=rdto.getRev_addr()%>" target="_blank"><%=rdto.getRev_addr()%></a> </td>
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
       <td colsapn="2" align="center" class="button">
       <%
		if(userid.equals("admin")){
		%>
			<a href="rev_update.jsp?rev_no=<%=rdto.getRev_no()%>">수정</a> /
			<a href="rev_delete.jsp?rev_no=<%=rdto.getRev_no()%>">삭제</a> / 
		<%
		}
		%>
			<a href="rev_list.jsp"> 목록 </a></td>
	  </td>
<!-- ========================================================================= -->	

     </table>
     </div>			
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />
 

