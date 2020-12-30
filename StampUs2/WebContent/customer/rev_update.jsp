<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import ="custom.dao.RevDao" %>
<%@ page import ="custom.dto.RevDto" %>
<%
   // request값 가져오기
   String rev_no=request.getParameter("rev_no");

   // DB_Conn 클래스에서 update()실행
   
   RevDao rdao = new RevDao();
   RevDto rdto=rdao.update(rev_no);
   pageContext.setAttribute("rdto",rdto);
   
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="header.jsp" %>
  <form method="post" action="rev_update_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" name="rev_no" value="<%=rdto.getRev_no()%>">
	<table width="800" align="center">
	<tr>
	<td>등록시 주의사항</td>
	<td><h3>신중하게 등록하셔야합니다. 금액은 숫자로써주세요</h3></td>
	</tr>
   <tr>
     <td>업체명</td>
     <td><input type="text" name="rev_company" size="50" value="<%=rdto.getRev_company()%>"></td>
   </tr>
   <tr>
     <td>홈페이지주소</td>
     <td><input type="text" name="rev_addr" size="50" value="<%=rdto.getRev_addr()%>"></td>
   </tr>
   <tr>
     <td>연락처</td>
     <td><input type="text" name="rev_tel" size="50" value="<%=rdto.getRev_tel()%>"></td>
   </tr>
   <tr>
     <td>금액</td>
     <td><input type="text" name="rev_pay" value="<%=rdto.getRev_pay()%>"></td>
   </tr>
   <tr>
     <td>업체대표이미지</td>
     <td><input type="file" name="rev_img" value="<%=rdto.getRev_img()%> "></td>
   </tr>
   <tr align="center">
     <td colspan="2"><input type="submit" value="업체등록하기" ></td>
   </tr>
  
  </table>
 </form>
		
<%@include file="footer.jsp" %>
</body> 
</html> 