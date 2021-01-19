<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@	page import="dto.Fboard_datDto" %>
<%@	page import="dao.Fboard_datDao" %>
<%
	session.getAttribute("userid");
%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = session.getAttribute("userid").toString();
	String dat_no_id = request.getParameter("dat_no_id");
	String content = request.getParameter("content");

	Fboard_datDao fddao = new Fboard_datDao();
	Fboard_datDto fddto = new Fboard_datDto();
	fddto.setUserid(userid);
	fddto.setDat_no_id(Integer.parseInt(request.getParameter("dat_no_id")));
	fddto.setContent(content);
	
	fddao.dat_insert(fddto);
	response.sendRedirect("board_content.jsp?id="+dat_no_id);
	
%>
