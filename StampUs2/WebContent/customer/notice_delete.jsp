<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import ="custom.dao.NoticeDao" %>
<%@ page import ="custom.dto.NoticeDto" %>
<%
   // request값 가져오기
   String notice_no=request.getParameter("notice_no");

   // DB_Conn 클래스에서 update()실행
   
   NoticeDao ndao = new NoticeDao();
   ndao.delete(notice_no);
   
// 이동
   response.sendRedirect("notice_list.jsp");
   %>