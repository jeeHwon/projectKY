<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<main>
			<table width="600" align="center">
				<tr>
					<td>ID<input type="text" name="log_id"></td>
				</tr>
				<tr>
					<td>PW<input type="password" name="log_pw"></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인" action=#></td>
				</tr>
			</table>
		</main>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>