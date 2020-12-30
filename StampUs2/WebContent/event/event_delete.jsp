<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%
	String event_no = request.getParameter("event_no");

	EventDAO dao=new EventDAO();
	dao.delete(event_no); //메소드에 전달
	
	response.sendRedirect("event_list.jsp");
%>