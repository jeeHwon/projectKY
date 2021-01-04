<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%

	// DB 연결
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, uid, upw);
    
    String realPath = request.getRealPath("/img");
    int size = 1024 * 1024 * 10;
	
	//request값
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	//쿼리 생성
	String sql = "insert into fboard(id, title, name, content, writeday)";
	sql = sql + " values(fboard_seq.nextval,?, ?, ?, sysdate)";
	
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, content);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	//이동
	response.sendRedirect("board_list.jsp");
	
	pstmt.close();
	conn.close();
%>
	
	
   
