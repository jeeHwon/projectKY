<%@page import="dto.RoomDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.io.*" %>  
<%@ page import="java.sql.*"%>
<%@ page import="dao.RoomDAO"%>
<%
	RoomDAO rdao = new RoomDAO();

	ServletContext context = request.getSession().getServletContext();
	String saveDir = context.getRealPath("Room_Img_File");
	String encoding = "utf-8"; //가능하면 UTF-8로 하자.
	int maxSize = 1024 * 1024 * 10;
	
	MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
	String title = multi.getParameter("title");
	String start_day = multi.getParameter("start_day");
	String end_day = multi.getParameter("end_day");
	String category = multi.getParameter("category");
	String category2 = multi.getParameter("category2");
	int people = Integer.parseInt(multi.getParameter("people"));
	String condition = multi.getParameter("condition");
	String check_day = String.join(",",multi.getParameterValues("check_day"));
	String certi_type = String.join(",",multi.getParameterValues("certi_type"));
	String file_name = multi.getFilesystemName("room_img");
	String penalty = multi.getParameter("penalty");
	String content = multi.getParameter("content");
	String deposit = multi.getParameter("deposit");

	RoomDTO rdto = new RoomDTO();
	rdto.setTitle(title);
	rdto.setStart_day(start_day);
	rdto.setEnd_day(end_day);
	rdto.setCategory(category);
	rdto.setCategory2(category2);
	rdto.setPeople(people);
	rdto.setCondition(condition);
	rdto.setCheck_day(check_day);
	rdto.setCerti_type(certi_type);
	rdto.setFile_name(file_name);
	rdto.setPenalty(penalty);
	rdto.setContent(content);
	rdto.setDeposit(deposit);
	
	rdao.insert(rdto);
	
	response.sendRedirect("index.jsp");

    
    
	//request.setCharacterEncoding("utf-8");
	//String title = request.getParameter("title");
	//String start_day = request.getParameter("start_day");
	//String end_day = request.getParameter("end_day");
	//String category = request.getParameter("category");
	//String category2 = request.getParameter("category2");
	//int people = Integer.parseInt(request.getParameter("people"));
	//String condition = request.getParameter("condition");
	//String check_day = String.join(",",request.getParameterValues("check_day"));
	//String certi_type = String.join(",",request.getParameterValues("certi_type"));
	//String file_name = request.getParameter("room_img");
	//String penalty = request.getParameter("penalty");
	//String content = request.getParameter("content");
	//String deposit = request.getParameter("deposit");
%>
