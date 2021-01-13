<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.Event_dat_DAO" %>
<%@page import="dto.Event_dat_DTO" %>
<% 
	session.setAttribute("user_id", "admin");
	request.setCharacterEncoding("utf-8");
	String event_no = request.getParameter("event_no");
	String event_dat_no = request.getParameter("event_dat_no");
	String user_id = session.getAttribute("user_id").toString();
	String event_dat_content = request.getParameter("event_dat_content");
	
	Event_dat_DAO edDAO = new Event_dat_DAO();
	Event_dat_DTO edDTO = new Event_dat_DTO();
	edDTO.setEvent_no(Integer.parseInt(event_no));
	edDTO.setEvent_dat_no(Integer.parseInt(event_dat_no));
	edDTO.setUser_id(user_id);
	edDTO.setEvent_dat_content(event_dat_content);
	edDAO.update(edDTO);
	
	response.sendRedirect("event_content.jsp?event_no="+event_no);
%>