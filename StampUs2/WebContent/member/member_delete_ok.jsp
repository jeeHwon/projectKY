<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dto.MemberDTO"%>
<%
	/* String userid = session.getAttribute("userid").toString(); */
MemberDAO dao = new MemberDAO();
/* MemberDTO dto = dao.userInfo(userid);
 */
dao.delete("hong1234");

response.sendRedirect("../index.jsp");
%>