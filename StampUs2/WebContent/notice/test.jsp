<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>

<body>
<div class="reg-message">당신의 후기를 모아모아</div>
<div class="reg-message2">*후기 입력란*</div>

<section class="reg-box">
	<form>
		<div class="title-wrapper">
		<div style="width:90px;font-size:30px;font-family:S-CoreDream-3Light; ">제목 : </div>
		<div class="reg-title" contenteditable="true"></div>
		</div>
		<div class="buttons">
			<input type="button" class="BOLD" value="Bold"
				onclick="document.execCommand('bold')" /> <input type="button"
				class="ITALIC" value="Italic"
				onclick="document.execCommand('Italic')" /> <input type="button"
				class="UNDERBAR" value="underline"
				onclick="document.execCommand('Underline')" />
			<button type="button" class="aignLeft"
				onclick="document.execCommand('justifyleft')">
				<i class="fas fa-align-left"></i>
			</button>
			<button type="button" class="aignCenter"
				onclick="document.execCommand('justifycenter')">
				<i class="fas fa-align-center"></i>
			</button>
			<button type="button" class="aignRight" value="오른쪽 정렬"
				onclick="document.execCommand('justifyright')">
				<i class="fas fa-align-right"></i>
			</button>
			<select id="fontSize" width="50px">
				<option value="">글자 크기</option>
				<option value="3">10px</option>
				<option value="4">12px</option>
				<option value="5">16px</option>
				<option value="6">20px</option>
				<option value="7">30px</option>
			</select>
			<div class="filebox bs3-primary">
				<label for="ex_file2">사진 업로드</label> <input type="file"
					id="ex_file2" accept=".gif, .jpg, .png" name="images" id="imgaes" multiple>
			</div>
		</div>
		<div class="content" name="content" contenteditable="true"></div>
		<a id="submit" href="/board/list">등록</a>
		<!-- <input type="submit" id="submit" value="등록"> -->
	</form>
</body>
</html>