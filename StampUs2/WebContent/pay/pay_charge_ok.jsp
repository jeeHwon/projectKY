<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO" %>
<%@ page import="dto.MemberDTO" %>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String total_bill = request.getParameter("total_bill");
	
	MemberDAO mdao = new MemberDAO();
	mdao.pay_charge(userid, total_bill);
	
	//response.sendRedirect("pay_charge_fin.jsp");
	
%>
