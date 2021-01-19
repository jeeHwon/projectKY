<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>     
<%@ page import="java.sql.*" %> 
<%@ page import="dao.ReviewDAO" %>
<%@ page import="dto.ReviewDTO" %>
<%
	//DB연결
	ReviewDAO rdao=new ReviewDAO();
	
	//cos.jar 라이브러리를 통해 파일을 업로드시킨다..
	//String path="D:/WorkSpace/jsp/review_board/WebContent/assets/img/review";
	String realPath = application.getRealPath("/img/review");
	int size=1024*1024*10;
	String han="utf-8";
	MultipartRequest multi=new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());

	// request값 가져오기
	request.setCharacterEncoding("utf-8");
	String user_id=session.getAttribute("userid").toString();
	String review_title=multi.getParameter("review_title");
	String review_content=multi.getParameter("review_content");
	String review_file=multi.getFilesystemName("review_file");   // 서버에 저장되는 이름
	String hash=String.join(",",multi.getParameterValues("hash"));
	
	//request값을 setter에 넣기
	ReviewDTO rdto=new ReviewDTO();
	rdto.setUser_id(user_id);
	rdto.setReview_title(review_title);
	rdto.setReview_content(review_content);
	rdto.setReview_file(review_file);
	rdto.setHash(hash);
	
	//DAO메소드에 전달
	rdao.write_ok(rdto);
	
	// 이동
	response.sendRedirect("review_list.jsp");
%>
<%
	rdao.conn_close();
%>