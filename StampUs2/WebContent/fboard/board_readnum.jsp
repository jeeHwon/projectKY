<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.DB" %>
<%  
    DB db = new DB();
    
    //request값 가져오기
    String id = request.getParameter("id");
    
    //쿼리 생성
    String sql = "update fboard set readnum = readnum + 1 where id=" + id;
    
    //심부름꾼 생성
    db.stmt = db.conn.createStatement();
    
    //쿼리 실행
    db.stmt.executeUpdate(sql);
    
    //이동
    response.sendRedirect("board_content.jsp?id="+id);
    
%>