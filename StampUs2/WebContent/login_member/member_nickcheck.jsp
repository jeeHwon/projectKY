<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	// DB 연결
String driver = "oracle.jdbc.driver.OracleDriver";
String url1 = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
String uid = "ky";
String upw = "1234";
Class.forName(driver);
      
Connection conn = DriverManager.getConnection(url1, uid, upw);

String nickName = request.getParameter("nickName");
String sql="select count(*) as cnt from USER_MEMBER where USER_NICK='"+nickName+"'";

Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery(sql);
rs.next();

out.print(rs.getInt("cnt")); // 1, 0
%>