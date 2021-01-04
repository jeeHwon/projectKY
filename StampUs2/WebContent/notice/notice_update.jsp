<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="dao.NoticeDao" %>
<%@ page import ="dto.NoticeDto" %>
<%
   // request값 가져오기
   String notice_no=request.getParameter("notice_no");

   // DB_Conn 클래스에서 update()실행
   
   NoticeDao ndao = new NoticeDao();
   NoticeDto ndto=ndao.update(notice_no);
   pageContext.setAttribute("ndto",ndto);
   
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<h1 align="center">
		<a href="notice_list.jsp">공지사항</a>
	</h1>
	<h3 align="center">stampus의 소식 및 안내사항을 확인하세요</h3>
	<form method="post" action="notice_update_ok.jsp"
		enctype="multipart/form-data">
		<input type="hidden" name="notice_no" value="<%=notice_no%>">
		<table width="800" align="center">
			<tr>
				<td>
					<h4>제 목</h4>
				</td>
				<td><input type="text" name="notice_title" size="78"
					placeholder="제목을 입력하세요." value="<%=ndto.getNotice_title()%>">
				</td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea cols="80" rows="20" name="notice_content"
				 placeholder="내용을 입력하세요." ><%=ndto.getNotice_content()%></textarea></td>
			</tr>
			<tr>
				<td>첨부</td>
				<td><input type="file" name="notice_file" value="<%=ndto.getNotice_file()%>"></td>
			</tr>
		
			<tr align="center">
				<td colspan="2"><input type="submit" value="수정하기"></td>
			</tr>
		</table>
	</form>

<jsp:include page="../footer.jsp" />
</body>
</html>