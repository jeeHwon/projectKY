<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.FnqDao" %>
<%@ page import ="dto.FnqDto" %> 
<%
   // request값 가져오기
   String fnq_no=request.getParameter("fnq_no");

   // DB_Conn 클래스에서 update()실행
   
   FnqDao fdao = new FnqDao();
   FnqDto fdto=fdao.update(fnq_no);
   pageContext.setAttribute("fdto",fdto);
   
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   // 성별, 취미, 태어난 해를 적용하여 처음 선택했던 값으로 표현되게
   function init()
   {
 	document.ky.fnq_type.value=<%=fdto.getFnq_type()%>;
   }
 </script>
</head>
<body onload="init()">

<jsp:include page="../header.jsp" />
  <form name="ky" method="post" action="fnq_update_ok.jsp" enctype="multipart/form-data">
	<input type="hidden" name="fnq_no" value="<%=fnq_no%>">
	<table width="1000" align="center">
	<tr align="center">
			<span><a href="center.jsp">고객센터></a><a href="fnq_list.jsp">FAQ</a></span>
			<h1 align="center">
				<a href="fnq_list.jsp">FAQ</a>
			</h1>
			<h3 align="center">stampus를 편리하게 이용해보세요</h3>
		</tr>
   <tr>
     <td>질문</td>
     <td><input type="text" name="fnq_title" size="50" value="<%=fdto.getFnq_title()%>"></td>
   </tr>
   <tr>
    <td> 질문유형 </td>
    <td> 
      <select name="fnq_type" checked="<%=fdto.getFnq_type()%>">
        <option value="인증 및 사용"> 인증 및 사용</option>
        <option value="결제"> 결제 </option>
        <option value="회원"> 회원 </option>
        <option value="사이트이용">사이트 이용 </option>
      </select>
    </td>
   </tr>
   <tr>
     <td>상세질문</td>
     <td> <textarea cols="100" rows="10" name="fnq_q" ><%=fdto.getFnq_q()%></textarea> </td>
   </tr>
   <tr>
     <td>답변내용</td>
     <td> <textarea cols="100" rows="10" name="fnq_a" ><%=fdto.getFnq_a()%></textarea> </td>
   </tr>
   <tr>
     <td>답변관련 이미지</td>
     <td><input type="file" name="fnq_img" value="<%=fdto.getFnq_img()%>"></td>
   </tr>
   <tr align="center">
     <td colspan="3"><input type="submit" value="faq수정" ></td>
   </tr>
  
  </table>
 </form>
		
<jsp:include page="../footer.jsp" />
</body> 
</html> 