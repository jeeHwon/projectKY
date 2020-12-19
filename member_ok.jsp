<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String db="jdbc:mysql://localhost:3306/pkc";
String uid="root";
String pw="1234";
Connection conn=DriverManager.getConnection(db,uid,pw);

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

String sql = "insert into member(userid,nickName,pwd,name,age,sex,phoneNum,email,interest) ";
sql = sql + " values(?,?,?,?,?,?,?,?,?)";

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

response.sendRedirect("index2.jsp");
%>
