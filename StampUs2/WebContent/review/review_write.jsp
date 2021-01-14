<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	// 세션변수 만들기
	session.setAttribute("userid", "test");  // (변수명,값)
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 글쓰기</title>
<script>
  function addTag()
  {   
	  var IText=document.getElementById("tag").value;  //id="tag"의 값을 받아서 가져온다
	  var input = document.createElement('input'); //input태그 생성
	  input.setAttribute("type","text");
	  input.setAttribute("name","hash"); //name값 추가 
	  input.setAttribute("id","hash");
	  input.setAttribute("value",IText);
	  input.setAttribute("readonly","true");
	  document.getElementById("taglist").append(input);
  }
  function delTag()
  {
	  var h1=document.getElementById("hash");
	  h1.remove();
  }
</script>
<style>
  #hash {
    width:100px;
    display:inline;
    border:none;
  }
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
    <section id="review_write">
      <div align="center">
	      <form method="post" action="review_write_ok.jsp" enctype="multipart/form-data">
		    <table width="800" align="center">
		      <tr>
		        <td> 제목 </td>
		        <td> <input type="text" name="review_title"> </td>
		      </tr>
		      <tr>
		        <td> 첨부사진 </td>
		        <td> <input type="file" name="review_file"> </td>
		      </tr>
		      <tr>
		        <td> 내용 </td>
		        <td> <textarea cols="80" rows="10" name="review_content"></textarea> </td>
		      </tr>
		      <tr>
		        <td> 해쉬태그 </td>
		        <td> 
		          <input type="text" name="tag" id="tag">
		          <input type="button" name="hash_input" value="태그입력" onclick="addTag()">
		          <input type="button" name="hash_del" value="태그삭제" onclick="delTag()">
		        </td>
		      </tr>
		      <tr>
		        <td colspan="2" name="taglist" id="taglist"></td>
		      </tr>
		      <tr>
		        <td colspan="2" align="center">
		          <input type="submit" value="글쓰기">
		        </td>
		      </tr>          
		    </table>
		  </form>
	</div>  
	</section>	
<jsp:include page="../footer.jsp" />  
</body>
</html>