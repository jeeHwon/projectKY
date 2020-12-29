<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%
	Study_dat_DAO sdDAO = new Study_dat_DAO();

	String study_dat_no = request.getParameter("study_dat_no");
	String study_no = request.getParameter("study_no");
	
	sdDAO.delete(study_dat_no);
	
	response.sendRedirect("study_my_list.jsp?study_no="+study_no);
%>