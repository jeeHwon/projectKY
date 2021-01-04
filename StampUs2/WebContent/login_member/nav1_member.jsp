<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../index.css">
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
	var chk = new XMLHttpRequest();

	function idcheck() {
		var userid = document.member.userid.value;
		if (userid == "") {
				document.getElementById("idposible").innerHTML = "<span style='color:red'>아이디를 입력하세요</span><br>"
			}else{
			chk.open("get", "member_idcheck.jsp?userid=" + userid);
			chk.send();

			chk.onreadystatechange = function() {
				if (chk.readyState == 4) {
					if (chk.responseText == 0) {
						document.getElementById("idposible").innerHTML = "<span sytle='color:blue'>사용가능</span><br>"
					} else {
						document.getElementById("idposible").innerHTML = "<span style='color:red'>사용불가능</span><br>"
					}
				}
			}
		}
	}
	function nickcheck() {
		var nickName = document.member.nickName.value;
		if (nickName == "") {
				document.getElementById("nickposible").innerHTML = "<span style='color:red'>닉네임을 입력하세요</span><br>"
			}else{
			chk.open("get", "member_nickcheck.jsp?nickName=" + nickName);
			chk.send();

			chk.onreadystatechange = function() {
				if (chk.readyState == 4) {
					if (chk.responseText == 0) {
						document.getElementById("nickposible").innerHTML = "<span sytle='color:blue'>사용가능</span><br>"
					} else {
						document.getElementById("nickposible").innerHTML = "<span style='color:red'>사용불가능</span><br>"
					}
				}
			}
		}
	}
</script>
</head>
<body>
	<div class="f3">
		<div class="logo">
			<a href="../index2.jsp"><img src="assets/img/logo.png"></a>
		</div>
	</div>
	<div class="container">
		<div class="main">
			<form name="member">
				<ul>
					<li><label>사용자ID<br> <input type="text"
							name="userid" maxlength="15" required> <input
							type="button" onclick="idcheck()" value="중복확인">
						<p>
								<span id="idposible"></span></label></li>
					<li><label>닉네임<br> <input type="text"
							name="nickName" maxlength="15"> <input type="button"
							onclick="nickcheck()" value="중복확인"><p>
							<span id="nickposible"></span>
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
							name="phoneNum" maxlength="11" size="15"
							replaceholder="'-'없이 입력하세요.">
					</label></li>
					<li><label>이메일<br> <input type="text"
							name="email" size="30">
					</label></li>
					<li>관심분야 <br> <input type="checkbox" name="interest"
						value="0">공부 <input type="checkbox" name="interest"
						value="1">운동 <input type="checkbox" name="interest"
						value="2">기상 <input type="checkbox" name="interest"
						value="3">식단 <input type="checkbox" name="interest"
						value="4">기타
					</li>
					<li><input type="submit" value="가입하기"
						action="nav1_member_ok.jsp" class="submit"></li>
				</ul>
			</form>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>