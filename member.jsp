<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>   
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
function idfocus(){
    document.member.id.focus();
}
function emailchk(){
    frm.id3.value=frm.email[frm.email.selectedIndex].value
}
function frmchk(){
	//frm=document.member
    if (frm.id.value.length==0){
        alert("아이디를 입력하세요")
        frm.id.focus()
        return false;
    }
    if (frm.pw.value.length==0){
        alert("비밀번호를 입력하세요")
        frm.pw.focus()
        return false;
    }
    if (frm.pw.value!=frm.pw1.value){
        alert("비밀번호 확인을 정확히 입력하세요")
        frm.pw1.value="";
        frm.pw1.focus();
        return;
    }
    if (frm.id3.value.indexOf('.')==-1){
        alert("이메일형식을 정확히 하세요")
        return false;
    }
    if (confirm("가입하시겠습니까?")){
        frm.submit();
    }
}
</script>
</head>
<body onload="idfocus()">
<form name="member" action=# onsubmit="return false">
<table width="800" border="1">
        <tr>
            <td colspan = "2" style="text-align:center">회원가입</td>
        </tr>
        <tr>
            <td width="20%">사용자ID</td>
            <td width="80%">
                <input type = "text" name = "id" maxlength="15">
                <input type = "button" value = "중복확인">
            </td>
        </tr>
        <tr>
            <td width="20%">비밀번호</td>
            <td width="80%">
                <input type = "password" name = "pw" maxlength="15">
            </td>
        </tr>
        <tr>
            <td width="20%">비밀번호확인</td>
            <td width="80%">
                <input type = "password" name = "pw1" maxlength="15">
            </td>
        </tr>
        <tr>
            <td width="20%">사용자이름</td>
            <td width="80%">
                <input type = "text" name = "userN" maxlength="15">
            </td>
        </tr>
        <tr>
            <td width="20%">주민등록번호</td>
            <td width="80%">
                <input type = "text" name = "birth1" maxlength="15"> -
                <input type = "text" name = "birth2" maxlength="15">
            </td>
        </tr>
        <tr>
            <td width="20%">이메일</td>
            <td width="80%">
                <input type = "text" name = "email-Id" maxlength="10">@
                <input type = "text" name = "id3" >
                <select name ="email" onchange="emailchk()">
                    <option value="" selected>직접입력</option>
                    <option value="naver.com" >naver.com</option>
                    <option value="gmail.com" >gmail.com</option>
                    <option value="nate.com" >nate.com</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan = "2" style="text-align:center">
                <input type = "submit" value = "회원가입" onclick="frmchk()">
                <input type = "reset" value = "다시입력">
            </td>
        </tr>
    </table>
</form>
</body>
</html>