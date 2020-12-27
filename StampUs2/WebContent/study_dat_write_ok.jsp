<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="dto.*" %>
<% 
	session.setAttribute("user_id", "user2");	


	request.setCharacterEncoding("utf-8");

	String study_my_no = request.getParameter("study_my_no");
	String study_dat_content=request.getParameter("study_dat_content");
	String user_id =session.getAttribute("user_id").toString();
	String study_no = request.getParameter("study_no");
	
	Study_dat_DAO sdDAO = new Study_dat_DAO();
	
	Study_dat_DTO sdDTO = new Study_dat_DTO();
	sdDTO.setStudy_dat_content(study_dat_content);
	sdDTO.setStudy_my_no(Integer.parseInt(study_my_no));
	sdDTO.setUser_id(user_id);
	
	sdDAO.insert(sdDTO);
	
	response.sendRedirect("study_my_list.jsp?study_no="+study_no);
%>