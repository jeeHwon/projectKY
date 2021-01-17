<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@	page import="pro_fboard.dto.Fboard_datDto" %>
<%@	page import="pro_fboard.dao.Fboard_datDao" %>
<%
	session.setAttribute("userid", "user1");
    request.setCharacterEncoding("utf-8");
	String userid = session.getAttribute("userid").toString();
    int dat_no = Integer.parseInt(request.getParameter("dat_no"));
    String content = request.getParameter("content");
    String dat_no_id = request.getParameter("dat_no_id");
    
    Fboard_datDao fddao = new Fboard_datDao();
    Fboard_datDto fddto = new Fboard_datDto();
    fddto.setUserid(userid);
    fddto.setDat_no(dat_no);
    fddto.setContent(content);
    fddto.setDat_no_id(Integer.parseInt(dat_no_id));
    fddao.dat_update(fddto);
    
    response.sendRedirect("board_content.jsp?id="+dat_no_id);
    
%>

    