<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//DB 연결
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
	// 2. 연결
	Connection conn = DriverManager.getConnection(url1, uid, upw);
	//폼에 입력된 값을 읽어와서 DB에 저장

    // request값을 읽어오기
    String notice_no=request.getParameter("notice_no");
    
    // 쿼리 생성
    String sql="update notice set notice_view=notice_view+1 where notice_no="+notice_no; 
    // 심부름꾼 생성 
    Statement stmt=conn.createStatement();
    // 쿼리 실행
    stmt.executeUpdate(sql); 
    // 이동
    response.sendRedirect("notice_content.jsp?notice_no="+notice_no);

%>





