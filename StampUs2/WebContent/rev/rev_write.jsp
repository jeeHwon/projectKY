<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="index.css"> 
</head>
<body>

<jsp:include page="../header.jsp" />
  <form method="post" action="rev_write_ok.jsp" enctype="multipart/form-data">
	<table width="800" align="center">
	<tr>
	<td>등록시 주의사항</td>
	<td><h3>신중하게 등록하셔야합니다. 금액은 굳이 안써도 됨</h3></td>
	</tr>
   <tr>
     <td>업체명</td>
     <td><input type="text" name="rev_company" size="50"></td>
   </tr>
   <tr>
     <td>홈페이지주소</td>
     <td><input type="text" name="rev_addr" size="50"></td>
   </tr>
   <tr>
     <td>연락처</td>
     <td><input type="text" name="rev_tel" size="50"></td>
   </tr>
   <tr>
     <td>금액</td>
     <td><input type="text" name="rev_pay" ></td>
   </tr>
   <tr>
     <td>업체대표이미지</td>
     <td><input type="file" name="rev_img" ></td>
   </tr>
   <tr align="center">
     <td colspan="2"><input type="submit" value="업체등록하기" ></td>
   </tr>
  
  </table>
 </form>
		
<jsp:include page="../footer.jsp" />
</body> 
</html> 