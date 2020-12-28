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
	String notice_no = request.getParameter("notice_no");
	String sql = "select * from notice where notice_no=" + notice_no;
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
   td,tr {
    border:1px solid #cccccc;
    
   }
 
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<h1 align="center"><a href="notice_list.jsp">공지사항</a></h1>
	<h3 align="center">stampus의 소식 및 안내사항을 확인하세요</h3>
	<table width="600" align="center">
		<tr>
			<td width="550" colspan="2"><%=rs.getString("notice_title")%></td>

		</tr>
		<tr>
			<td><pre><%=rs.getString("notice_content")%></pre></td>
			<td align="center"><img
				src="img/<%=rs.getString("notice_file")%>" width="400"></td>
		</tr>
		<tr>
			<td>공지날짜 <%=rs.getString("notice_postday")%>
			</td>
			<td align="center">조회수 <%=rs.getInt("notice_view")%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<a href="notice_update.jsp?notice_no=<%=notice_no%>">수정</a> 
			<a href="notice_delete.jsp?notice_no=<%=notice_no%>">삭제</a> 
			<a href="notice_list.jsp"> 목록 </a></td>
		</tr>
	</table>
	<form method="post" action="notice_delete.jsp" id="del">
	      <input type="hidden" name="notice_no" value="<%=notice_no%>">
	
		<%@include file="footer.jsp"%>
</body>
</html>