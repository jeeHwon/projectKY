<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page import="dao.Review_dat_DAO" %>
<%@ page import="dto.Review_dat_DTO" %>
<%
	// 세션변수 만들기
	session.setAttribute("userid", "test");  // (변수명,값)
%>
<%
	//DB연결
	Review_dat_DAO rddao=new Review_dat_DAO();
	
	// request값
	request.setCharacterEncoding("utf-8");
	String review_no=request.getParameter("review_no");
	String user_id=request.getParameter("user_id");
	String review_dat_content=request.getParameter("review_dat_content");
	
	//request값을 setter에 넣기
	Review_dat_DTO rddto=new Review_dat_DTO();
	rddto.setReview_dat_content(review_dat_content);
	rddto.setUser_id(user_id);
	rddto.setReview_no(Integer.parseInt(review_no));
	
	//DAO메소드에 전달
	rddao.dat_write_ok(rddto);
	
	// 실행 후 이동
	response.sendRedirect("review_content.jsp?review_no="+review_no); //저장후에 content로 이동 
%>
<%
	rddao.conn_close();
%>