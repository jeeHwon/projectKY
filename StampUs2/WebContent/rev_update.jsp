<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	//DB 연결
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
	// 2. 연결
	Connection conn = DriverManager.getConnection(url1, uid, upw);
	//폼에 입력된 값을 읽어와서 DB에 저장
	String rev_no = request.getParameter("rev_no");
	String sql = "select * from rev where rev_no=" + rev_no;
	// 심부름꾼
	Statement stmt = conn.createStatement();
	// 쿼리 실행 => ResultSet
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="header.jsp" %>
  <form method="post" action="rev_update_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" name="rev_no" value="<%=rev_no%>">
	<table width="800" align="center">
	<tr>
	<td>등록시 주의사항</td>
	<td><h3>신중하게 등록하셔야합니다. 금액은 굳이 안써도 됨</h3></td>
	</tr>
   <tr>
     <td>업체명</td>
     <td><input type="text" name="rev_company" size="50" value="<%=rs.getString("rev_company")%>"></td>
   </tr>
   <tr>
     <td>홈페이지주소</td>
     <td><input type="text" name="rev_addr" size="50" value="<%=rs.getString("rev_addr")%>"></td>
   </tr>
   <tr>
     <td>연락처</td>
     <td><input type="text" name="rev_tel" size="50" value="<%=rs.getString("rev_tel")%>"></td>
   </tr>
   <tr>
     <td>금액</td>
     <td><input type="text" name="rev_pay" value="<%=rs.getInt("rev_pay")%>"></td>
   </tr>
   <tr>
     <td>업체대표이미지</td>
     <td><input type="file" name="rev_img"></td>
   </tr>
   <tr align="center">
     <td colspan="2"><input type="submit" value="업체등록하기" ></td>
   </tr>
  
  </table>
 </form>
		
<%@include file="footer.jsp" %>
</body> 
</html> 