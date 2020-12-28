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
	String notice_no = request.getParameter("notice_no");
	String sql = "select * from notice where notice_no=" + notice_no;
	// 심부름꾼
	Statement stmt = conn.createStatement();
	// 쿼리 실행 => ResultSet
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="header.jsp"%>
	<h1 align="center">
		<a href="notice_list.jsp">공지사항</a>
	</h1>
	<h3 align="center">stampus의 소식 및 안내사항을 확인하세요</h3>
	<form method="post" action="notice_update_ok.jsp"
		enctype="multipart/form-data">
		<input type="hidden" name="notice_no" value="<%=notice_no%>">
		<table width="800" align="center">
			<tr>
				<td>
					<h4>제 목</h4>
				</td>
				<td><input type="text" name="notice_title" size="78"
					placeholder="제목을 입력하세요." value="<%=rs.getString("notice_title")%>">
				</td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea cols="80" rows="20" name="notice_content"
				 placeholder="내용을 입력하세요." ><%=rs.getString("notice_content")%></textarea></td>
			</tr>
			<tr>
				<td>첨부</td>
				<td><input type="file" name="notice_file"></td>
			</tr>
		
			<tr align="center">
				<td colspan="2"><input type="submit" value="수정하기"></td>
			</tr>
		</table>
	</form>

	<%@include file="footer.jsp"%>
</body>
</html>