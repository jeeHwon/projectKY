<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	/* dat table
	create table fboard_dat(
	dat_no number(9),
	name varchar(10),
	content VARCHAR(30),
	dat_no_id number(9) default 0,
	writeday date
	);
	
	alter table fboard_dat add constraint fboard_dat_pk primary key (id);
	
	create sequence fboard_dat_seq start with 1 increment by 1 maxvalue 1000000 nocycle; 
	*/
    
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, uid, upw);
	
	// request값
	request.setCharacterEncoding("utf-8");
	String dat_no = request.getParameter("dat_no");
	String dat_no_id = request.getParameter("dat_no_id");
	String name = request.getParameter("name");
	String content = request.getParameter("content");

	String sql = "insert into fboard_dat (dat_no, name, content, writeday, dat_no_id) ";
	sql += " values (fboard_dat_seq.nextval, ?, ?, sysdate, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, content);
	pstmt.setString(3, dat_no_id);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("board_content.jsp?id="+dat_no_id);
	
	pstmt.close();
	conn.close();
%>
