<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*"%>
<%@ page import ="dao.NoticeDao" %>
<%@page import="java.util.ArrayList" %>
<%@ page import ="dto.NoticeDto" %>
<%
   // list메소드를 포함한 클래스 객체를 생성
   NoticeDao ndao=new NoticeDao();
   ArrayList<NoticeDto> list=ndao.list();
   pageContext.setAttribute("list", list);
   String userid="";
   if(session.getAttribute("userid")!=null)
   {
      userid=session.getAttribute("userid").toString();
   }  
%>  

<jsp:include page="../header.jsp" />

<section id="noice_list">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
<!-- ========================================================================= -->	
			
<style>
table {
	
	border-top: 1px double #000000;
	border-collapse: collapse;
}

th, td {
	border-bottom: 2px solid #000000;
	padding: 10px;
}
div.center{font-size:30pt;}
tr.top{
border-bottom:4px solid #000000;
font-size:17pt;
font-family:"HMKMRHD", sans-serif;
}
tr.mid{공지사항
border-bottom:1px solid #000000;
font-size:12pt;
font-family:"HMKMRHD", sans-serif;
}
</style>
<!-- ========================================================================= -->	
<jsp:include page="../left_nav.jsp" />
	<div align="center"  class="center">
	<img src="noticeimg/notice.png">
	</div>
	<div align="center">
	<table width=100% height="800" align="center">
		<tr align="center" class="top" height="100">
			<td>제목</td>
			<td>조회수</td>
			<td>작성날짜</td>
		</tr>
		<%
    // 출력
    for(int i=0;i<list.size();i++)
    {
 %>
		<tr class="mid" height="50">
			<td align="center"><a href="notice_view.jsp?notice_no=<%=list.get(i).getNotice_no()%>"><%=list.get(i).getNotice_title()%> </a></td>
			<td align="center"><%=list.get(i).getNotice_view()%></td>
			<td align="center"><%=list.get(i).getNotice_postday()%></td>
		</tr>
		<%
			}
		%>
		<tr>
		<%
		if(userid.equals("admin")){
		%>
			<td colspan="3" align="center">
			<a href="notice_write.jsp">글쓰기 </a>
			</td>
		<%} else{ %>
        <td colspan="3" align="center">
			<a href="notice_write.jsp"> </a>
			</td>
         <%} %>
		</tr>
	</table>
<!-- ========================================================================= -->	
	
</div>			
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />

