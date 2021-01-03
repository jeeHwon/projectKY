<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.FnqDao" %>
<%@ page import ="dto.FnqDto" %> 
<%
   // list메소드를 포함한 클래스 객체를 생성
   FnqDao fdao=new FnqDao();
   ArrayList<FnqDto> list=fdao.list();
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
	<%@include file="header.jsp"%>
	<span align="center"> <h3><a href="center.jsp">고객센터></a></h3><h1><a href="fnq_list.jsp">FQA</a></h1></span>
	<h3 align="center">stampus를 편리하게 이용해보세요</h3>
	<table width="600" align="center">
		<tr align="center">
			<td>유형</td>
			<td><h4>질문</h4></td>
			<td>자세히보기</td>
		</tr>
		<%
    // 출력
		    for(int i=0;i<list.size();i++)
		    {
 		%>
		<tr>
			<td align="center"><%=list.get(i).getFnq_type()%></td>
			<td align="center"><%=list.get(i).getFnq_title()%></td>
			<td align="center"><a href="fnq_content.jsp?fnq_no=<%=list.get(i).getFnq_no()%>">답변보기!</a></td>		</tr>
		<%
			}
		%>
		<tr>
		<%
		if(id=="admin"){
		%>
			<td colspan="3" align="center">
			<a href="fnq_write.jsp">글올리기 </a>
			</td>
		<%
		}
		%>	
		</tr>
	</table>

	<%@include file="footer.jsp"%>
</body>
</html>

