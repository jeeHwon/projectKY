<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>      
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%@page import="java.sql.*" %>  
<%
//cos.jar 라이브러리를 통해 파일을 업로드시킨다.
	String realPath = request.getRealPath("/img");
	int size=1024*1024*10;
	String han="utf-8";
   MultipartRequest multi=new MultipartRequest(request,realPath,size,han,new DefaultFileRenamePolicy());
  
	// DB 연결
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
	// 2. 연결
	Connection conn = DriverManager.getConnection(url1, uid, upw);
	//폼에 입력된 값을 읽어와서 DB에 저장
   
	request.setCharacterEncoding("utf-8");
	String fnq_no = multi.getParameter("fnq_no");
	String fnq_type = multi.getParameter("fnq_type");
	String fnq_title = multi.getParameter("fnq_title");	
	String fnq_q = multi.getParameter("fnq_q");
	String fnq_a = multi.getParameter("fnq_a");
	String fnq_img = multi.getFilesystemName("fnq_img"); //클라이언트에 있던 원래이름

	// 쿼리 생성
	String sql = "insert into fnq(fnq_no,fnq_type,fnq_title,fnq_q,fnq_a,fnq_img)";
	sql = sql + " values(fnq_seq.nextval,?,?,?,?,?)";

	// 심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, fnq_type);
	pstmt.setString(2, fnq_title);
	pstmt.setString(3, fnq_q);
	pstmt.setString(4, fnq_a);
	pstmt.setString(5, fnq_img);
	// 쿼리 실행
	pstmt.executeUpdate();
	// 이동(list.jsp)
	response.sendRedirect("fnq_list.jsp");
%>