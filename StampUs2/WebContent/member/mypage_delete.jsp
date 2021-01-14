<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dto.MemberDTO"%>
<%
	/* String userid = session.getAttribute("userid").toString(); */
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.userInfo("hong1234");
%>
<script>
	var chk = new XMLHttpRequest();
	function pwdchk(pwd) {
		var pwd = document.all.pwd.value;
		chk.open("post", "pwdcheck.jsp?pwd=" + pwd);
		chk.send();
		chk.onreadystatechange = function() {
			if (chk.readyState == 4) {
				if (chk.responseText == 0) {
					document.getElementById("message").innerHTML = "<span style='color:red'>비밀번호불일치</span><br>"
				} else {
					alert("탈퇴되었습니다.")
					document.all.pwchk.value = 1;
				}
			}
		}
	}
	var checkpw = document.all.pwchk.value;
	function confirm(pwchk) {
		if (checkpw == 0) {
			pwchk.pwd.focus();
			return false;
		} else {
			return true;
		}
	}
</script>
<style>
#info h3 {
	font-size: 20px;
}

#info input {
	height: 30px;
	margin: auto;
	margin-top: 5px;
}

#chkpwd {
	width: 250px;
	height: 300px;
	margin: auto;
	margin-top: 100px;
}
</style>
<div id="info">
	<div id="chkpwd">
		<form name="pwchk" method="post" action="member_delete_ok.jsp" onsubmit="return confirm(this);">
			<input type="hidden" name="pwchk" value=0>
			<h3>비밀번호를 입력해주세요.</h3>
			<input type="password" name="pwd" onblur="pwdchk(this.value)">
			<p>
				<span id="message"></span> <input type="submit" value="탈퇴하기">
		</form>
	</div>
</div>