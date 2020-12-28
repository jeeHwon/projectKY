<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%
	// DB 연결
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
	// 2. 연결
	Connection conn = DriverManager.getConnection(url1, uid, upw);
	//폼에 입력된 값을 읽어와서 DB에 저장
	String fnq_no = request.getParameter("fnq_no");
	String sql = "select * from fnq where fnq_no=" + fnq_no;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 70%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<h1 align="center"><a href="fnq_list.jsp">FAQ</a></h1>
	<h3 align="center">stampus를 편리하게 이용해보세요</h3>
	<table width="800" align="center">
      <tr>
     	<td width="200">유형</td>
     	<td > <%=rs.getString("fnq_type")%> </td>	
      </tr>
     <tr colspan="2">  
       <td > 상세질문 </td>
       <td > <%=rs.getString("fnq_q")%> </td>
      </tr>
     <tr colspan="2">  
       <td > 답변 </td>
       <td > <%=rs.getString("fnq_a")%>
       <img src="img/<%=rs.getString("fnq_img")%>" width="200"></td>
      </tr>
     <tr colsapn="2">  
		<td align="center"><a href="fnq_update.jsp?fnq_no=<%=fnq_no%>">수정/</a>
		<a href="fnq_delete.jsp?fnq_no=<%=fnq_no%>">삭제/</a> 
			<a href="fnq_list.jsp"> 목록 </a></td>
	  
     </tr>
    

     </table>
   <form method="post" action="fnq_delete.jsp" id="del">
	
<%@include file="footer.jsp"%>
</body>
</html>