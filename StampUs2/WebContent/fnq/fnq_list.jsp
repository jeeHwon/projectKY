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
<title>자주묻는 질문과 답변</title>
<style>
table {
	width: 70%;
	border-top: 1px double #444444;
	border-collapse: collapse;
}

tr {
	
	padding: 5px;
}
div.center{font-size:30pt;}
tr.top{
border-bottom: 7px solid #000000;
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
	<div align="center" class="center"> 
	<a href="../customer/center.jsp">고객센터></a>
	<a href="fnq_list.jsp">FQA</a>
	</div>
	<p align="center">stampus를 편리하게 이용해보세요</p>
	<div align="center">
	<table width="1500" height="800" align="center">
		<tr align="center" class="top" height="50">
			<td>유형</td>
			<td>질문</td>
			<td>자세히보기</td>
		</tr>
		<%
    // 출력
		    for(int i=0;i<list.size();i++)
		    {
 		%>
		<tr class="mid" height="50">
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
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>

