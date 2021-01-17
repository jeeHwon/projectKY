<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%
	String realPath ="../img/study_my/";
	int size = 1024*1024*10;
	String han = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realPath, size, han, new DefaultFileRenamePolicy());
	
	String study_title = multi.getParameter("study_title");
	String study_content = multi.getParameter("study_content");
	String study_img = multi.getFilesystemName("study_img");
	String study_my_no = multi.getParameter("study_my_no");
	String study_no = multi.getParameter("study_no");
	
	Study_my_DTO sDTO = new Study_my_DTO();
	
	sDTO.setStudy_title(study_title);
	sDTO.setStudy_content(study_content);
	if(study_img!=null)sDTO.setStudy_img(study_img);
	sDTO.setStudy_my_no(Integer.parseInt(study_my_no));
	
	Study_my_DAO sDAO = new Study_my_DAO();
	
	sDAO.update(sDTO);
	
	response.sendRedirect("study_my_list.jsp?study_no="+study_no);

%>