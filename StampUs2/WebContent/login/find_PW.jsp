<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" />
<style>
#findid {
	width: 400px;
	height: 300px;
	margin: auto;
}

#findid input {
	width: 350px;
	height: 40px;
	border: 1px solid #b71c1c;
	font-size: 20px;
}

#findid button {
	width: 355px;
	height: 43px;
	font-size: 15px;
	cursor: pointer;
	color: white;
	background-color: #b71c1c;
	border: 0px solid #b71c1c;
}

#findPW .btm {
	padding: 31px 0 0 59px;
}

#findPW .btm li {
	color: #383d41;
	font-size: 12px;
}

#findPW .btm li a {
	font-size: 12 px;
	font-weight: bold;
	color: #629c2c;
	text-decoration: underline;
}

#findPW .f5 {
	height: 130px;
	padding: 50px 0 0 0;
}

#findPW h2 {
	font-size: 50px;
}

#findPW h3 {
	font-size: 25px;
}
</style>
<section id="findPW">
	<div class="container">
		<div class="row">
			<div class="find_PW">
				<div class="container">
					<div class="f5" align="center">
						<h2>비밀번호 찾기</h2>
						<p>
						<h3>비밀번호는 이름,가입한 아이디,이메일로 찾을 수 있습니다.</h3>
					</div>
					<div id="findid" class="f6">
						<form mehtod="post" action="find_PW_ok.jsp">
							<input type="text" name="userid" placeholder="아이디" required>
							<p>
								<input type="text" name="name" placeholder="이름" required>
							<p>
								<input type="email" name="email" placeholder="이메일" required>
							<p>
								<button type="submit">찾기</button>
						</form>
						<ul class="btm">
							<li><a href=nav1_member.jsp>회원가입</a></li>
							<li>아이디를 잊으셨나요?<a href="find_ID.jsp">아이디 찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />