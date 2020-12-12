<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>nav자리</div>
<div id="container">
	<div id="inner"></div>
	<table width="600" align="center" border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" size="40"></td>
		</tr>
		<tr>
			<td>기간</td>
			<td>
			<select name="period">
				<option value="1m">1개월</option>
				<option value="3m">3개월</option>
				<option value="6m">6개월</option>
				<option value="9m">9개월</option>
				<option value="12m">12개월</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>인원수</td>
			<td>
			<input type="text" name="number" size="3">명
			</td>
		</tr>
		<tr>
			<td>인증방식</td>
			<td><input type="text" name="title" size="40"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="title" size="40"></td>
		</tr>
		<tr>
			<td>배경이미지</td>
			<td><input type="file" name="backgroundimg"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td><select name="category">
				<option value="study">공부</option>
				<option value="study">운동</option>
				<option value="study">기상</option>
				<option value="study">식단</option>
				<option value="study">취미</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>참여조건</td>
			<td>
			<input type="radio" name="condition" value="yes">있음
			<input type="radio" name="condition" checked value="no">없음
			</td>
		</tr>
		<tr>
			<td>보증금체크</td>
			<td>
			<input type="radio" name="deposit" value="5w">5000원
			<input type="radio" name="deposit" value="10w">10000원
			<input type="radio" name="deposit" value="15w">15000원
			<input type="radio" name="deposit" value="20w">20000원
			</td>
		</tr>
		<tr>
			<td>방공개여부</td>
			<td>
				<input type="radio" name="public" value="p">공개
				<input type="radio" name="public" value="non">비공개
			</td>
		</tr>
		<tr>
			<td>패널티</td>
			<td>
			<input type="radio" name="penalty" value="100p">100%
			<input type="radio" name="penalty" value="80p">80%
			<input type="radio" name="penalty" value="50p">50%
			<input type="radio" name="penalty" value="30p">30%
			</td>
		</tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="방만들기">
		<input type="reset" value="취소">
		</td>
		</tr>
	</table>
</div>
</body>
</html>