<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//DB 연결
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
	// 2. 연결
	Connection conn = DriverManager.getConnection(url1, uid, upw);
	//폼에 입력된 값을 읽어와서 DB에 저장

	// request는 필요없음 //db에 데이타를 요청할때

	// 쿼리생성
	String sql = "select * from notice";
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
	<span align="center"> <h3><a href="center.jsp">고객센터></a></h3><h1><a href="notice_list.jsp">공지사항</a></h1></span>
	<h3 align="center">stampus의 소식 및 안내사항을 확인하세요</h3>
	<table width="600" align="center">
		<tr align="center">
			<td><h4>제목</h4></td>
			<td>조회수</td>
			<td>작성날짜</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td align="center"><a href="notice_view.jsp?notice_no=<%=rs.getInt("notice_no")%>"><%=rs.getString("notice_title")%></a></td>
			<td align="center"><%=rs.getInt("notice_view")%></td>
			<td align="center"><%=rs.getString("notice_postday")%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="3" align="center"><a href="notice_write.jsp">
					글쓰기 </a></td>
		</tr>
	</table>

	<%@include file="footer.jsp"%>
</body>
</html>
<%
	stmt.close();
	conn.close();
%>
