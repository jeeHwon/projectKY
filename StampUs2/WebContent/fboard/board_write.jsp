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
	    margin: 30px auto;
    	width: 80vw;
    }
</style>
<section id="fboard_write">
<div class="container">
	<div class="row">
		<div class="fboard_write">
			<form method="post" action="board_write_ok.jsp" enctype="multipart/form-data">
			<table>
				<tr>
					<td align="center">제목</td>
					<td><input type="text" name="title"></td>
					<td>사진 첨부</td>
					<td><input type="file" name="fboard_img"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center"><textarea cols="80" rows="30" name="content"></textarea></td>
				</tr>
				<tr>
					<td align="center"><input type="submit" value="글쓰기"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>
</section>
<jsp:include page="../footer.jsp" />