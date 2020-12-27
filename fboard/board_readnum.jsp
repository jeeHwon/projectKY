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
    
    //request값 가져오기
    String id = request.getParameter("id");
    
    //쿼리 생성
    String sql = "update fboard set readnum = readnum + 1 where id=" + id;
    
    //심부름꾼 생성
    Statement stmt = conn.createStatement();
    
    //쿼리 실행
    stmt.executeUpdate(sql);
    
    //이동
    response.sendRedirect("board_content.jsp?id="+id);
    
%>