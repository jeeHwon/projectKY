<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="dao.EventDAO"%>
<%@page import="dto.EventDTO"%>
<%
	//cos.jar 라이브러리를 통해 파일을 업로드
	String realPath = request.getRealPath("/img/event");
		//슬래시나 역슬래시2개로 경로표기
	int size=1024*1024*10;
	String han="utf-8";
	MultipartRequest multi =
	new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
	int event_no = Integer.parseInt(multi.getParameter("event_no"));
	String pager= (multi.getParameter("pager") == null) ? "1" : multi.getParameter("pager");
	String cla = (multi.getParameter("cla") == null) ? "" : multi.getParameter("cla");
 	String sword = (multi.getParameter("sword") == null) ? "" : multi.getParameter("sword");
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String img = multi.getFilesystemName("img"); //서버에 저장되는 이름
	//multi.getOriginalFileName("fname"); //클라이언트에 있던 원래이름
	/* File file=multi.getFile("fname");
	   long fsize=file.length(); */ //파일크기
	
	EventDTO dto = new EventDTO();
	dto.setEvent_no(event_no);
	dto.setEvent_title(title);
	dto.setEvent_content(content);
	if(img!=null) dto.setEvent_img(img);

	EventDAO dao = new EventDAO();
	dao.update_ok(dto); //메소드에 전달

	response.sendRedirect("event_content.jsp?event_no="+event_no+"&pager="+pager+"&cla="+cla+"&sword="+sword);
%>