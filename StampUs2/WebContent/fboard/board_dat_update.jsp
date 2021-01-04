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
    String content = request.getParameter("content");
    String dat_no_id = request.getParameter("dat_no_id");
   
    String sql = "update fboard_dat set content=? where dat_no=?";
    
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, content);
    pstmt.setString(2, dat_no);
    
    pstmt.executeUpdate();
    
    response.sendRedirect("board_content.jsp?id="+dat_no_id);
    
    
%>

    