<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>      
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%@page import="java.sql.*" %> 
<%@ page import ="dao.FnqDao" %>
<%@ page import ="dto.FnqDto" %> 
<%
//cos.jar 라이브러리를 통해 파일을 업로드시킨다.
	String realPath = request.getRealPath("/img/fnq/");
	int size=1024*1024*10;
	String han="utf-8";
   MultipartRequest multi=new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
  
	
   
	request.setCharacterEncoding("utf-8");
	String fnq_no = multi.getParameter("fnq_no");
	String fnq_type = multi.getParameter("fnq_type");
	String fnq_title = multi.getParameter("fnq_title");	
	String fnq_q = multi.getParameter("fnq_q");
	String fnq_a = multi.getParameter("fnq_a");
	String fnq_img = multi.getFilesystemName("fnq_img"); //클라이언트에 있던 원래이름

	FnqDto fdto = new FnqDto();
	FnqDao fdao=new FnqDao();
	
	fdto.setFnq_type(fnq_type);
	fdto.setFnq_title(fnq_title);
	fdto.setFnq_q(fnq_q);
	fdto.setFnq_a(fnq_a);
	fdto.setFnq_img(fnq_img);
	// 쿼리 실행
	fdao.insert(fdto);
	// 이동(list.jsp)
	response.sendRedirect("fnq_list.jsp");
%>