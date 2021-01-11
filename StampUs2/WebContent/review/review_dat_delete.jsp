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

	// request값 가져오기
	String review_dat_no=request.getParameter("review_dat_no");
	String review_no=request.getParameter("review_no");
	String connectId=session.getAttribute("userid").toString();
	
	boolean del=rddao.dat_delete(review_dat_no, connectId);
	if(del==true)
		response.sendRedirect("review_content.jsp?review_no="+review_no);
	else
		response.sendRedirect("review_content.jsp?review_no="+review_no+"&chk=1");
%>	
<%
	rddao.conn_close();
%>