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
	String rev_no = request.getParameter("rev_no");
	String sql = "select * from rev where rev_no=" + rev_no;
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
	<h1 align="center"><a href="rev_list.jsp">협력업체</a></h1>
	<h3 align="center">stampus의 업체를 확인하고 이용해보세요</h3>
	<table width="600" align="center">
      <tr>
     	<td rowspan="5">대표사진</td>
     	<td  rowspan="5" align="center"><img src="img/<%=rs.getString("rev_img")%>" width="200"></td>	
      </tr>
     <tr>	
       <td> 업체명 </td>
       <td > <%=rs.getString("rev_company")%> </td>
      </tr>
     <tr >  
       <td> 홈페이지주소 </td>
       <td > <%=rs.getString("rev_addr")%> </td>
      </tr>
     <tr >  
       <td> 연락처 </td>
       <td > <%=rs.getString("rev_tel")%> </td>
      </tr>
     <tr >  
       <td> 금액 </td>
       <td > <%=rs.getString("rev_pay")%> </td>
     </tr>

     <tr >  
       <td colsapn="2" align="center">
			<a href="rev_update.jsp?rev_no=<%=rev_no%>">수정</a> /
			<a href="rev_delete.jsp?rev_no=<%=rev_no%>">삭제</a> 
			<a href="rev_list.jsp"> 목록 </a></td>
	  </td>

     </table>
   <form method="post" action="rev_delete.jsp" id="del">
	
		<%@include file="footer.jsp"%>
</body>
</html>