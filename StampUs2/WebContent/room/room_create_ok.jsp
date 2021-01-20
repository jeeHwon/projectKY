<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>

<%
	//cos.jar 라이브러리를 통해 파일을 업로드
	String savePath =  request.getRealPath("/img/room/");
	//String test2 = request.getSession().getServletContext().getRealPath("room_data");
	
	int size = 1024*1024*5;
	String enco = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, savePath, size, enco,
			new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("r_title");
	String start_day = multi.getParameter("r_start_day");
	String end_day = multi.getParameter("r_end_day");
	String category = multi.getParameter("r_cate_big");
	String category2 = multi.getParameter("r_cate_small");
	int people = Integer.parseInt(multi.getParameter("r_people"));
	String check_day = String.join(",",multi.getParameterValues("r_check_day"));
	String certi_type = String.join(",",multi.getParameterValues("r_certi_type"));
	String deposit = multi.getParameter("r_deposit");
	String penalty = multi.getParameter("r_penalty");
	String content = multi.getParameter("r_content");
	//String file_name = multi.getFilesystemName("r_img");	일단 중복 상관없이 db 저장된 파일명
	String file_name = multi.getOriginalFileName("r_img");
	String condition = multi.getParameter("r_condition");
	
	RoomDTO rdto = new RoomDTO();
	rdto.setTitle(title);
	rdto.setStart_day(start_day);
	rdto.setEnd_day(end_day);
	rdto.setCategory(category);
	rdto.setCategory2(category2);
	rdto.setPeople(people);
	rdto.setCheck_day(check_day);
	rdto.setCerti_type(certi_type);
	rdto.setDeposit(deposit);
	rdto.setPenalty(penalty);
	rdto.setContent(content);
	rdto.setFile_name(file_name);
	rdto.setCondition(condition);
	
	//방 생성하기
	RoomDAO rdao = new RoomDAO();
	int dchk=rdao.inDeposit(session.getAttribute("userid").toString(), deposit);
	
	if(dchk==0){
		rdao.insert(rdto);
	}
	else
	{
		response.sendRedirect("../room/room_list.jsp?dchk="+dchk);
	}
	
	//참여중인 방 생성하기
	String room_no = rdao.getLastRoom();
	rdto = rdao.content(room_no);
	
	Study_join_DAO sjDAO = new Study_join_DAO();
	Study_join_DTO sjDTO = new Study_join_DTO();
	
	int chk = sjDAO.getInfo(session.getAttribute("userid").toString(), room_no);
	
	if(chk==0)
	{
		dchk=sjDAO.inDeposit(session.getAttribute("userid").toString(), room_no);
		
		if(dchk==0)
		{
			int pchk = sjDAO.isMaxPeople(room_no);
			
			if(pchk==0)
			{
				sjDTO.setUser_id(session.getAttribute("userid").toString());
				sjDTO.setRoom_no(rdto.getId());
				sjDTO.setRoom_start_day(rdto.getStart_day());
				sjDTO.setRoom_end_day(rdto.getEnd_day());
				sjDTO.setRoom_deposit(rdto.getDeposit());
				sjDTO.setRoom_penalty(rdto.getPenalty());
				sjDTO.setCur_deposit(rdto.getDeposit());
			
				sjDAO.insert(sjDTO);
			
				response.sendRedirect("room_list.jsp");
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
		response.sendRedirect("room_list.jsp?chk="+chk);	
	}
	
	
	
	
%>

<%=savePath%>
