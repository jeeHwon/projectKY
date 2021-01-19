<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@	page import="dto.FboardDto" %>
<%@	page import="dao.FboardDao" %>
<%
	String realPath = request.getRealPath("/img/fboard/");
	int size = 1024 * 1024 * 10;
	String han = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
	String pager= (multi.getParameter("pager") == null) ? "1" : multi.getParameter("pager");
	String cla = (multi.getParameter("cla") == null) ? "" : multi.getParameter("cla");
 	String word = (multi.getParameter("word") == null) ? "" : multi.getParameter("word");
 	int id = Integer.parseInt(multi.getParameter("id"));
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	
	String fboard_img = (multi.getFilesystemName("fboard_img") == null) ? "" : multi.getFilesystemName("fboard_img");
	
	FboardDto fdto = new FboardDto();
	fdto.setId(id);
	fdto.setTitle(title);
	fdto.setContent(content);

	fdto.setFboard_img(fboard_img);
	
	FboardDao fdao = new FboardDao();
	
	fdao.update_ok(fdto);
	response.sendRedirect("board_list.jsp?event_no=" + id + "&pager=" + pager + "&cla=" + cla + "&word=" + word);
    
%>
