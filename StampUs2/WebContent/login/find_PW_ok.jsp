<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "dao.LoginDAO" %>
<%@ page import="dto.LoginDTO" %>
<%
LoginDAO dao = new LoginDAO();

request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String email = request.getParameter("email");
String userid = request.getParameter("userid");

LoginDTO dto = new LoginDTO();
dto.setEmail(email);
dto.setName(name);
dto.setUserid(userid);

String pw = dao.findPw(dto);
%>

<%
	if (pw == null) {
%>
<script type="text/javascript">
alert("존재하지 않은 계정입니다");
history.go(-1);
</script>
<%
	} else {
%>
<script type="text/javascript">
alert("찾으시는 비밀번호는  <%=pw%> 입니다.");
	location.href = "log.jsp";
</script>
<%
	}
%>