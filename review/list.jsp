<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
	//DB연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Connection conn = DriverManager.getConnection(url, uid, upw);

    // 쿼리 생성
	String sql="select * from review order by review_no desc";
    // 심부름꾼생성
    Statement stmt=conn.createStatement();
    // 쿼리 실행 => ResultSet
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
%>	
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="index.css"> 
<title>후기 리스트</title>
</head>
<body>
    <div class="container">
    	<%@include file="header.jsp" %>
        <main>
		  <table width="800" align="center">
		    <tr>
		      <td width="10%"> 글번호 </td>
		      <td width="50%"> 제목 </td>
		      <td width="10%"> 조회수 </td>
		      <td width="30%"> 작성일 </td>   
		    </tr>
		    <%
		    while(rs.next())
		    {
		    %>
		    <tr>
		      <td> <%=rs.getString("review_no")%> </td>
		      <td> <a href="review_view.jsp?review_no=<%=rs.getInt("review_no")%>"> <%=rs.getString("review_title")%> </a> </td>
		      <td> <%=rs.getString("review_view")%> </td>
		      <td> <%=rs.getString("review_postday")%> </td>
		    </tr>
		    <%
		    }
		    %>
		    <tr>
		      <td colspan="5" align="center"> <a href="write.jsp"> 글쓰기 </a> </td>
		    </tr>
		  </table>
        </main>
        <%@include file="footer.jsp" %>
    </div>

</body>
</html>