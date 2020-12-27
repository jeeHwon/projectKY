<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%
	String study_my_no = request.getParameter("study_my_no");
	String study_no = request.getParameter("study_no");
	
	Study_my_DAO sDAO = new Study_my_DAO();
	sDAO.delete(study_my_no);
	
	response.sendRedirect("study_my_list.jsp?study_no="+study_no);
%>