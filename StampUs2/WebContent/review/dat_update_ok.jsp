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
    request.setCharacterEncoding("utf-8");
    String review_dat_no=request.getParameter("review_dat_no");
    String user_id=request.getParameter("user_id");
    String review_dat_content=request.getParameter("review_dat_content");
    
 	// 쿼리 생성
 	String sql="select review_no from review_dat where review_dat_no="+review_dat_no;
 	Statement stmt=conn.createStatement();
 	ResultSet rs=stmt.executeQuery(sql);
    rs.next();
    
    sql="update review_dat set user_id=?,review_dat_content=?,";
    sql=sql+"review_dat_day=TO_DATE(SYSDATE,'YYYY.MM.DD') where review_dat_no=?";
	// 심부름꾼 생성
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, user_id);
    pstmt.setString(2, review_dat_content);
    pstmt.setString(3, review_dat_no);
	// 쿼리 실행
    pstmt.executeUpdate();
	
    response.sendRedirect("content.jsp?review_no="+rs.getString("review_no"));
%>
	