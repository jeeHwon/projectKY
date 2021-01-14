<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>     
<%@ page import="java.sql.*" %> 
<%@ page import="dao.ReviewDAO" %>
<%@ page import="dto.ReviewDTO" %>
<%
	// 세션변수 만들기
	session.setAttribute("userid", "test");  // (변수명,값)
%>
<%
	//DB연결
	ReviewDAO rdao=new ReviewDAO();
	//cos.jar 라이브러리를 통해 파일을 업로드시킨다..
	String realPath = application.getRealPath("/assets/img/review");
	int size=1024*1024*10;
	String han="utf-8";
	MultipartRequest multi=new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
	
	// request값 가져오기
	request.setCharacterEncoding("utf-8");
	String review_no=multi.getParameter("review_no");
	String review_title=multi.getParameter("review_title");
	String review_content=multi.getParameter("review_content");
	String review_file=multi.getFilesystemName("review_file");   // 서버에 저장되는 이름
	String hash=String.join(",",multi.getParameterValues("hash"));
	String connectId=session.getAttribute("userid").toString();
	
	ReviewDTO rdto=new ReviewDTO();
	rdto.setReview_no(Integer.parseInt(review_no));
	rdto.setReview_title(review_title);
	rdto.setReview_content(review_content);
	rdto.setReview_file(review_file);
	rdto.setHash(hash);
	
	//update_ok 메소드
	boolean uok=rdao.update_ok(connectId, rdto);
	if(uok==true)
		response.sendRedirect("review_content.jsp?review_no="+review_no);
	else
		response.sendRedirect("review_content.jsp?review_no="+review_no+"&chk=1");
%>	
<%
	rdao.conn_close();
%>