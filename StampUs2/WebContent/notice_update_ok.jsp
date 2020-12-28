<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%
	//cos.jar 라이브러리를 통해 파일을 업로드시킨다.
	String realPath = request.getRealPath("/img");
	int size = 1024 * 1024 * 10;
	String han = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, realPath, size, han, new DefaultFileRenamePolicy());

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
	String notice_no = multi.getParameter("notice_no");
	String notice_title = multi.getParameter("notice_title");
	String notice_content = multi.getParameter("notice_content");
	String notice_file = multi.getFilesystemName("notice_file"); //클라이언트에 있던 원래이름

	// 쿼리 생성
	String sql = "update notice set notice_title=?,notice_content=?,notice_file=?,notice_postday=sysdate where notice_no=?";
	
	// 심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, notice_title);
	pstmt.setString(2, notice_content);
	pstmt.setString(3, notice_file);
	pstmt.setString(4, notice_no);
	
	// 쿼리 실행
	pstmt.executeUpdate();
	// 이동(list.jsp)
      response.sendRedirect("notice_content.jsp?notice_no="+notice_no);
%>


