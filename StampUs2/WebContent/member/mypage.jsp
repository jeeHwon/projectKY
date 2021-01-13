<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="dto.MemberDTO"%>
<% 
/* String userid = session.getAttribute("userid").toString(); */

MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.userInfo("userid");
String[] chkinterest = new String[5];
String chkSex = "";
if(dto.getSex() != null){
	String sex =  dto.getSex();
		switch(sex){
		case "0" : chkSex = "checked";break;
		case "1" : chkSex = "checked";break;
		case "2" : chkSex = "checked";break;
 	}
}
if(dto.getInterest() != null){
	String[] interests = dto.getInterest().split(",");
	for(int i=0; i<interests.length; i++){
		switch(interests[i]){
		case "0" : chkinterest[0] = "checked"; break;
		case "1" : chkinterest[1] = "checked"; break;
		case "2" : chkinterest[2] = "checked"; break;
		case "3" : chkinterest[3] = "checked"; break;
		case "4" : chkinterest[4] = "checked"; break;
		}
	}
}
%>
<style>
#userinfo h2{
	font-size: 40px;
}
</style>
<jsp:include page="../header.jsp" />

<section id="mypage">
	<div class="container">
		<div class="row">
			<div class="userinfo">
				<h2>내 정보</h2>
				<form id=minfo method="post">
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" value="<%=dto.getName() %>" readonly></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="text" name="age" value="<%=dto.getAge() %>대" readonly></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
							<input type="radio" name="sex" value="0"<%=chkSex%> readonly>남자
							<input type="radio" name="sex" value="1"<%=chkSex%> readonly>여자
							<input type="radio" name="sex" value="2"<%=chkSex%> readonly>선택안함
							</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="userid" value="<%=dto.getUserid() %>" readonly></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" name="nickName" value="<%=dto.getNickName() %>" readonly></td>
						</tr>
						<tr>
							<td>핸드폰</td>
							<td><input type="text" name="phoneNum" value="<%=dto.getPhoneNum() %>" readonly></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" value="<%=dto.getEmail() %>" readonly></td>
						</tr>
						<tr>
							<td>충전금액</td>
							<td><input type="text" name="money" value="<%=dto.getMoney() %>" readonly></td>
						</tr>
						<tr>
							<td>관심분야</td>
							<td>
								<input type="checkbox" name="interest" value="0" <%=chkinterest[0]%>>공부
								<input type="checkbox" name="interest" value="1" <%=chkinterest[1]%>>운동
								<input type="checkbox" name="interest" value="2" <%=chkinterest[2]%>>기상 
								<input type="checkbox" name="interest" value="3" <%=chkinterest[3]%>>식단
								<input type="checkbox" name="interest" value="4" <%=chkinterest[4]%>>기타
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />