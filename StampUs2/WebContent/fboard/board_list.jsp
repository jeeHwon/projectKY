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
    
	request.setCharacterEncoding("utf-8");
    
    int index;
    int pager;
    if(request.getParameter("pager") == null) {
    	pager = 1;
    }
    else {
    	pager = Integer.parseInt(request.getParameter("pager"));
    }
    
    index = (pager - 1) * 10;
    
    //검색필드와 검색단어의 값을 request
    //쿼리 생성
    String sql = "";
    String addsql = "";
    String cla = "";
    String word = "";
    if(request.getParameter("cla") == null){
    	sql = "select * from (select row_number() over (order by id) num, A.* from fboard A order by id) where num between " + index + " and " + (index + 10);
    	
    } else {
    	cla = request.getParameter("cla"); //검색필드
    	word = request.getParameter("word"); //검색단어
    	if(cla.equals("name")) {
    		sql = "select * from (select * from fboard where name like '%" + word + "%' order by id desc) where id between " + index + " and " + (index + 10);
    		addsql = " where name like '%" + word + "%' ";
    	} else {
    		sql = "select * from (select * from fboard where title like '%" + word + "%' order by id desc) where id between " + index + " and " + (index + 10);
    		addsql = " where title like '%" + word + "%' ";
    	}
    }
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
<script>
	function init(){
		document.searchFrm.cla.value="<%=cla%>"
	}
</script>
</head>
<body>
<div align="center">
	<form name="searchFrm" method="post" action="board_list.jsp">
		<select name="cla">
			<option value="name">이름</option>
			<option value="title">제목</option>
		</select>
		<input type="text" name="word" value="<%=word%>">
		<input type="submit" value="검색">
	</form>
</div>

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
		<td><a href="board_readnum.jsp?id=<%=rs.getString("id")%>&pager=<%=pager%>&cla=<%=cla%>&word=<%=word%>"><%=rs.getString("title") %></a></td>
		<td align="center"><%=rs.getString("name") %></td>
		<td align="center"><%=rs.getString("readnum") %></td>
		<td align="center"><%=rs.getString("writeday") %></td>
	</tr>
<%
	}
%>
		<!-- 사용자가 클릭하여 이동할 수 있는 페이지 출력 -->
		<tr>
			<td colspan="4" align="center">
			<%
				//총 페이지 값을 구하기 => 총 레코드수/ 페이지당 레코드수
				//검색 단어가 없는 경우 or name으로 or title로 => +addsql 
				sql = "select count(*) as cnt from fboard "+addsql;
				ResultSet rs2 = stmt.executeQuery(sql);
				rs2.next();
				
				int page_cnt = (int)Math.ceil(rs2.getInt("cnt")*0.1);
				int pstart =(int)Math.ceil(pager*0.1)*10-9;
				int pend =(int)Math.ceil(pager*0.1)*10;
			
				if(page_cnt < pend){
					pend = page_cnt;
				}
			%>
			<!--10페이지 이전 페이지 이동  -->
			<%if(pstart != 1){ %>
				<a href="board_list.jsp?pager=<%=pstart-1%>&cla=<%=cla%>&word=<%=word%>">◀◀</a>
			<%} else{%>
				◀◀
			<%} %>
			
			<!-- 1페이지 이전 페이지 이동-->
			<%if(pager != 1){ %>
				<a href="board_list.jsp?pager=<%=pager-1%>&cla=<%=cla%>&word=<%=word%>">◀</a>
			<%} else{%>
				◀
			<%} %>
			
			<!-- pstart ~ pend 페이지출력 현재페이지는 색 변경 -->
			<%  
				for(int i= pstart; i<=pend; i++){
					String str = "";
					if(pager == i) str="style='color:red;'";
			%>
				<a href="board_list.jsp?pager=<%=i%>&cla=<%=cla%>&word=<%=word%>" <%=str%>><%=i %></a>
			<%} %>
			
			<!-- 1페이지 이후 페이지 이동-->
			<%if(pager != page_cnt){ %>
				<a href="board_list.jsp?pager=<%=pager+1%>&cla=<%=cla%>&word=<%=word%>">▶</a>
			<%} else{%>
				▶
			<%} %>
			
			<!--10페이지 이후 페이지 이동  -->
			<%if(pend != page_cnt){ %>
				<a href="board_list.jsp?pager=<%=pend+1%>&cla=<%=cla%>&word=<%=word%>">▶▶</a>
			<%} else{%>
				▶▶
			<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="2"><a href="board_write.jsp">글쓰기</a></td>
		</tr>		
	</table>
</body>
</html>
<%
	stmt.close();
	conn.close();
%>