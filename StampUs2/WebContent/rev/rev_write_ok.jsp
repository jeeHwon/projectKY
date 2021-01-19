<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>      
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%@page import="java.sql.*" %>  
<%@ page import ="dao.RevDao" %>
<%@ page import ="dto.RevDto" %>
<%
//cos.jar 라이브러리를 통해 파일을 업로드시킨다.
	String realPath = request.getRealPath("/img/rev");
	int size=1024*1024*10;
	String han="utf-8";
   MultipartRequest multi=new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
  

	//폼에 입력된 값을 읽어와서 DB에 저장
   
	request.setCharacterEncoding("utf-8");
	String rev_company = multi.getParameter("rev_company");
	String rev_addr = multi.getParameter("rev_addr");
	String rev_tel = multi.getParameter("rev_tel");
	int rev_pay = Integer.parseInt(multi.getParameter("rev_pay"));
	String rev_img = multi.getFilesystemName("rev_img"); //클라이언트에 있던 원래이름

	RevDto rdto = new RevDto();
	RevDao rdao=new RevDao();
	rdto.setRev_company(rev_company);
	rdto.setRev_addr(rev_addr);
	rdto.setRev_tel(rev_tel);
	rdto.setRev_pay(rev_pay);
	rdto.setRev_img(rev_img);
	
	
	rdao.insert(rdto);
	// 이동(list.jsp)
	response.sendRedirect("rev_list.jsp");
%>