<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>  
<%@page import="java.sql.*"%>
<%
	//String path = "C:/KYproject/data/img";
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@20.194.41.83:1521:xe";
	String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
	      
	Connection conn = DriverManager.getConnection(url1, uid, upw);
	
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String start_day = request.getParameter("start_day");
	String end_day = request.getParameter("end_day");
	String category = request.getParameter("category");
	String people = request.getParameter("people");
	String condition = request.getParameter("condition");
	String deposit = request.getParameter("deposit");
	//String penalty = request.getParameter("penalty");	column 추가 생성필요
	//String content = request.getParameter("content"); datatype 수정 필요
	String check_day = String.join(",",request.getParameterValues("check_day"));
	//String certi_type = String.join(",",request.getParameterValues("certi_type")); column 추가 생성필요
	
	String sql = "insert into STUDY(STUDY_NO, STUDY_TITLE, STUDY_START, STUDY_END ,HASH ,STUDY_PEOPLE, ";
	sql = sql + " STUDY_LIMIT, STUDY_MONEY, DAILY_CHECK, STUDY_POSTDAY) ";
	sql = sql + " values(STUDY_seq.nextval,?,?,?,?,?,?,?,?,sysdate)";
	
	//String sql = "insert into STUDY(STUDY_NO, STUDY_TITLE, DAILY_CHECK, STUDY_POSTDAY) ";
	//sql = sql + " values(STUDY_seq.nextval, ?, ?, sysdate)";
	
	//PreparedStatement pstmt = conn.prepareStatement(sql);
	//pstmt.setString(1, title);
	//pstmt.setString(2, check_day);
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, start_day);
	pstmt.setString(3, end_day);
	pstmt.setString(4, category);
	pstmt.setString(5, people);
	pstmt.setString(6, condition);
	pstmt.setString(7, deposit);
	pstmt.setString(8, check_day);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("index.jsp");
%>
