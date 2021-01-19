<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="dao.EventDAO"%>
<%@page import="dto.EventDTO"%>
<%	
	for(int i=0; i<500; i++){
		String adm = "관리자"+i;
		String title = "이벤트"+i;
		String content = "내용"+i;
		String img = i+"jpg";
		
		EventDTO dto = new EventDTO();
		dto.setEvent_adm(adm);
		dto.setEvent_title(title);
		dto.setEvent_content(content);
		dto.setEvent_img(img);
		
		EventDAO dao=new EventDAO();
		dao.write_ok(dto); //메소드에 전달
	}
%>