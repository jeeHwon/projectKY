<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.NoticeDao" %>
<%@ page import ="dto.NoticeDto" %>
<%
	//cos.jar 라이브러리를 통해 파일을 업로드시킨다.
	String realPath = request.getRealPath("/img/notice");
	int size = 1024 * 1024 * 10;
	String han = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, realPath, size, han, new DefaultFileRenamePolicy());

	request.setCharacterEncoding("utf-8");
	String notice_title = multi.getParameter("notice_title");
	String notice_content = multi.getParameter("notice_content");
	String notice_file = multi.getFilesystemName("notice_file"); //클라이언트에 있던 원래이름

	
	NoticeDto ndto = new NoticeDto();
	ndto.setNotice_title(notice_title);
	ndto.setNotice_content(notice_content);
	ndto.setNotice_file(notice_file);
	
	NoticeDao ndao=new NoticeDao();
	ndao.insert(ndto);
	// 이동(list.jsp)
	response.sendRedirect("notice_list.jsp");
%>

