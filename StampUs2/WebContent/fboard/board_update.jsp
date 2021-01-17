<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@	page import="dto.FboardDto"%>
<%@	page import="dao.FboardDao"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	FboardDao fdao = new FboardDao();
	FboardDto fdto = fdao.content(id);
	session.setAttribute("userid", "user1");
	String userid = session.getAttribute("userid").toString();
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String word = (request.getParameter("word") == null) ? "" : request.getParameter("word");
	
%>
<jsp:include page="../header.jsp" />
<style>
	table {
	    margin: 30px auto;
    	width: 80vw;
    }
</style>
<section id="fboard_update">
	<div class="container">
		<div class="row">
			<div class="fboard_update">
				<form method="post" action="board_update_ok.jsp" enctype="multipart/form-data">
					<input type="hidden" name="id" value="<%=id%>"> 
					<input type="hidden" name="userid" value="<%=userid%>"> 
					<input type="hidden" name="pager" value="<%=pager%>">
					<input type="hidden" name="cla" value="<%=cla%>"> 
					<input type="hidden" name="word" value="<%=word%>">
					<table width="600" align="center">
						<tr>
							<td>제목</td>
							<td colspan="6"><input type="text" name="title"></td>
						</tr>
						<tr>
							<td align="center">이름</td>
							<td><%=fdto.getUserid()%></td>
							<td align="center">작성일</td>
							<td><%=fdto.getWriteday()%></td>
							<td align="center">조회수</td>
							<td><%=fdto.getReadnum()%></td>
						</tr>
					</table>
					<table width="600" align="center">
						<tr>
							<td height="400"><textarea cols="80" rows="30" name="content"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" value="수정하기"></td>
						</tr>
					</table>
				</form>

			</div>
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp" />