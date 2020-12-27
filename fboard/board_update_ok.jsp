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
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
  
    String sql = "update fboard set title='"+title+"', content='"+content+"' where id=" +id;
   	
    Statement stmt = conn.createStatement();
    
    stmt.executeUpdate(sql);
    
    response.sendRedirect("board_list.jsp");
    
%>
