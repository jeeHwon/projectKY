<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String chk = request.getParameter("chk");
%>
<jsp:include page="../header.jsp" />
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
	margin-top:10px;
}

#login button {
	width: 355px;
	height: 43px;
	font-size: 15px;
	cursor: pointer;
	color: white;
	background-color: #b71c1c;
	border: 0px solid #b71c1c;
	margin-top:10px;
}

#login span {
	color: #b71c1c;
}

#log .btm {
	padding: 31px 0 0 59px;
}

#log .btm li {
	color: #383d41;
	font-size: 12px;
}

#log .btm li a {
	font-size: 12 px;
	font-weight: bold;
	color: #629c2c;
	text-decoration: underline;
}

#log .f5 {
	height: 130px;
	margin: auto;
}
</style>
<section id="log">
	<div class="container">
		<div class="row">
			<div class="log">
				<div class="container">
					<div class="f5"></div>
					<div id="login" class="f6">
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
							<li><a href=../member/member.jsp>회원가입</a></li>
							<li>아이디를 잊으셨나요?<a href="find_ID.jsp">아이디 찾기</a></li>
							<li>비밀번호를 잊으셨나요?<a href="find_PW.jsp">비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />