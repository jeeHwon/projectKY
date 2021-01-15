<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	// DB 연결
String driver = "oracle.jdbc.driver.OracleDriver";
String url1 = "jdbc:oracle:thin:@222.232.45.48:1521:xe";
String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
String uid = "ky";
String upw = "1234";
Class.forName(driver);
      
Connection conn = DriverManager.getConnection(url1, uid, upw);

String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");
String sql="select count(USER_PW) as cnt from USER_MEMBER where USER_ID='"+userid+"' and USER_PW='"+pwd+"'";

Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery(sql);
rs.next();

out.print(rs.getInt("cnt")); // 1, 0
%>