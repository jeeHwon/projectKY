<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 글쓰기</title>
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
  function write_check()
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
  function setThumbnail(event) {
      var reader = new FileReader()
      reader.onload = function (event) {
    	  if(document.getElementById("imsiimg")!=null)
    		  document.getElementById("imsiimg").remove();
    	  
    	  var imgcon = document.querySelector("div#image_container")
          var img = document.createElement("img")
          img.setAttribute("src", event.target.result)
          img.setAttribute("width", "350px")
          img.setAttribute("height", "513px")
          img.setAttribute("id","imsiimg")
          imgcon.appendChild(img)
      }
      reader.readAsDataURL(event.target.files[0])
  }
</script>
<style>
  #hash {
    width:100px;
    display:inline;
    border:none;
    background:#f2f2f2;
  }
  #review_write
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
    <section id="review_write">
     <div class="container">
	  <div class="review" align="center">
	      <form method="post" action="review_write_ok.jsp" enctype="multipart/form-data" onsubmit="return write_check()">
		    <table width="800" align="center">
		      <tr>
		        <td> 제목 </td>
		        <td> <input type="text" name="review_title" id="review_title"> </td>
		      </tr>
		      <tr>
		        <td> 첨부사진 </td>
		        <td> 
		          <input type="file" name="review_file" id="review_file" onchange="setThumbnail(event)"> 
		          <div class="image_container" id="image_container"></div>
		        </td>
		      </tr>
		      <tr>
		        <td> 내용 </td>
		        <td> <textarea cols="80" rows="10" name="review_content" id="review_content"></textarea> </td>
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
	 </div>  
	</section>	
<jsp:include page="../footer.jsp" />  
</body>
</html>