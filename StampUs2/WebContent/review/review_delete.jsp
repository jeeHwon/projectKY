<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page import="dao.ReviewDAO" %>
<%@ page import="dto.ReviewDTO" %>
<%
	// 세션변수 만들기
	session.setAttribute("userid", "test");  // (변수명,값)
%>
<%
	//DB연결
	ReviewDAO rdao=new ReviewDAO();
	// request값 읽어오기
	String connectId=session.getAttribute("userid").toString();
    String review_no=request.getParameter("review_no");
    //delete 메소드
	boolean del=rdao.delete(connectId, review_no);   
	//이동
    if(del==true)
    {
        response.sendRedirect("review_list.jsp");
    }
    else
    {
    	response.sendRedirect("review_content.jsp?review_no="+review_no+"&chk=1");
    }
%>	
<%
	rdao.conn_close();
%>