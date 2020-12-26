<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="stampUs.com.EventDAO" %>
<%@page import="java.sql.*" %>
<%
	String no = request.getParameter("no");

	EventDAO dao=new EventDAO();
	dao.delete(no); //메소드에 전달
	
	response.sendRedirect("event_list.jsp");
%>