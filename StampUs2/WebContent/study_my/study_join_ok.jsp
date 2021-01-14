<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<% 
	String room_no = request.getParameter("room_no");

	RoomDAO rdao = new RoomDAO();
	RoomDTO rdto = rdao.content(room_no);
	
	Study_join_DAO sjDAO = new Study_join_DAO();
	Study_join_DTO sjDTO = new Study_join_DTO();
	
	int chk=sjDAO.getInfo(session.getAttribute("userid").toString(), room_no);
	
	if(chk==0)
	{
	
		sjDTO.setUser_id(session.getAttribute("userid").toString());
		sjDTO.setRoom_no(rdto.getId());
		sjDTO.setRoom_start_day(rdto.getStart_day());
		sjDTO.setRoom_end_day(rdto.getEnd_day());
		sjDTO.setRoom_deposit(rdto.getDeposit());
		sjDTO.setRoom_penalty(rdto.getPenalty());
	
		sjDAO.insert(sjDTO);
	
		response.sendRedirect("study_join_list.jsp");
	}
	else
	{
		response.sendRedirect("../room/room_list.jsp?chk="+chk);	
	}
%>
