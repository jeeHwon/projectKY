<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@	page import="java.util.ArrayList" %>
<%@	page import="dto.FboardDto" %>
<%@	page import="dao.FboardDao" %>
<%@	page import="dto.Fboard_datDto" %>
<%@	page import="dao.Fboard_datDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	FboardDao fdao = new FboardDao();
	FboardDto fdto = fdao.content(id);
	String userid = session.getAttribute("userid").toString();
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String word = (request.getParameter("word") == null) ? "" : request.getParameter("word");
	
%>
<jsp:include page="../header.jsp" />

<style>
	.fboard_content {
		width: 1100px;
	}
	table {
		width:1100px;
		border-top: 1px double #222;
		border-collapse: collapse;
	}
    td {
		border:1px solid #cccccc;
	}
	tr {
		padding: 5px;

	}
	.top {
		font-size : 20px;
	}
	.footer {
		font-size : 20px;
	}
	.form{
		width:30%;
		padding:80px 0 15px 0;
		float:right;
		font-size:17pt;
	}
	#fboard_content .left .left_content .image_container {
		margin-top:3px;
		position: absolute;
		width: 400px;
		height: 600px;
	}
	#fboard_content .left .left_content {
		position: relative;
	}
	#fboard_content .right {
		margin-top:3px;
		position: relative;
		margin-left: 600px;
		height: 500px;
		padding: 34px;
		box-sizing: border-box;
		background: #f0f0f0;
		font-size:20px;
	}

	#fboard_content .right .select {
		overflow: hidden;
		padding-bottom: 10px;
	}
	
	#fboard_content .right .name {
		overflow: hidden;
		font-size: 16px;
		padding-bottom: 4px;
		margin-left:3px;
	}
	.dat {
		font-size : 20px;
	}
	.dat_content{
		font-size : 15px;
	}
</style>
<section id="fboard_content">
<div class="container">
<div class="fboard_content">
<table class="table">
	<tr align="center" class="top" height="45">
		<td>제목</td>
		<td colspan="5"><%=fdto.getTitle()%></td>
	</tr>
	<tr align="center" class="top" height="45">
		<td> 이름 </td>
		<td><%=fdto.getUserid()%></td>
		<td> 작성일 </td>
		<td><%=fdto.getWriteday()%></td>
		<td> 조회수 </td>
		<td><%=fdto.getReadnum() %></td>	
	</tr>
</table>
	<div class="left">
		<div class="left_content">
			<div class="image_container" id="image_container">
				<% if (!"".equals(fdto.getFboard_img())) 
				{ 
				%>
				<img src="../img/fboard_img/<%=fdto.getFboard_img() %>" style="width:600px; height:500px;">
				<% 
				} 
				%>
			</div>
		</div>
</div>
	<div class="right">
		<div class="right_content">
			<div class="text">
				<ul><%=fdto.getContent() %></ul>
			</div>	
		</div>
	</div>

<table>
	<tr align="center" class="footer" height="45">
		<td>
			<a href ="board_update.jsp?id=<%=id%>&pager=<%=pager%>&cla=<%=cla%>&word=<%=word%>">수정</a>
			<a href ="board_delete.jsp?id=<%=id%>"> 삭제</a>
			<a href ="board_list.jsp">목록보기</a>
		</td>
	</tr>
</table>

<!-- 댓글관련 함수 추가 -->

<div class="dat" align="center">
	<form id="dat" name="dat" method="post" action="board_dat_ok.jsp">
		<input type="hidden" name="dat_no_id" value="<%=id%>">
		<%=fdto.getUserid() %>
		<input type="text" name="content" size="80" placeholder="댓글내용" id="content">
		<input type="submit" value="댓글달기" id="submit">
	</form>
</div>

<!-- 댓글 출력 -->
<div align="center">
<table align="center" width="600">
<%
	
	Fboard_datDao fddao = new Fboard_datDao();
	ArrayList<Fboard_datDto> datList = fddao.dat_content(String.valueOf(id));
	
	for(int i = 0; i < datList.size(); i++){
	
%>
	<tr class="dat_content" height="45">
		<td width="100" align="center"><%=datList.get(i).getUserid() %></td>
		<td width="750"><a href="javascript:board_mod('<%=datList.get(i).getDat_no()%>','<%=id %>')" id ="btn_dat_mod_<%=datList.get(i).getDat_no()%>"><%=datList.get(i).getContent() %></a></td>
		<td width="180" align="center"><%=datList.get(i).getWriteday()%></td>
		<td width="50" align="center"><a href ="board_dat_delete.jsp?dat_no=<%=datList.get(i).getDat_no()%>&dat_no_id=<%=datList.get(i).getDat_no_id()%>"> 삭제 </a></td>
	</tr>
<%
	} 
%>
</table>
</div>
</div>
		</div>
	</div>
</section>
<script>
	IS_MOD = false;
	function board_mod(dat_no, dat_no_id) {
		if(!IS_MOD)
		{		
			var cts   = document.getElementById("btn_dat_mod_"+dat_no).innerHTML;
			var html1 = "<input id='input_dat_mod_"+dat_no+"' type='text' value='"+cts+"'><button onclick=\"mod_ok("+dat_no+","+dat_no_id+");\">수정</button>";
			document.getElementById("btn_dat_mod_"+dat_no).innerHTML = html1;
			IS_MOD = true;
		}
		
	}
	function mod_ok(dat_no, dat_no_id) {
		var mod_cts = document.getElementById("input_dat_mod_"+dat_no).value;
		location.href = "board_dat_update.jsp?dat_no="+dat_no+"&content="+mod_cts+"&dat_no_id="+dat_no_id;
	}
</script>
<jsp:include page="../footer.jsp" />
