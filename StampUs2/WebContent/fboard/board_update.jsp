<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, uid, upw);
    
    String id = request.getParameter("id");
	String pager = request.getParameter("pager");
	String cla = request.getParameter("cla");
	String word = request.getParameter("word");
    
    String sql = "select * from fboard where id=" + id;
    
    Statement stmt = conn.createStatement();
    
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td {
	border:1px solid #cccccc
	}
</style>
</head>
<body>
<form method="post" action="board_update_ok.jsp">
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="pager" value="<%=pager%>">
<input type="hidden" name="cla" value="<%=cla%>">
<input type="hidden" name="word" value="<%=word%>">
<table width="600" align="center">
	<tr>
		<td> 제목 </td>
		<td colspan="6"><input type="text" name="title"></td>
	</tr>
	<tr>
		<td align="center"> 이름 </td>
		<td><%=rs.getString("name") %></td>
		<td align="center"> 작성일 </td>
		<td><%=rs.getString("writeday") %></td>
		<td align="center"> 조회수 </td>
		<td><%=rs.getString("readnum") %></td>	
	</tr>
	</table>
	<table width="600" align="center">
	<tr>
		<td height ="400"><textarea cols="80" rows="30" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정하기">
		</td>
	</tr>
</table>
</form>

</body>
</html>
