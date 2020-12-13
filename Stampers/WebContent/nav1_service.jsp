<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>헤더</header>
	<h2>고객센터</h2>
	<div>
		<ul>
			<li><a href=#>자주 찾는 질문</a></li>
			<li><a href=#>1:1 문의</a></li>
			<li><a href=#>이용약관</a></li>
		</ul>
	</div>
	<div align="center">
     <form name="se" method="post" action=#>
       <input type="text" name="sword">
       <input type="submit" value="검색">
     </form>
    </div>
   <!-- 레코드 내용 출력 -->
  
   <table width="600" align="center">
     <tr>
       <td> 이름 </td>
       <td> 제목 </td>
       <td> 작성일 </td>
     </tr>
     <tr>
       <td>개똥이 </td>
       <td> <a href=#>궁금하다!</a> </td>
       <td>2020.12.10</td>
     </tr>
     <tr>
      <td colspan="2"> <a href="write.jsp"> 글쓰기 </a> </td>
     </tr>
   </table>
	<footer>푸터</footer>
</body>
</html>