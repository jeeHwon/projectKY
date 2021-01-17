<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	
	String study_no=request.getParameter("study_no");

%>
<jsp:include page="../header.jsp" />
<section id="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
	<div class="container">
		<h1>인증 글쓰기</h1>
        	<div class="writeForm">
         		<form name="writeForm" method="post" action="study_my_write_ok.jsp" enctype="multipart/form-data">
         		<input type="hidden" name="study_no" value="<%=study_no %>">
	         		<table>
		         		<tr>
		         			<td>제목</td>
		         			<td><input type="text" name="study_title" placeholder="제목을 입력하세요"></td>
		         		</tr>
		         		<tr>
		         			<td>내용</td>
		         			<td><textarea name="study_content" placeholder="내용을 입력하세요"></textarea></td>
		         		<tr>
		         		    <td>사진 첨부</td>
		         		    <td><input type="file" name="study_img"></td>
		         		</tr>
		         		<tr>
		         			<td colspan="2"><input type="submit" value="글쓰기"></td>
		         		</tr>
	         		</table>
         		</form>
         	</div>           
	</div>
	</div>
	</div>
	</div>
	</section>
<jsp:include page="../footer.jsp" />
