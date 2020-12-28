<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%
	String no = request.getParameter("no");

	EventDAO dao=new EventDAO();
	dao.delete(no); //메소드에 전달
	
	response.sendRedirect("nav2_event_list.jsp");
%>