<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page import="dao.Review_dat_DAO" %>
<%@ page import="dto.Review_dat_DTO" %>
<%
	//DB연결
	Review_dat_DAO rddao=new Review_dat_DAO();

	// request값 가져오기
    request.setCharacterEncoding("utf-8");
    String review_no=request.getParameter("review_no");
    String review_dat_no=request.getParameter("review_dat_no");
    String user_id=request.getParameter("user_id");
    String review_dat_content=request.getParameter("review_dat_content");
    String connectId=session.getAttribute("userid").toString();
    
    Review_dat_DTO rddto=new Review_dat_DTO();
    rddto.setReview_dat_no(Integer.parseInt(review_dat_no));
    rddto.setUser_id(user_id);
    rddto.setReview_dat_content(review_dat_content);
    
 	// 메소드에 전달
    boolean duok=rddao.dat_update_ok(rddto, connectId);
 	
 	if(duok==true)
 		response.sendRedirect("review_content.jsp?review_no="+review_no);
 	else
 		response.sendRedirect("review_content.jsp?review_no="+review_no+"&chk=1");	
%>
<%
	rddao.conn_close();
%>	