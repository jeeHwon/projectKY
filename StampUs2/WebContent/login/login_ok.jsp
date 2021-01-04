<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.LoginDAO" %>
<%@ page import="dto.LoginDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	LoginDAO dao = new LoginDAO();
	
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	LoginDTO dto = new LoginDTO();
	dto.setPwd(pwd);
	dto.setUserid(userid);
	
	int result = dao.login(dto);
	if(result == 1){
		session.setAttribute("userid", userid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
	}
	else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}



%>