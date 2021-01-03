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

	// request값 가져오기
    request.setCharacterEncoding("utf-8");
    String review_dat_no=request.getParameter("review_dat_no");
    String user_id=request.getParameter("user_id");
    String review_dat_content=request.getParameter("review_dat_content");
    String connectId=session.getAttribute("userid").toString();
    
 	// 쿼리 생성
 	String sql="select review_no,user_id from review_dat where review_dat_no="+review_dat_no;
 	Statement stmt=conn.createStatement();
 	ResultSet rs=stmt.executeQuery(sql);
    rs.next();
    
	//현재 아이디가 작성자 아이디와 같은지 확인
    if(connectId.equals(rs.getString("user_id")))
    {
    	sql="update review_dat set user_id=?,review_dat_content=?,";
        sql=sql+"review_dat_day=TO_DATE(SYSDATE,'YY.MM.DD HH24:MI:SS') where review_dat_no=?";
    	// 심부름꾼 생성
        PreparedStatement pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, user_id);
        pstmt.setString(2, review_dat_content);
        pstmt.setString(3, review_dat_no);
    	// 쿼리 실행
        pstmt.executeUpdate();
    }
	
    response.sendRedirect("review_content.jsp?review_no="+rs.getString("review_no"));
%>
<%
	rs.close();
	stmt.close();
	conn.close();
%>	