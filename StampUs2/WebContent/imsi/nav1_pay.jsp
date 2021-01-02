<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<main>
			<input type="radio" name="point" value="5">500p 
			<input type="radio" name="point" value="10">1000p 
			<input type="radio" name="point" value="15">1500p 
			<input type="radio" name="point" value="20">2000p 
			<input type="radio" name="point" value="25">2500p 
			<input type="radio" name="point" value="30">3000p 
			<input type="radio" name="point" value="35">3500p 
			<input type="radio" name="point" value="40">4000p
			<h3>결제방법</h3>
			<input type="submit" value="소액결제" action=#> 
			<input type="submit" value="카드결제" action=#> 
			<input type="submit" value="계좌이체" action=#> 
			<input type="submit" value="ARS결제" action=#>
		</main>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>