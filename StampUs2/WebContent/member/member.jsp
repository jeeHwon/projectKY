<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

#member div.main {
	width: 460px;
	margin: 30px auto;
}

#member li {
	list-style: none;
	margin: 15px 0px;
}

#member input, select {
	height: 30px;
}

#member label {
	line-height: 30px;
}

#member input.join {
	font-size: 15px;
	cursor: pointer;
	color: white;
	display: bloclk;
	background-color: #CB230C;
}
#member input.check {
	font-size: 15px;
	cursor: pointer;
	color: black;
	display: bloclk;
	background-color: #f5f5f5;
	border:1px solid #CB230C;
}
</style>
<script>
	var chk = new XMLHttpRequest();

	function idcheck() { //아이디 중복확인기능
		var userid = document.member.userid.value;
		if (userid == "") {
			document.getElementById("idposible").innerHTML = "<span style='color:red'>아이디를 입력하세요</span><br>"
		} else {
			chk.open("get", "member_idcheck.jsp?userid=" + userid);
			document.all.checkid.value = 1;
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
	function nickcheck() { //닉네임 중복확인기능
		var nickName = document.member.nickName.value;
		if (nickName == "") {
			document.getElementById("nickposible").innerHTML = "<span style='color:red'>닉네임을 입력하세요</span><br>"
		} else {
			chk.open("get", "member_nickcheck.jsp?nickName=" + nickName);
			document.all.checknick.value = 1;
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
	function chkForm() { //아이디와 닉네임 중복확인 여부를 체크하는 기능
		var checkid = document.all.checkid.value;
		var checknick = document.all.checknick.value;

		if (checkid == 0) {
			alert("ID 중복체크를 하세요!");
			return false;
		} else if (checknick == 0) {
			alert("닉네임 중복체크를 하세요!");
			return false;
		} else
			return true;
	}
</script>
<jsp:include page="../header.jsp" />
<section id="member">
	<div class="container">
		<div class="main">
			<form action="nav1_member_ok.jsp" name="member" method="post"
				onsubmit="return chkForm()">
				<ul>
					<li><label>사용자ID<br> <input type="text"
							name="userid" maxlength="15" required> <input
							type="hidden" name="checkid" value=0> <input
							type="button" onclick="idcheck()" value="중복확인" class="check">
							<p>
								<span id="idposible"></span></label></li>
					<li><label>닉네임<br> <input type="text"
							name="nickName" maxlength="15"> <input type="hidden"
							name="checknick" value=0> <input type="button"
							onclick="nickcheck()" value="중복확인" class="check">
						<p>
								<span id="nickposible"></span></label></li>
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
					<li><input type="submit" value="가입하기" class="join"></li>
				</ul>
			</form>
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp" />