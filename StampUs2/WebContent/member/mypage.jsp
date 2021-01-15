<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dto.MemberDTO"%>
<%
	/* String userid = session.getAttribute("userid").toString(); */
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.userInfo("hong1234");
String[] chkinterest = new String[5];
String chkSex = "";
if (dto.getSex() != null) {
	String sex = dto.getSex();
	switch (sex) {
	case "0":
		chkSex = "checked";
		break;
	case "1":
		chkSex = "checked";
		break;
	case "2":
		chkSex = "checked";
		break;
	}
}
if (dto.getInterest() != null) {
	String[] interests = dto.getInterest().split(",");
	for (int i = 0; i < interests.length; i++) {
		switch (interests[i]) {
		case "0":
	chkinterest[0] = "checked";
	break;
		case "1":
	chkinterest[1] = "checked";
	break;
		case "2":
	chkinterest[2] = "checked";
	break;
		case "3":
	chkinterest[3] = "checked";
	break;
		case "4":
	chkinterest[4] = "checked";
	break;
		}
	}
}
%>
<jsp:include page="../header.jsp" />
<style>
#mypage h2 {
	font-size: 40px;
}

#info {
	width: 400px;
	margin: auto;
	margin-top: 30px;
}

#info li {
	list-style:none;
	margin:10px 0px;
}
#info label{
	line-height:30px;
}
</style>
<script>
var xhttp = new XMLHttpRequest();
function update(){
	xhttp.open("post","mypage_update.jsp");
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4 && xhttp.status == 200){
			document.getElementById("info").innerHTML = xhttp.responseText;
		}
	}
	xhttp.send();
}
function del(){
	xhttp.open("post","mypage_delete.jsp");
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4 && xhttp.status == 200){
			document.getElementById("info").innerHTML = xhttp.responseText;
		}
	}
	xhttp.send();
}
</script>
<section id="mypage">
	<div class="container">
		<div class="row">
			<div class="userinfo">
				<div id=info>
					<h2>내 정보</h2>
					<form id=minfo method="post">
						<ul>
							<li><label>이름 <input type="text" name="name"
									value="<%=dto.getName()%>" readonly>
							</label></li>
							<li><label>나이 <input type="text" name="age"
									value="<%=dto.getAge()%>대" readonly></label></li>
							<li><label>성별 <input type="radio" name="sex"
									value="0" <%=chkSex%> disabled>남자 <input type="radio"
									name="sex" value="1" <%=chkSex%> disabled>여자 <input
									type="radio" name="sex" value="2" <%=chkSex%> disabled>선택안함
							</label></li>
							<li><label>아이디 <input type="text" name="userid"
									value="<%=dto.getUserid()%>" readonly></label></li>
							<li><label>닉네임 <input type="text" name="nickName"
									value="<%=dto.getNickName()%>" readonly></label></li>
							<li><label>핸드폰 <input type="text" name="phoneNum"
									value="<%=dto.getPhoneNum()%>" readonly></label></li>
							<li><label>이메일 <input type="text" name="email"
									value="<%=dto.getEmail()%>" readonly></label></li>
							<li><label>충전금액 <input type="text" name="money"
									value="<%=dto.getMoney()%>" readonly></label></li>
							<li><label>관심분야 <input type="checkbox"
									name="interest" value="0" <%=chkinterest[0]%> disabled>공부
									<input type="checkbox" name="interest" value="1"
									<%=chkinterest[1]%> disabled>운동 <input type="checkbox"
									name="interest" value="2" <%=chkinterest[2]%> disabled>기상
									<input type="checkbox" name="interest" value="3"
									<%=chkinterest[3]%> disabled>식단 <input type="checkbox"
									name="interest" value="4" <%=chkinterest[4]%> disabled>기타
							</label></li>
							<li>
							<input type="button" value="수정하기" class="join" onclick="update()">
							<input type="button" value="탈퇴하기" onclick="del()">
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />