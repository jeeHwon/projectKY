<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page import="dao.ReviewDAO" %>
<%@ page import="dto.ReviewDTO" %>
<%@ page import="dao.Review_dat_DAO" %>
<%@ page import="dto.Review_dat_DTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//DB연결
	ReviewDAO rdao=new ReviewDAO();

	// request값 읽어오기
    String review_no=request.getParameter("review_no");
	String user_id=(session.getAttribute("userid")==null) ? "" : session.getAttribute("userid").toString();
	
	ReviewDTO rdto=rdao.content(review_no);
	pageContext.setAttribute("rdto",rdto);	
	
	// 해쉬태그 나누기
	String[] hash=rdto.getHash().split(",");
	pageContext.setAttribute("hash",hash);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 내용</title>
<jsp:include page="../header.jsp" />
<style>
  #dat_del,#dat_up,#del {visibility:hidden;}
  #review_content
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
    	border-bottom: 1px solid black;
    	padding:20px 5px;
    }
    .review #content_table td:nth-child(odd)
    {
    	background: #f2f2f2;
    }
    #content_photo
    {
    	background:white;
    }
</style>
<script>
  function del_ok()
  {
	  if("<%=user_id%>"=="")
		  {
		  	alert("로그인하세요")
		  	return false
		  }
	  else
	  	document.getElementById("del").style.visibility="visible";
  }
  function update_ok()
  {
	  if("<%=user_id%>"=="")
	  {
	  	alert("로그인하세요");
	  	return false;
	  }
      else
    	  window.location.href="review_update.jsp?review_no=${rdto.review_no}";
  }
</script>
</head>
<body>
    <section id="review_content">
     <div class="container">
	  <div class="review" align="center">
	  <table width="800" align="center" id="content_table">
	    <tr>
	      <td>제목</td>
	      <td colspan="5"> ${rdto.review_title} </td>
	    </tr>
	    <tr>
	      <td>작성자</td>
	      <td> ${rdto.user_id} </td>
	      <td>작성일</td>
	      <td> ${rdto.review_postday} </td>
	      <td>조회수</td>
	      <td> ${rdto.review_view} </td>
	    </tr>
	    <tr>
	      <td colspan="6" id="content_photo">
	        <img src="../img/review/${rdto.review_file}"
	        onerror="this.src='../img/review/no-camera.png'" style="width:600px;">
	      </td>
	    </tr>
	    <tr>
	      <td>내용</td>
	      <td colspan="5"> ${rdto.review_content} </td>
	    </tr>
	    <tr>
	      <td>해시태그</td>
	      <td>
	        <c:forEach items="${hash}" var="i">
	          <a href="review_list.jsp?pager=1&cla=hash&sword=${i}"> ${i} </a>
	        </c:forEach>
	      </td>
	    </tr>
	    <tr>
	      <td colspan="6" align="center"> 
	        <a href="#" onclick="update_ok()"> 수정 </a>
	        <a href="#" onclick="del_ok()">삭제</a>
	        <a href="review_list.jsp"> 목록 </a>
	      </td>
	    </tr>
	    <%
	    if(request.getParameter("chk") != null)
	    {
	    %>
	    <tr>
	      <td colspan="6" align="center" style="color:red"> 접근할수 없습니다. </td>
	    </tr>
	    <%
	    }
	    %>
	  </table>
	  <form method="post" action="review_delete.jsp" id="del" align="center">
	    <input type="hidden" name="review_no" value="<%=review_no%>">
	        정말로 지우시겠습니까?  <input type="submit" value="지금삭제">
	  </form>
	  
	  
	  <!-- 댓글 관련 작업 -->
	  <!-- 댓글을 입력 폼  => 작성자, 내용, 비번 -->
	  <div align="center">
	    <form name="dat" method="post" action="review_dat_write_ok.jsp" onsubmit="return dat_write()">
	      <input type="hidden" name="review_no" value=<%=review_no%>> <!-- review 테이블의 "review_no" -->
	      <input type="text" name="user_id" value=<%=user_id%> readonly>
	      <input type="text" name="review_dat_content" id="review_dat_content" size="85" placeholder="댓글 내용">
	      <input type="submit" value="댓글달기">
	    </form>
	   </div>  
	  <!-- 댓글 출력 -->
	  <%
	     // Db연결 => 위에 있음
	     Review_dat_DAO rddao=new Review_dat_DAO();
	     ArrayList<Review_dat_DTO> rddto=rddao.review_content(review_no);
	     pageContext.setAttribute("rddto",rddto);
	  %>
	   <div align="center">
	     <table align="center" width="800" id="dat_table">
	     <!-- 레코드를 출력 -->
	     <c:forEach items="${rddto}" var="rddto">
	       <tr>
	         <td> ${rddto.user_id} </td>  <!-- 작성자 -->
	         <td> ${rddto.review_dat_content} </td>  <!-- 내용  -->
	         <td> ${rddto.review_dat_day} </td>  <!-- 작성일 -->
	         <td> <a href="#" onclick="update(${rddto.review_dat_no},'${rddto.user_id}','${rddto.review_dat_content}')"> 수정 </a> </td>
	         <td> <a href="#" onclick="ddel(${rddto.review_dat_no})"> 삭제 </a> </td>
	       </tr>
	     </c:forEach>
	     </table>
	     <!-- 댓글의 수정폼 -->
	     <form  id="dat_up" name="up" method="post" action="review_dat_update_ok.jsp">
	      <input type="hidden" name="review_no" value=<%=review_no%>> <!-- review 테이블의 "review_no" -->
	      <input type="hidden" name="review_dat_no">
	      <input type="text" name="user_id" value=<%=user_id%> readonly>
	      <input type="text" name="review_dat_content" size="50" placeholder="댓글 내용">
	      <input type="submit" value="댓글수정">
	     </form>
	     <!-- 댓글의 삭제폼 => 삭제하고자하는 dat테이블의 id,pwd --> 
	     <form id="dat_del" name="del" method="post" action="review_dat_delete.jsp">
	       <input type="hidden" name="review_no" value="<%=review_no%>"> 
	       <input type="hidden" name="review_dat_no">
	       <input type="submit" value="댓글삭제">
	     </form>
	   </div>
	   <script>
	    function dat_write()
	    {
	    	if("<%=user_id%>"=="")
			{
			    alert("로그인하세요");
			    return false;
			}
	    	else if(document.getElementById("review_dat_content").value=="")
	    	{
	    	    alert("댓글을 입력하세요");
			    return false;
	    	}
	    	else
	    		return true;
	    }
	    function update(review_dat_no,user_id,review_dat_content)
	    {
	    	if("<%=user_id%>"=="")
			  {
			  	alert("로그인하세요");
			  	return false;
			  }
		  	else
		  	{
			  document.up.review_dat_no.value=review_dat_no;
			  document.up.user_id.value=user_id;
			  document.up.review_dat_content.value=review_dat_content;
			  var x=event.clientX;
			  var y=event.clientY;
			  document.getElementById("dat_up").style.visibility="visible";
			  document.getElementById("dat_up").style.left=(x-500)+"px";
			  document.getElementById("dat_up").style.top=(y+100)+"px";
		  	}
	    }
	    function ddel(review_dat_no)
	    {
	    	if("<%=user_id%>"=="")
			{
			  alert("로그인하세요");
			  return false;
			}
		  	else
		  	{
		  	  document.del.review_dat_no.value=review_dat_no;
		      var x=event.clientX;
		 	  var y=event.clientY;
		 	  document.getElementById("dat_del").style.visibility="visible";
			  document.getElementById("dat_del").style.left=(x-130)+"px";
			  document.getElementById("dat_del").style.top=(y+100)+"px";
		  	}
	    }
	   </script>
	  </div>   
	 </div>   
    </section>
<jsp:include page="../footer.jsp" />
</body>
</html>
<%
	rdao.conn_close();
%>