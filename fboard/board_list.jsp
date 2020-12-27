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
    
    /* 
    create table fboard
	(
	id number(7),
	title varchar(20),
	name varchar(10),
	content varchar(2000),
	readnum number(8) default 0,
	writeday date);
    
	기본키 지정
    alter table fboard add constraint fboard_pk primary key (id);
	시퀀스 생성
    create sequence fboard_seq start with 1 increment by 1 maxvalue 1000000 nocycle; */
    
    int index;
    int pager;
    if(request.getParameter("pager") == null) {
    	pager = 1;
    }
    else {
    	pager = Integer.parseInt(request.getParameter("pager"));
    }
    
    index = (pager - 1) * 10;
    
    String sql = "select * from (select row_number() over (order by id) num, A.* from fboard A order by id) where num between " + index + " and " + (index + 10);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    
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
<table width="600" align="center">
	<tr align="center">
		<td> 번호 </td>
		<td> 제목 </td>
		<td> 이름 </td>
		<td> 조회수 </td>
		<td> 등록일 </td>
	</tr>
<%
	while(rs.next())
	{
%>
	<tr>
		<td align="center"><%=rs.getString("id") %></td>
		<td><a href="board_readnum.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title") %></a></td>
		<td align="center"><%=rs.getString("name") %></td>
		<td align="center"><%=rs.getString("readnum") %></td>
		<td align="center"><%=rs.getString("writeday") %></td>
	</tr>
<%
	}
%>
	<tr>
		<td colspan="4" align="center">
		<%
			// 총 페이지 값 (총 레코드수 / 페이지당 레코드수)
			sql = "select count(*) as cnt from fboard";
			ResultSet rs2 = stmt.executeQuery(sql);
			rs2.next();
			int page_cnt = rs2.getInt("cnt") / 10 + 1;
			
			if(rs2.getInt("cnt") % 10 == 0)
				page_cnt--;
			
			int pstart;
			pstart = pager / 10;
			if(pager % 10 == 0)
				pstart = pstart - 1;
			
			pstart = Integer.parseInt(pstart + "1");
			
			int pend;
			pend = pstart + 9;
			if(page_cnt < pend)
				pend = page_cnt;
		%>
		<!-- 이전 페이지 -->
		<!-- 현재 페이지 그룹 이전 10 페이지 -->
		<%
			if(pstart != 1) 
			{
		%>
			<a href="board_list.jsp?pager=<%=pstart-1 %>"> ◀◀ </a>
		<%
			}
			else
			{
		%>
			◀◀
		<%
			}
		%>
		<!-- 현재 페이지 기준 1페이지 이전 -->
		<%
			if(pager != 1)
			{
		%>
			<a href="board_list.jsp?pager=<%=pager-1 %>">◀</a>
		<%
			}
			else
			{
		%>
			◀
		<%
			}
			for(int i = pstart; i <= pend; i++)
			{
				String str = "";
				if(pager == i)
					str = "style='color:red;'";
		%>
			<a href="board_list.jsp?pager=<%=i %>"<%=str %>> <%=i %></a>
		<%
			}
		%>
		<%
			if(pager != page_cnt)
			{
		%>
			<a href="board_list.jsp?=<%=pager+1 %>">▶</a>
		<%
			}
			else
			{
		%>
			▶
		<%
			}
		%>
		<%
			if(page_cnt != pend)
			{
		%>
			<a href="board_list.jsp?=<%=pend+1 %>">▶▶</a>
		<%
			}
			else
			{
		%>
			▶▶
		<%
			}
		%>
		</td>
		<td colspan="2" align="center"><a href="board_write.jsp">글쓰기</a></td>
	</tr>
</table>
</body>
</html>
<%
	stmt.close();
	conn.close();
%>