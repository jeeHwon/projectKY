<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dto.MemberDTO"%>
<%
String userid = session.getAttribute("userid").toString();
MemberDAO dao = new MemberDAO();

dao.delete(userid);

session.removeAttribute("userid");
response.sendRedirect("../index.jsp");
%>