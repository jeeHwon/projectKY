<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.Event_dat_DAO" %>
<%
	String event_no = request.getParameter("event_no");
	String event_dat_no = request.getParameter("event_dat_no");
	Event_dat_DAO edDAO = new Event_dat_DAO();
	edDAO.delete(event_dat_no);
	
	response.sendRedirect("event_content.jsp?event_no="+event_no);
%>