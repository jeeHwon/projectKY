<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@	page import="dto.Fboard_datDto" %>
<%@	page import="dao.Fboard_datDao" %>
<%
	/* dat table
	create table fboard_dat(
	dat_no number(9),
	name varchar(10),
	content VARCHAR(30),
	dat_no_id number(9),
	writeday date
	);
	
	alter table fboard_dat add constraint fboard_dat_pk primary key (id);
	
	create sequence fboard_dat_seq start with 1 increment by 1 maxvalue 1000000 nocycle; 
	*/
    
	request.setCharacterEncoding("utf-8");
	String userid = session.getAttribute("userid").toString();
	String dat_no_id = request.getParameter("dat_no_id");
	String content = request.getParameter("content");

	Fboard_datDao fddao = new Fboard_datDao();
	Fboard_datDto fddto = new Fboard_datDto();
	fddto.setUserid(userid);
	fddto.setDat_no_id(Integer.parseInt(request.getParameter("dat_no_id")));
	fddto.setContent(content);
	
	fddao.dat_insert(fddto);
	response.sendRedirect("board_content.jsp?id="+dat_no_id);
	
%>
