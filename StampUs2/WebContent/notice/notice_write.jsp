<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="index.css">
    <title>공지사항 작성</title> 
</head>
<body>

<jsp:include page="../header.jsp" />
	<h1 align="center"><a href="notice_list.jsp">공지사항</a></h1>
	<h3 align="center">stampus의 소식 및 안내사항을 확인하세요</h3>
  <form method="post" action="notice_write_ok.jsp" enctype="multipart/form-data">
  <div align="center">
	<table width="800" align="center">
	 <tr>
	  <td> <h4>제 목 </h4></td>
	  <td> <input type="text" name="notice_title" size="70" placeholder="제목을 입력하세요."> </td>
	 </tr>
	
	 <tr>
       <td> 내용 </td>
       <td> <textarea cols="80" rows="20" name="notice_content"  placeholder="내용을 입력하세요."></textarea> </td>
     </tr>
     <tr>
      <td>첨부</td>
      <td><input type="file" name="notice_file" ></td>
   </tr>
	  <tr align="center">
     <td colspan="2"><input type="submit" value="공지하기" ></td>
   </tr>
	</table>	
	</div>   
  </form>
 		
<jsp:include page="../footer.jsp" />
</body> 
</html> 