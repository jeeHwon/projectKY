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

	 // request값을 읽어오기
    String review_no=request.getParameter("review_no");
    String pager=request.getParameter("pager");
    String cla=request.getParameter("cla");
    String sword=request.getParameter("sword");
    
    // 쿼리 생성
    String sql="update review set review_view=review_view+1 where review_no="+review_no; 
    // 심부름꾼 생성 
    Statement stmt=conn.createStatement();
    // 쿼리 실행
    stmt.executeUpdate(sql); 
    // 이동
    response.sendRedirect("review_content.jsp?review_no="+review_no+"&pager="+pager+"&cla="+cla+"&sword="+sword);
%>
<%
	stmt.close();
	conn.close();
%>