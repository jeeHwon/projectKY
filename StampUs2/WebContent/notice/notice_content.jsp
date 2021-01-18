<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   String userid="";
   if(session.getAttribute("userid")!=null)
   {
      userid=session.getAttribute("userid").toString();
   }  
%>    

<jsp:include page="../header.jsp" />

<section id="notice_content">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
<!-- ========================================================================= -->	
			
<style>
   td,tr {
    border:1px solid #000000;
    
   }
 td.button{font-size:15pt; border:0px;}
div.center{font-size:30pt;}
</style>			
<!-- ========================================================================= -->	
<jsp:include page="../left_nav.jsp" />
  <div align="center"  class="center">  
		<a href="notice_list.jsp">공지사항</a>
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
		<tr height="50" >
			<td>공지날짜 <%=ndto.getNotice_postday()%>
			</td>
			<td align="center">조회수<%=ndto.getNotice_view()%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"  class="button">
		<%
		if(userid.equals("admin")){
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
<!-- ========================================================================= -->	
		
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />
