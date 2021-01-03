<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>     
<%@ page import="java.sql.*" %> 
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
	
	//cos.jar 라이브러리를 통해 파일을 업로드시킨다..
	String realPath = request.getRealPath("/img");
	int size=1024*1024*10;
	String han="utf-8";
	MultipartRequest multi=new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
	
	// request값 가져오기
	request.setCharacterEncoding("utf-8");
	String review_no=multi.getParameter("review_no");
	String review_title=multi.getParameter("review_title");
	String review_content=multi.getParameter("review_content");
	String review_file=multi.getFilesystemName("review_file");   // 서버에 저장되는 이름
	String hash=String.join(",",multi.getParameterValues("hash"));
	String connectId=session.getAttribute("userid").toString();
	
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
    	//쿼리생성
    	sql="update review set review_title=?,review_content=?,review_file=?,";
    	sql=sql+"review_postday=TO_DATE(SYSDATE,'YY.MM.DD HH24:MI:SS'),hash=? where review_no=?";
    	// 심부름꾼 생성
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, review_title);
    	pstmt.setString(2, review_content);
    	pstmt.setString(3, review_file);
    	pstmt.setString(4, hash);
    	pstmt.setString(5, review_no);    	
    	// 쿼리 실행
    	pstmt.executeUpdate();
    	// 문서이동
    	response.sendRedirect("review_content.jsp?review_no="+review_no);
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