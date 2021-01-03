<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
	// 세션변수 만들기
	session.setAttribute("userid", "channy");  // (변수명,값)
%>
<%
	//DB연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Connection conn = DriverManager.getConnection(url, uid, upw);
	
	// request값
	request.setCharacterEncoding("utf-8");
	String review_no=request.getParameter("review_no");
	String user_id=request.getParameter("user_id");
	String review_dat_content=request.getParameter("review_dat_content");
	// 쿼리 완성
	String sql="insert into review_dat(review_dat_no,user_id,review_dat_content,";
	sql=sql+"review_dat_day,review_no) "; 
	sql=sql+" values(review_dat_seq.nextval,?,?,TO_DATE(SYSDATE,'YY.MM.DD HH24:MI:SS'),?)";
	// 심부름꾼 생성
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, user_id);
	pstmt.setString(2, review_dat_content);
	pstmt.setString(3, review_no);
	// 쿼리 실행
	pstmt.executeUpdate();
	
	// 실행 후 이동
	response.sendRedirect("review_content.jsp?review_no="+review_no); //저장후에 content로 이동 
%>
<%
	conn.close();
%>