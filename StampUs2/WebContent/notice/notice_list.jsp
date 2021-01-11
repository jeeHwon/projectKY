<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.NoticeDao" %>
<%@page import="java.util.ArrayList" %>
<%@ page import ="dto.NoticeDto" %>
<%
   // list메소드를 포함한 클래스 객체를 생성
   NoticeDao ndao=new NoticeDao();
   ArrayList<NoticeDto> list=ndao.list();
   pageContext.setAttribute("list", list);
   String id=(String)session.getAttribute("id");  
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
table {
	width: 70%;
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
tr.mid{
border-bottom:1px solid #000000;
font-size:12pt;
font-family:"HMKMRHD", sans-serif;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div align="center"  class="center">  
	<a href="../customer/center.jsp">고객센터></a>
	<a href="notice_list.jsp">공지사항</a>
	</div>
	<div align="center">
	<table width="800" height="800" align="center">
		<tr align="center" class="top" height="100">
			<td><h4>제목</h4></td>
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
		if(id=="admin"){
		%>
			<td colspan="3" align="center">
			<a href="notice_write.jsp">글쓰기 </a>
			</td>
		<%
		}
		%>
		</tr>
	</table>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>

