<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="index.css"> 
</head>
<body>

<%@include file="header.jsp" %>
  <form method="post" action="fnq_write_ok.jsp" enctype="multipart/form-data">
	<table width="1000" align="center">
	<tr align="center">
			<span><a href="center.jsp">고객센터></a><a href="fnq_list.jsp">FAQ</a></span>
			<h1 align="center">
				<a href="fnq_list.jsp">FAQ</a>
			</h1>
			<h3 align="center">stampus를 편리하게 이용해보세요</h3>
		</tr>
   <tr>
     <td>질문</td>
     <td><input type="text" name="fnq_title" size="50"></td>
   </tr>
   <tr>
    <td> 질문유형 </td>
    <td> 
      <select name="fnq_type">
        <option value="인증 및 사용"> 인증 및 사용</option>
        <option value="결제"> 결제 </option>
        <option value="회원"> 회원 </option>
        <option value="사이트이용">사이트 이용 </option>
      </select>
    </td>
   </tr>
   <tr>
     <td>상세질문</td>
     <td> <textarea cols="100" rows="10" name="fnq_q"></textarea> </td>
   </tr>
   <tr>
     <td>답변내용</td>
     <td> <textarea cols="100" rows="10" name="fnq_a"></textarea> </td>
   </tr>
   <tr>
     <td>답변관련 이미지</td>
     <td><input type="file" name="fnq_img" ></td>
   </tr>
   <tr align="center">
     <td colspan="3"><input type="submit" value="faq등록" ></td>
   </tr>
  
  </table>
 </form>
		
<%@include file="footer.jsp" %>
</body> 
</html> 