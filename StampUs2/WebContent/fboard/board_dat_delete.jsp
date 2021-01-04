<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, uid, upw);
    
    request.setCharacterEncoding("utf-8");
    String dat_no = request.getParameter("dat_no");
    
    String sql = "select * from fboard_dat where dat_no="+dat_no;
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    
    sql = "delete from fboard_dat where dat_no="+ dat_no;
    
    stmt = conn.createStatement();
    stmt.executeUpdate(sql);
    response.sendRedirect("board_content.jsp?dat_no="+ rs.getString("dat_no_id"));
%>
<%
   stmt.close();
   conn.close();
%>  
    