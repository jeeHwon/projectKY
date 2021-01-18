<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@include file="study_my_header.jsp" %>
<%
	String study_my_no=request.getParameter("study_my_no");
	

	sDAO= new Study_my_DAO();
	Study_my_DTO sDTO = sDAO.content(study_my_no);
%>
<style>
.study_my_list table{ width:100%;}
.study_my_list tr { line-height: 40px;}
.study_my_list input[type="text"] { display: inline-block; width:100%; padding:5px;}
.study_my_list textarea {display: inline-block; width:100%; padding:5px; height: 400px;}
#button{font-size: 18px; float:right; box-sizing: border-box; display: inline-block; margin-top:5px; padding: 10px 30px 12px 30px; background-color: #CB230C; margin-right: 1%; margin-left: 1%; color: #fff; border: 1px solid #E68D80;}
#button:hover{background: #E68D80; border-color: #CB230C; color: #fff;}
</style>


<div id="study_list">
		
        	<div class="study_my_list">
        	<h2><strong>인증 글수정</strong></h2>
         		<form name="updateForm" method="post" action="study_my_update_ok.jsp" enctype="multipart/form-data">
	         		<input type="hidden" name="study_my_no" value="<%=study_my_no %>">
	         		<input type="hidden" name="study_no" value="<%=study_no %>">
	         		<table>
		         		<tr>
		         			<td>제목</td>
		         			<td><input type="text" name="study_title" value="<%=sDTO.getStudy_title() %>" placeholder="제목을 입력하세요"></td>
		         		</tr>
		         		<tr>
		         			<td>내용</td>
		         			<td><textarea name="study_content" placeholder="내용을 입력하세요"><%=sDTO.getStudy_content() %></textarea></td>
		         		<tr>
		         		    <td>사진 첨부</td>
		         		    <td><input type="file" name="study_img"></td>
		         		</tr>
		         		<tr>
		         			<td colspan="2"><input id="button" type="submit" value="글수정"></td>
		         		</tr>
	         		</table>
         		</form>
         	</div>           
	</div>
<%@include file="study_my_footer.jsp" %>