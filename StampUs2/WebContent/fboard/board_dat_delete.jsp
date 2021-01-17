<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@	page import="pro_fboard.dao.Fboard_datDao" %>
<%

    String dat_no = request.getParameter("dat_no");
    String dat_no_id = request.getParameter("dat_no_id");
    Fboard_datDao fddao = new Fboard_datDao();
    fddao.dat_delete(dat_no);
   
    response.sendRedirect("board_content.jsp?id="+ dat_no_id);
%>
