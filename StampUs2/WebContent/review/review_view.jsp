<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page import="dao.ReviewDAO" %>
<%
	//DB연결
	ReviewDAO rdao=new ReviewDAO();
	// request값을 읽어오기
    String review_no=request.getParameter("review_no");
    String pager=request.getParameter("pager");
    String cla=request.getParameter("cla");
    String sword=request.getParameter("sword");
    // view메소드 실행
    rdao.view(review_no);
    // 이동
    response.sendRedirect("review_content.jsp?review_no="+review_no+"&pager="+pager+"&cla="+cla+"&sword="+sword);
%>
<%
	rdao.conn_close();
%>