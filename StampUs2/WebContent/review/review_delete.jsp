<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
	// 세션변수 만들기
	session.setAttribute("userid", "channy");  // (변수명,값)
%>
<%
	//DB연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Connection conn = DriverManager.getConnection(url, uid, upw);
	
	// request값 읽어오기
	String connectId=session.getAttribute("userid").toString();
    String review_no=request.getParameter("review_no");

	// 쿼리 생성
	String sql="select user_id from review where review_no="+review_no;
    // 심부름꾼 
    Statement stmt=conn.createStatement();
    // 실행후 ResultSet
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
    
	//현재 아이디가 작성자 아이디와 같은지 확인
    if(connectId.equals(rs.getString("user_id")))
    {
    	sql="delete from review where review_no="+review_no;
        stmt=conn.createStatement();
        stmt.executeUpdate(sql);
        response.sendRedirect("review_list.jsp");
    }
    else
    {
      // 이동
      response.sendRedirect("review_content.jsp?review_no="+review_no+"&chk=1");
    }
%>	
<%
	rs.close();
	stmt.close();
	conn.close();
%>