<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@page import="java.sql.*" %> 
<%@ page import="dao.ReviewDAO" %>
<%@ page import="dto.ReviewDTO" %>
<%
	// DB연결
	ReviewDAO rdao=new ReviewDAO();
	// request값 가져오기
    String review_no=request.getParameter("review_no"); 	
	
	ReviewDTO rdto=rdao.update(review_no);
	pageContext.setAttribute("rdto",rdto);	
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>
<jsp:include page="../header.jsp" />
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
  function update_check()
  {
	  if(document.getElementById("review_title").value=="")
	  {
		  alert("제목을 입력하세요");
		  return false;
	  }
	  else if(document.getElementById("review_content").value=="")
	  {
		  alert("내용을 입력하세요");
		  return false;
	  }
	  else if(document.getElementById("hash")==null)
	  {
		  alert("해시태그를 입력하세요");
		  return false;
	  }	
	  else
		  return true;
  }
</script>
<style>
  #hash {
    width:100px;
    display:inline;
    border:none;
    background:#f2f2f2;
  }
  #review_update
    {
    	background-image: url("../img/review/background.jpg");
    	background-repeat:no-repeat;
    	background-size:cover;
    }
  	.review table
  	{
  		margin-top:20px;
  		border-collapse:collapse;
  		background:white;
  	}
  	.review table tr
  	{
  		font-size:16px;
  	}
    .review table td
    {
    	border: 1px solid black;
    	padding:20px 5px;
    }
    .review table td:nth-child(odd)
    {
    	background: #f2f2f2;
    }
</style>
</head>
<body>
	<section id="review_update">
	 <div class="container">
	  <div class="review" align="center">
	      <form method="post" action="review_update_ok.jsp" enctype="multipart/form-data" onsubmit="return update_check()">
		    <input type="hidden" name="review_no" value=<%=review_no%>>
		    <table width="800" align="center">
		      <tr>
		        <td> 제목 </td>
		        <td> <input type="text" name="review_title" id="review_title" value="${rdto.review_title}"> </td>
		      </tr>
		      <tr>
		        <td> 첨부사진 </td>
		        <td>
		          <input type="file" name="review_file" id="review_file"> 
		        </td>
		      </tr>
		      <tr>
		        <td> 내용 </td>
		        <td> <textarea cols="80" rows="10" name="review_content" id="review_content">${rdto.review_content}</textarea> </td>
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
		          <input type="submit" value="수정하기">
		        </td>
		      </tr>          
		    </table>
		  </form>
	  </div>
	 </div> 
	</section>
<jsp:include page="../footer.jsp" />  
</body>
</html>
<%
	rdao.conn_close();
%>