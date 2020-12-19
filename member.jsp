<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="index.css">
<title>회원가입</title>
<style>
body {
	background-color: #f5f5f5;
}

div.container {
	border: 1px solid;
}

div.main {
	width: 460px;
	margin: 30px auto;
}
li {
	list-style: none;
	margin: 15px 0px;
}

input, select {
	height: 30px;
}

label {
	line-height: 30px;
}

input.submit, button {
	font-size: 15px;
	cursor: pointer;
	color: white;
	display: bloclk;
	background-color: #b71c1c;
	border: 0px solid #b71c1c;
}
</style>
<script>
	function idfocus() {
		document.member.id.focus();
	}
	function emailchk() {
		frm.id3.value = frm.email[frm.email.selectedIndex].value
	}
	function frmchk() {
		//frm=document.member
		if (frm.pw.value != frm.pw1.value) {
			alert("비밀번호 확인을 정확히 입력하세요")
			frm.pw1.value = "";
			frm.pw1.focus();
			return false;
		}
		if (frm.id3.value.indexOf('.') == -1) {
			alert("이메일형식을 정확히 하세요")
			return false;
		}
		if (confirm("가입하시겠습니까?")) {
			frm.submit();
		}
		response.sendRedirect("index2.jsp");
	}
	function idchk(){
		if()
	}
</script>
</head>
<body onload="idfocus()">
	<div class="f3">
		<div class="logo">
			<a href="index2.jsp"><img src="img/logo_imsi.png"></a>
		</div>
	</div>
	<div class="container">
		<div class="main">
			<form name="member" action="member_ok.jsp">
				<ul>
					<li><label>사용자ID<br> <input type="text" name="userid"
							maxlength="15" required> <button onclick="idchk()">중복확인</button>
					</label></li>
					<li><label>닉네임<br> <input type="text"
							name="nickName" maxlength="15"> <input type="button"
							value="중복확인">
					</label></li>
					<li><label>비밀번호<br> <input type="password"
							name="pwd" maxlength="15" required>
					</label></li>
					<li><label>비밀번호확인<br> <input type="password"
							name="pwd1" maxlength="15" required>
					</label></li>
					<li><label>사용자이름<br> <input type="text"
							name="name" maxlength="15" required>
					</label></li>
					<li><label> 연령대 <br> <select name="age">
								<%
									for (int i = 1; i <= 7; i++) {
									int sum = i * 10;
								%>
								<option value="<%=sum%>">
									<%=sum%>대
								</option>
								<%
									}
								%>
						</select>
					</label></li>
					<li><label> 성별 <br> <input type="radio"
							name="sex" value="0">남자 <input type="radio" name="sex"
							value="1">여자 <input type="radio" name="sex" value="2">선택안함
					</label></li>
					<li><label>핸드폰번호<br> <input type="text"
							name="phoneNum" maxlength="11" size="15" replaceholder="'-'없이 입력하세요.">
					</label></li>
					<li><label>이메일<br> <input type="text"
							name="email" size="30">
					</label></li>
					<li> 관심분야 <br> <input type="checkbox"
							name="interest" value="0">공부 <input type="checkbox"
							name="interest" value="1">운동 <input type="checkbox"
							name="interest" value="2">기상 <input type="checkbox"
							name="interest" value="3">식단 <input type="checkbox"
							name="interest" value="4">기타
					</li>
					<li>
						<input type="submit" value="가입하기" onclick="frmchk()" class="submit">
					</li>
				</ul>
			</form>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>