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
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>


<style>
	table {
	    margin: 30px auto;
    	width: 60vw;
    }
    td {
		border:1px solid #cccccc;
	}
</style>
<section id="fboard_content">
	<div class="container">
		<div class="row">
			<div class="fboard_content">
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th align="center">제목 </td>
			<td colspan="5"><%=fdto.getTitle()%></td>
	</tr>
	<tr align="center">
		<td align="center"> 이름 </td>
		<td><%=fdto.getUserid()%></td>
		<td align="center"> 작성일 </td>
		<td><%=fdto.getWriteday()%></td>
		<td align="center"> 조회수 </td>
		<td><%=fdto.getReadnum() %></td>	
	</tr>
	<tr>
	<tr height ="400">
		<td align="center"> 내용 </td>
		<% if (!"".equals(fdto.getFboard_img())) { %>
		<td colspan="5" id="content_photo"><img src=<%=fdto.getFboard_img() %> style="width:300px; height:300px;">
		<% } %>
		<br><%=fdto.getContent() %></td>
	</tr>
	<tr>
		<td colspan="6" align="center">
		<a href ="board_update.jsp?id=<%=id%>&pager=<%=pager%>&cla=<%=cla%>&word=<%=word%>">수정</a>
		<a href ="board_delete.jsp?id=<%=id%>"> 삭제</a>
		<a href ="board_list.jsp">목록보기</a></td>
	</tr>
</table>

<!-- 댓글관련 함수 추가 -->

<div align="center">
	<form id="dat" name="dat" method="post" action="board_dat_ok.jsp">
		<input type="hidden" name="dat_no_id" value="<%=id%>">
		<%=fdto.getUserid() %>
		<input type="text" name="content" size="50" placeholder="댓글내용" id="content">
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
	<tr>
		<td width="60"><%=datList.get(i).getUserid() %></td>
		<td><a href="javascript:board_mod('<%=datList.get(i).getDat_no()%>','<%=id %>')" id ="btn_dat_mod_<%=datList.get(i).getDat_no()%>"><%=datList.get(i).getContent() %></a></td>
		<td><a href ="board_dat_delete.jsp?dat_no=<%=datList.get(i).getDat_no()%>&dat_no_id=<%=datList.get(i).getDat_no_id()%>"> X </a></td>
		<td width="100"><%=datList.get(i).getWriteday()%></td>
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
		console.log(dat_no, dat_no_id);
		if(!IS_MOD)
		{
			
			var cts   = document.getElementById("btn_dat_mod_"+dat_no).innerHTML;
			var html1 = "<input id='input_dat_mod_"+dat_no+"' type='text' value='"+cts+"'><button onclick=\"mod_ok("+dat_no+","+dat_no_id+");\">수정</button>";
			document.getElementById("btn_dat_mod_"+dat_no).innerHTML = html1;
			
			console.log(html1);
			
			IS_MOD = true;
		}
		
	}
	function mod_ok(dat_no, dat_no_id) {
		var mod_cts = document.getElementById("input_dat_mod_"+dat_no).value;
		
		console.log(mod_cts);
		
		location.href = "board_dat_update.jsp?dat_no="+dat_no+"&content="+mod_cts+"&dat_no_id="+dat_no_id;
	}
</script>
<jsp:include page="../footer.jsp" />
