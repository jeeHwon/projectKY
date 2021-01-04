<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<style>
	td {
	border:1px solid #cccccc
	}
</style>
</head>
<body>
<form method="post" action="board_write_ok.jsp">
<table width="600" align="center">
	<tr>
		<td align="center"> 제목 </td>
		<td cols="30"><input type="text" name="title"></td>
		<td align="center"> 사진 첨부</td>
		<td><input type="file" name="fboard_img"></td>
	</tr>
</table>
<table width="600" align="center">
		<td height ="400"><textarea cols="80" rows="30" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="글쓰기">
		</td>
	</tr>
</table>
</form>
</body>
</html>