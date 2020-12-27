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
    
    String id = request.getParameter("id");
    String sql = "delete from fboard where id = "+ id;
    Statement stmt = conn.createStatement();
    stmt.executeUpdate(sql);
    response.sendRedirect("board_list.jsp");
%>
<%
   stmt.close();
   conn.close();
%>  
    