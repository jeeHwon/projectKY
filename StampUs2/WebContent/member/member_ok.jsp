<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url1 = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
String uid = "ky";
String upw = "1234";
Class.forName(driver);
      
Connection conn = DriverManager.getConnection(url1, uid, upw);

request.setCharacterEncoding("utf-8");
String userid = request.getParameter("userid");
String nickName = request.getParameter("nickName");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String sex = request.getParameter("sex");
String phoneNum = request.getParameter("phoneNum");
String email = request.getParameter("email");
String interest = String.join(",",request.getParameterValues("interest"));

String sql = "insert into USER_MEMBER(USER_NO,USER_ID,USER_NICK,USER_PW,USER_NAME,AGE,GENDER,TEL,EMAIL,USER_INTEREST) ";
sql = sql + " values(USER_MEMBER_seq.nextval,?,?,?,?,?,?,?,?,?)";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userid);
pstmt.setString(2,nickName);
pstmt.setString(3, pwd);
pstmt.setString(4, name);
pstmt.setString(5, age);
pstmt.setString(6, sex);
pstmt.setString(7, phoneNum);
pstmt.setString(8, email);
pstmt.setString(9, interest);

pstmt.executeUpdate();

response.sendRedirect("../index2.jsp");
%>
