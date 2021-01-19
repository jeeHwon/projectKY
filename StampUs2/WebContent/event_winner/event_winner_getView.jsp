<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db.DB" %>
<%  
	//조회수올리는 코드를 따로 만들어서 중간에 추가해주면 새로고침해도 조회수 안올라감
	//db연결
    DB db = new DB();
	
	//request값 불러오기
	int event_no=Integer.parseInt(request.getParameter("event_no"));
    String pager=request.getParameter("pager");
    String cla=request.getParameter("cla");
    String sword=request.getParameter("sword");
	//쿼리생성
	String sql="update event set event_view=event_view+1 where event_no="+event_no;
	//심부름꾼
	db.stmt=db.conn.createStatement();
	//쿼리실행
	db.stmt.executeUpdate(sql);
	//이동
	response.sendRedirect("event_content.jsp?event_no="+event_no+"&pager="+pager+"&cla="+cla+"&sword="+sword);
%>