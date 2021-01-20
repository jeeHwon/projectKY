<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.getAttribute("userid");
	String userid = (String)session.getAttribute("userid");
%>
<jsp:include page="../header.jsp" />
<style>
#fboard_write .fboard_write {
	padding: 50px 0;
	position: relative;
}

#fboard_write h2 {
	font-size: 30px;
	font-weight: 500;
	margin-bottom: 20px;
}

#fboard_write .left {
	position: relative;
	margin-right: 423px;
	height: 1000px;
	padding: 34px;
	box-sizing: border-box;
	background: #f0f0f0
}

#fboard_write .left .select {
	overflow: hidden;
	padding-bottom: 10px;
}

#fboard_write .left .name {
	overflow: hidden;
	font-size: 16px;
	padding-bottom: 4px;
	margin-left:3px;
}

#fboard_write .right {
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

#fboard_write .right .right_content .image_container {
	position: absolute;
	top: 11px;
	left: -9px;
	width: 350px;
	height: 513px;
}

#fboard_write .right h2 {
	color: black;
}

#fboard_write .right .right_content {
	position: relative;
}

#fboard_write .left .btn {
	float: right;
	font-size: 20px;
	background-color: #e7e7e7; 
	color: black;
	border: 2px solid #555555;
	padding: 15px 32px;
	text-decoration: none;
	display: inline-block;

}
#fboard_write .left .text {
	margin-top:5px;
}

</style>
<section id="fboard_write">
<div class="container">
<div class="row">
<div class="fboard_write">
	<form method="post" id="frm" name="frm" action="board_write_ok.jsp"	enctype="multipart/form-data">
		<div class="left">
			<h2 class="title" align="center">자유게시판 글쓰기</h2>
			<div class="select">
				<div class="name">
					제 목 : <input type="text" name="title" size=40 placeholder="제목을 입력해주세요">
					<input type="file" id="fboard_img" accept="image/*" name="fboard_img" onchange="setThumbnail(event)"></div>
					<div class="text">
					<textarea cols="120" rows="35" name="content" placeholder="심한 욕설과 상대에 대한 비난은 삼가해주세요~"></textarea></div>
					<div class="btn">
						<a href="#" class="red" onclick="document.getElementById('frm').submit()">글쓰기</a>
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