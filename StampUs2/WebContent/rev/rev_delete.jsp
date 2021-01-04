<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.RevDao" %>
<%@ page import ="dto.RevDto" %>
<%
   // request값 가져오기
   String rev_no=request.getParameter("rev_no");

   // DB_Conn 클래스에서 update()실행
   
   RevDao rdao = new RevDao();
   rdao.delete(rev_no);
   
// 이동
   response.sendRedirect("rev_list.jsp");
   %>