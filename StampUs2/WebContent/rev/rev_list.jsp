<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.RevDao" %>
<%@ page import ="dto.RevDto" %>
<%
   // list메소드를 포함한 클래스 객체를 생성
   RevDao rdao=new RevDao();
   ArrayList<RevDto> list=rdao.list();
   pageContext.setAttribute("list", list);
   String id=(String)session.getAttribute("id");  
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
	border: 1px solid #cccccc;
}

td {
	border-left: none;
	border-right: none;
	border-bottom: none;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<table width="1300" align="center">
		<tr align="center">
		<span align="center"> <h3><a href="center.jsp">고객센터></a></h3><h1><a href="rev_list.jsp">협력업체</a></h1></span>
			<h3 align="center">stampus의 업체를 확인하고 이용해보세요</h3>
		</tr>
		<tr align="center">
			<td><h4>대표사진</h4></td>
			<td>업체명</td>
			<td>홈페이지</td>
			<td>상세내용</td>
		</tr>
		<%
    // 출력
		    for(int i=0;i<list.size();i++)
		    {
 		%>	
		<tr align="center">
			<td align="center"><img src="img/<%=list.get(i).getRev_img()%>" width="200"></td>
			<td align="center"><%=list.get(i).getRev_company()%></td>
			<td align="center"><%=list.get(i).getRev_addr()%></td>
			<td align="center"><a href="rev_content.jsp?rev_no=<%=list.get(i).getRev_no()%>">click!</a></td>
		</tr>
		<%
			}
		%>
		<tr>
		<%
		if(id=="admin"){
		%>
			<td colspan="4" align="center">
			<a href="rev_write.jsp">글쓰기 </a>
			</td>
		<%
		}
		%>	
		</tr>
	</table>

<jsp:include page="../footer.jsp" />
</body>
</html>






