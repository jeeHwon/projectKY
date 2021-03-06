<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String user_id = (String)session.getAttribute("userid");
%>
<jsp:include page="../header.jsp" />
<%if(user_id.equals("admin")){ %>
<div class="container">
	<div class="row">
		<section id="event_write">
			<form method="post" action="event_write_ok.jsp" enctype="multipart/form-data">
				<table width="500" align="center">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size="50"></td>
					</tr>
					<tr>
						<td>관리자명</td>
						<td><input type="text" name="adm"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea cols="50" rows="3" name="content"></textarea></td>
					</tr>
					<tr>
						<td>사진</td>
						<td><input type="file" name="img"></td>
					</tr>
					<tr>
						<td colspan="2">
						<button>입력</button>
						<a href="event_list.jsp"><input type="button" value="뒤로가기"></a>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</div>
</div>
<%}else{ %>
	<h2>관리자만 글쓰기 가능합니다.</h2>
<%} %>
<jsp:include page="../footer.jsp" />