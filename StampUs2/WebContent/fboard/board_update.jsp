<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@	page import="dto.FboardDto"%>
<%@	page import="dao.FboardDao"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	FboardDao fdao = new FboardDao();
	FboardDto fdto = fdao.content(id);
	session.getAttribute("userid");
	String userid = session.getAttribute("userid").toString();
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String word = (request.getParameter("word") == null) ? "" : request.getParameter("word");
	
%>
<jsp:include page="../header.jsp" />
<style>
#fboard_update .fboard_update {
	padding: 50px 0;
	position: relative;
}

#fboard_update h2 {
	font-size: 30px;
	font-weight: 500;
	margin-bottom: 20px;
}

#fboard_update .left {
	position: relative;
	margin-right: 423px;
	height: 1000px;
	padding: 34px;
	box-sizing: border-box;
	background: #f0f0f0
}

#fboard_update .left .select {
	overflow: hidden;
	padding-bottom: 10px;
}

#fboard_update .left .name {
	overflow: hidden;
	font-size: 16px;
	padding-bottom: 4px;
	margin-left:3px;
}

#fboard_update .right {
	position: absolute;
	right: 0;
	top: 50px;
	width: 400px;
	height: 1000px;
	padding: 34px;
	box-sizing: border-box;
	background-color: grey;
	background-size: auto;
}

#fboard_update .right .right_content .image_container {
	position: absolute;
	top: 11px;
	left: -9px;
	width: 350px;
	height: 513px;
}

#fboard_update .right h2 {
	color: black;
}

#fboard_update .right .right_content {
	position: relative;
}

#fboard_update .left .btn {
	float: right;
	font-size: 20px;
	background-color: #e7e7e7; 
	color: black;
	border: 2px solid #555555;
	padding: 15px 32px;
	text-decoration: none;
	display: inline-block;

}
#fboard_update .left .text {
	margin-top:5px;
}

.button {
	float:left;
	font-size: 20px;
	background-color: white; 
	color: black;
	border: 2px solid #555555;
	padding: 15px;
	text-decoration: none;
	display: inline-block;
}

   	
</style>
<section id="fboard_update">
<div class="container">
<div class="row">
<div class="fboard_update">
	<form method="post" id="frm" name="frm" action="board_write_ok.jsp"	enctype="multipart/form-data">
		<input type="hidden" name="id" value="<%=id%>"> 
		<input type="hidden" name="userid" value="<%=userid%>"> 
		<input type="hidden" name="pager" value="<%=pager%>">
		<input type="hidden" name="cla" value="<%=cla%>"> 
		<input type="hidden" name="word" value="<%=word%>">
		<div class="left">
			<h2 class="title" align="center">자유게시판 수정하기</h2>
			<div class="select">
				<div class="button1">
					이름 : <%=fdto.getUserid()%></div>
				<div class="button2">
					조회수 : <%=fdto.getReadnum()%></div>
				<div class="button3">
					작성일 : <%=fdto.getWriteday()%></div>
			</div>
		<div class="center">
			<div class="name">
				제 목 : <input type="text" name="title" size=40 placeholder="제목을 입력해주세요">
					<input type="file" id="fboard_img" accept="image/*" name="fboard_img" onchange="setThumbnail(event)"></div>
					<div class="text">
					<textarea cols="120" rows="35" name="content" placeholder="바르고 고운말을 씁시다~"></textarea></div>
					<div class="btn">
						<a href="#" class="red" onclick="document.getElementById('frm').submit()">수정하기</a>
					</div>
				</div>
			</div>
		</div>
	<div class="right">
		<h2 class="title" align="center">사진 미리보기</h2>
		<div class="right_content">
			<div class="image_container" id="image_container"></div>
		</div>
	</div>
	</form>
</div>
</div>
</section>
<script>
    function setThumbnail(event) {
        var reader = new FileReader()
        reader.onload = function (event) {
            var img = document.createElement("img")
            img.setAttribute("src", event.target.result)
            img.setAttribute("width", "350px")
            img.setAttribute("height", "350px")
            document.querySelector("div#image_container").appendChild(img)
        }
        reader.readAsDataURL(event.target.files[0])
    }
</script>
<jsp:include page="../footer.jsp" />