<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.FnqDao" %>
<%@ page import ="dto.FnqDto" %> 
<%
   // request값 가져오기
   String fnq_no=request.getParameter("fnq_no");

   // DB_Conn 클래스에서 update()실행
   
   FnqDao ndao = new FnqDao();
   ndao.delete(fnq_no);
   
// 이동
   response.sendRedirect("fnq_list.jsp");
   %>