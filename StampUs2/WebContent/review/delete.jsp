<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
	//DB연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Connection conn = DriverManager.getConnection(url, uid, upw);
	
	// request값 읽어오기
    String review_no=request.getParameter("review_no");
	
    String sql="delete from review where review_no="+review_no;
    Statement stmt=conn.createStatement();
    stmt.executeUpdate(sql);
    
    // list로 이동
    response.sendRedirect("list.jsp");
%>	