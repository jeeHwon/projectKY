<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<%
	session.setAttribute("userid", "user1");

	String user_id = session.getAttribute("userid").toString();

	RankingDAO rDAO = new RankingDAO();
	
	ArrayList<RankingDTO> ulist = rDAO.userRoomRate(user_id);
	
	double urate=rDAO.userRate(user_id);
	
	ArrayList<RankingDTO> rlist = rDAO.roomRanking();
	
	ArrayList<RankingDTO> urlist = rDAO.userRanking();
	
	pageContext.setAttribute("ulist", ulist);
	pageContext.setAttribute("urate", urate);
	pageContext.setAttribute("rlist", rlist);
	pageContext.setAttribute("urlist", urlist);
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h1>내 전체 달성률</h1>
<p>${urate} % </p>
<h1>내 방별 달성률</h1>
<table>
<c:forEach var="dto" items="${ulist}">
<tr>
	<td>${dto.room_title}</td>
	<td>${dto.rate} %</td>
</tr>
</c:forEach>
</table>
<h1>랭킹</h1>
<h2>방별 인증 랭킹</h2>
<table>
<c:forEach var="dto" items="${rlist}">
<tr>
	<td>${dto.rank }</td>
	<td>${dto.room_title }</td>
	<td>${dto.rate } %</td>
</tr>
</c:forEach>
</table>
<h2>회원별 인증 랭킹</h2>
<table>
<c:forEach var="dto" items="${urlist}">
<tr>
	<td>${dto.rank }</td>
	<td>${dto.user_id }</td>
	<td>${dto.rate } %</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>