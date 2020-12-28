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

	// 쿼리생성
	String sql = "select * from rev";
	// 심부름꾼 만들기
	Statement stmt = conn.createStatement();
	// 쿼리 실행후 결과를 ResultSet으로
	ResultSet rs = stmt.executeQuery(sql);
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
	<%@include file="header.jsp"%>
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
			while (rs.next()) {
		%>
		<tr align="center">
			<td align="center"><img src="img/<%=rs.getString("rev_img")%>" width="200"></td>
			<td align="center"><%=rs.getString("rev_company")%></td>
			<td align="center"><%=rs.getString("rev_addr")%></td>
			<td align="center"><a href="rev_content.jsp?rev_no=<%=rs.getInt("rev_no")%>">click!</a></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="4" align="center"><a href="rev_write.jsp">글쓰기 </a></td>
		</tr>
	</table>

	<%@include file="footer.jsp"%>
</body>
</html>






