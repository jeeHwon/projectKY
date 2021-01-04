<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="dto.RoomDTO" %>
<%@page import="dao.RoomDAO" %>

<%
	//cos.jar 라이브러리를 통해 파일을 업로드
	String savePath =  request.getRealPath("room_data/");
	String test2 = request.getSession().getServletContext().getRealPath("room_data");
	
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
	
	RoomDAO rdao = new RoomDAO();
	rdao.insert(rdto);
	
	
	response.sendRedirect("room_list.jsp");
	
%>

<%=savePath%>
<%=test2%>
<%=title%>
<%=start_day %>
<%=end_day %>
<%=category %>
<%=category2 %>
<%=people %>
<%=check_day %>
<%=certi_type %>
<%=deposit %>
<%=penalty %>
<%=content %>
<%=file_name %>
<%=condition %>