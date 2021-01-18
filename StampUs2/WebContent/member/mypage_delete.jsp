<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dto.MemberDTO"%>
<%
String userid = session.getAttribute("userid").toString();
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.userInfo(userid);
%>
<script>

	var chk = new XMLHttpRequest();
	function pwdchk(pwd) {
		var userid = "<%=dto.getUserid()%>";
		chk.open("post", "pwdcheck.jsp?pwd=" + pwd+"&userid="+userid);
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
	
	
	var checkpw = "";
	function init(){
		checkpw = document.all.pwchk.value;
	}
	
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
<div id="info" onload="init()">
	<div id="chkpwd">
		<form name="all" method="post" action="member_delete_ok.jsp" onsubmit="return confirm(this);">
			<input type="hidden" name="pwchk" value="0">
			<h3>비밀번호를 입력해주세요.</h3>
			<input type="password" name="pwd" onblur="pwdchk(this.value)">
			<p>
				<span id="message"></span> <input type="submit" value="탈퇴하기">
		</form>
	</div>
</div>