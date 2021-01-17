<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("userid", "user1");
	String userid = (String)session.getAttribute("userid");
%>
<jsp:include page="../header.jsp" />
<style>
	table {
    	display:inline;
	    margin: 30px auto;
    	width: 60vw;
    }
    td {
		border:1px solid #cccccc;
	}
</style>
<section id="fboard_write">
	<div align="center">
		<form method="post" action="board_write_ok.jsp" enctype="multipart/form-data">
			<table>
				<tr>
					<td>제목 <input type="text" name="title">
					   사진 첨부<input type="file" name="fboard_img"></td>
				</tr>
				<tr>
					<td><textarea cols="80" rows="30" name="content"></textarea></td>
				</tr>
				<tr>
					<td align="center"><input type="submit" value="글쓰기"></td>
				</tr>
			</table>
		</form>
	</div>
</section>
<jsp:include page="../footer.jsp" />