<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@	page import="pro_fboard.dao.FboardDao" %>
<%
    String id = request.getParameter("id");

	FboardDao fdao = new FboardDao();
	fdao.delete_fboard(id);
    
    response.sendRedirect("board_list.jsp");
%>
