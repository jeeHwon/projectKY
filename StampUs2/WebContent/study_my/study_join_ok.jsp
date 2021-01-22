<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<% 
	if(session.getAttribute("userid")==null)
	{
		response.sendRedirect("../login/log.jsp");
	}
	else
	{
	
		String room_no = request.getParameter("room_no");
	
		RoomDAO rdao = new RoomDAO();
		RoomDTO rdto = rdao.content(room_no);
		
		Study_join_DAO sjDAO = new Study_join_DAO();
		Study_join_DTO sjDTO = new Study_join_DTO();
		
		int chk=sjDAO.getInfo(session.getAttribute("userid").toString(), room_no);
		
		if(chk==0)
		{
		
			int dchk=sjDAO.inDeposit(session.getAttribute("userid").toString(), room_no);
			
			if(dchk==0){
				
				int pchk = sjDAO.isMaxPeople(room_no);
				if(pchk==0){
					sjDTO.setUser_id(session.getAttribute("userid").toString());
					sjDTO.setRoom_no(rdto.getId());
					sjDTO.setRoom_end_day(rdto.getEnd_day());
					sjDTO.setRoom_deposit(rdto.getDeposit());
					sjDTO.setRoom_penalty(rdto.getPenalty());
					sjDTO.setCur_deposit(rdto.getDeposit());
					
					sjDAO.insert(sjDTO);
					response.sendRedirect("study_join_list.jsp");
				}
				else
				{
					response.sendRedirect("../room/room_list.jsp?pchk="+pchk);
				}
			}
			else
			{
				response.sendRedirect("../room/room_list.jsp?dchk="+dchk);
			}
		}
		else
		{
			response.sendRedirect("../room/room_list.jsp?chk="+chk);	
		}
	}
%>
