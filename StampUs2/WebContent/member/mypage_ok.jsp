<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dao.MemberDAO" %>
<%@page import="dto.MemberDTO" %>
<%
MemberDAO dao  = new MemberDAO();

request.setCharacterEncoding("utf-8");
String userid = request.getParameter("userid");
String nickName = request.getParameter("nickName");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String sex = request.getParameter("sex");
String phoneNum = request.getParameter("phoneNum");
String email = request.getParameter("email");
String interest = String.join(",",request.getParameterValues("interest"));

MemberDTO dto = new MemberDTO();
dto.setUserid(userid);
dto.setNickName(nickName);
dto.setPwd(pwd);
dto.setName(name);
dto.setAge(age);
dto.setSex(sex);
dto.setPhoneNum(phoneNum);
dto.setEmail(email);
dto.setInterest(interest);

dao.update(dto);

response.sendRedirect("mypage.jsp");
%>
