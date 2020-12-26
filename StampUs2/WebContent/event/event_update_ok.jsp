<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="stampUs.com.EventDAO"%>
<%@page import="stampUs.com.EventDTO"%>
<%
	//cos.jar 라이브러리를 통해 파일을 업로드
	String path="D:\\backend\\jspWK\\stampUs\\WebContent\\img";
		//슬래시나 역슬래시2개로 경로표기
	int size=1024*1024*10;
	String han="utf-8";
	MultipartRequest multi =
	new MultipartRequest(request,path,size,han,new DefaultFileRenamePolicy());
	String no = multi.getParameter("no");
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String img = multi.getFilesystemName("img"); //서버에 저장되는 이름
	//multi.getOriginalFileName("fname"); //클라이언트에 있던 원래이름
	/* File file=multi.getFile("fname");
	   long fsize=file.length(); */ //파일크기
	
	EventDTO dto = new EventDTO();
	dto.setNo(no);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setImg(img);
	
	EventDAO dao=new EventDAO();
	dao.update_ok(no); //메소드에 전달
	
	response.sendRedirect("event_content.jsp?no="+no);
%>