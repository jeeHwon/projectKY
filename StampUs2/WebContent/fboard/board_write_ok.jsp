<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@	page import="pro_fboard.dto.FboardDto" %>
<%@	page import="pro_fboard.dao.FboardDao" %>
<%

	String realPath = request.getRealPath("/img");
	int size = 1024 * 1024 * 10;
	String han = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
	
	String userid = session.getAttribute("userid").toString();
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String fboard_img = multi.getFilesystemName("fboard_img");
	
	FboardDto fdto = new FboardDto();
	fdto.setUserid(userid);
	fdto.setTitle(title);
	fdto.setContent(content);
	fdto.setFboard_img(fboard_img);
	
	FboardDao fdao = new FboardDao();
	
	fdao.write_ok(fdto);

	response.sendRedirect("board_list.jsp");

%>
	
	
   
