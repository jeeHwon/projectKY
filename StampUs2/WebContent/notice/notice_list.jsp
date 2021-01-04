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
<title>Insert title here</title>
<style>
table {
	width: 70%;
	border-top: 1px double #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 2px solid #444444;
	padding: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<span align="center"> <h3><a href="center.jsp">고객센터></a></h3><h1><a href="notice_list.jsp">공지사항</a></h1></span>
	<h3 align="center">stampus의 소식 및 안내사항을 확인하세요</h3>
	<table width="600" align="center">
		<tr align="center">
			<td><h4>제목</h4></td>
			<td>조회수</td>
			<td>작성날짜</td>
		</tr>
		<%
    // 출력
    for(int i=0;i<list.size();i++)
    {
 %>
		<tr>
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

<jsp:include page="../footer.jsp" />
</body>
</html>

