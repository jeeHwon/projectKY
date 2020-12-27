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
	
	// request값
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	//쿼리 생성
	String sql = "select * from fboard where id=" +id;
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리 실행
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
	border:1px solid #cccccc;
	}
</style>
</head>
<body>
<table width="600" align="center">
	<tr align="center">
		<td align="center">제목 </td>
		<td colspan="5"><%=rs.getString("title") %></td>
	</tr>
	<tr align="center">
		<td align="center"> 이름 </td>
		<td><%=rs.getString("name") %></td>
		<td align="center"> 작성일 </td>
		<td><%=rs.getString("writeday") %></td>
		<td align="center"> 조회수 </td>
		<td><%=rs.getString("readnum") %></td>	
	</tr>
	<tr>
	<tr height ="400">
		<td align="center"> 내용 </td>
		<td colspan="5"><%=rs.getString("content") %></td>
	</tr>
	<tr>
		<td colspan="6" align="center">
		<a href ="board_update.jsp?id=<%=rs.getInt("id") %>">수정</a>
		<a href ="board_delete.jsp?id=<%=rs.getInt("id")%>"> 삭제</a>
		<a href ="board_list.jsp">목록보기</a></td>
	</tr>
</table>
<!-- 댓글관련 함수 추가 -->
<script>
	function update(datid){
		//폼태그의 action="dat_update_ok.jsp"로 변경, submit의 value를 댓글수정"
		document.getElementById("dat").action="dat_update_ok.jsp"
		document.getElementById("submit").value="댓글수정"
		document.getElementById("name").style.visibility="visible"
		document.getElementById("content").style.visibility="visible"
		document.dat.id.value=datid;
	}
	function del(datid){
		//폼태그의 action="dat_delete.jsp"로 변경, submit의 value를 댓글삭제"
		document.getElementById("dat").action="dat_delete.jsp"
		document.getElementById("submit").value="댓글삭제"
		document.getElementById("name").style.visibility="hidden"
		document.getElementById("content").style.visibility="hidden"
		document.dat.id.value=datid;
	}
</script>

<!-- 댓글 관련 작업 -->
<!-- 댓글 입력 폼 => 작성자, 내용, 비번 -->
<div align="center">
	<form id="dat" name="dat" method="post" action="board_dat_write_ok.jsp">
		<input type="hidden" name="gid" value="<%=id%>">	<!--gesipan 테이블 id -->
		<input type="hidden" name="id">	<!--dat 테이블 id -->
		<td><%=rs.getString("name") %></td>
		<input type="text" name="content" size="50" placeholder="댓글내용" id="content">
		<input type="submit" value="댓글달기" id="submit">
	</form>
</div>

<!-- 댓글 출력 -->
<%
	//DB 연결 => 위에서 이미 완료
	
	//쿼리 생성
	sql = "select * from fboard_dat where gid="+id;
	
	//심부름꾼 생성 => 위에서 이미 완료
			
	//쿼리실행 후 => ResultSet
	rs = stmt.executeQuery(sql);
%>
<div align="center">
<table align="center" width="600">
	<%
		while(rs.next()) 
		{ 
	%>
	<tr>
		<td width="60"><a href="javascript:update(<%=rs.getString("id")%>)"><%=rs.getString("name") %></a></td>
		<td><%=rs.getString("content")%></td>
		<td width="100"><a href="javascript:del(<%=rs.getString("id")%>)"><%=rs.getString("writeday") %></a></td>
	</tr>
	<%
		} 
	%>
</table>
</div>
</body>
</html>
<%
	stmt.close();
	conn.close();
%>