<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String chk = request.getParameter("chk");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="index.css">
<title>Insert title here</title>
<style>
#login {
	width: 400px;
	height: 300px;
	margin: auto;
}

#login input {
	width: 350px;
	height: 40px;
	border: 1px solid #b71c1c;
	font-size: 20px;
}

#login button {
	width: 355px;
	height: 43px;
	font-size: 15px;
	cursor: pointer;
	color: white;
	background-color: #b71c1c;
	border: 0px solid #b71c1c;
}

#login span {
	color: #b71c1c;
}
.btm {
	padding: 31px 0 0 59px;
}
.btm li{
	color : #383d41;
	font-size: 12px;
}
.btm li a{
	font-size:12 px;
	font-weight: bold;
	color: #629c2c;
	text-decoration:underline;
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<div id="login" class=f4>
			<form mehtod="post" action="login_ok.jsp">
				<input type="text" name="userid" placeholder="아이디" required>
				<p>
					<input type="password" name="pwd" placeholder="비밀번호" required>
				<p>
					<%
						if (chk == null) {
					%>
					<%
						} else {
					%>
					<span>아이디와 비밀번호를 확인해주세요</span>
					<%
						}
					%>
					<button type="submit">로그인</button>
			</form>
			<ul class="btm">
				<li><a href=nav1_member.jsp>회원가입</a></li>
				<li>아이디를 잊으셨나요?<a href=#>아이디 찾기</a></li>
				<li>비밀번호를 잊으셨나요?<a href=#>비밀번호 찾기</a></li>
			</ul>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>