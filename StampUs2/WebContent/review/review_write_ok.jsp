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
	
	// 폼에 입력된 값을 읽어와서 DB에 저장
	request.setCharacterEncoding("utf-8");
	String user_id=session.getAttribute("userid").toString();
	String review_title=multi.getParameter("review_title");
	String review_content=multi.getParameter("review_content");
	String review_file=multi.getFilesystemName("review_file");   // 서버에 저장되는 이름
	String hash=String.join(",",multi.getParameterValues("hash"));

	// 쿼리 생성
	String sql="insert into review(review_no,user_id,review_title,review_content,";
	sql=sql+"review_file,review_postday,hash) ";
	sql=sql+" values(review_seq.nextval,?,?,?,?,TO_DATE(SYSDATE,'YY.MM.DD HH24:MI:SS'),?)";
	
	// 심부름꾼 생성
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, user_id);
	pstmt.setString(2, review_title);
	pstmt.setString(3, review_content);
	pstmt.setString(4, review_file);
	pstmt.setString(5, hash);
	
	// 쿼리 실행
	pstmt.executeUpdate();

	// 이동
	response.sendRedirect("review_list.jsp");
%>
<%
	conn.close();
%>