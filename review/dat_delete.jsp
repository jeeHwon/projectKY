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
	// request값 가져오기
	String review_dat_no=request.getParameter("review_dat_no");
	
	// 쿼리 생성
	String sql="select review_no from review_dat where review_dat_no="+review_dat_no;
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
    rs.next();
	
	sql="delete from review_dat where review_dat_no="+review_dat_no;
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	
	response.sendRedirect("content.jsp?review_no="+rs.getString("review_no"));
%>	