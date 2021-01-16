<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page import="dao.FnqlistDao"%>
<%@ page import="dto.FnqDto"%>
<%
   // list메소드를 포함한 클래스 객체를 생성
   FnqlistDao fdao=new FnqlistDao ();
   ArrayList<FnqDto> list0=fdao.list0();
   pageContext.setAttribute("list", list0);
   
   ArrayList<FnqDto> list1=fdao.list1();
   pageContext.setAttribute("list", list1);
   
   ArrayList<FnqDto> list2=fdao.list2();
   pageContext.setAttribute("list", list2);
   
   ArrayList<FnqDto> list3=fdao.list3();
   pageContext.setAttribute("list", list3);
   
   ArrayList<FnqDto> list4=fdao.list4();
   pageContext.setAttribute("list", list4);
   
   
   String userid="";
   if(session.getAttribute("userid")!=null)
   {
      userid=session.getAttribute("userid").toString();
   }  
%>  

<jsp:include page="../header.jsp" />

<section id="fnq_list">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
<!-- ========================================================================= -->	
			
<style>
.fnq_list table {
	width: 70%;
	border-top: 0px;
	border-collapse: collapse;
}

.fnq_list th, td {
	border-bottom: 2px solid #444444;
	padding: 10px;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
	function change(style) {

		if (style == "전체") {
			all.style.display = "inline"
			view1.style.display = "none"
			view2.style.display = "none"
			view3.style.display = "none"
			view4.style.display = "none"
			all0.style.display = "none"
		}
		if (style == "인증 및 사용") {
			all.style.display = "none"
			view1.style.display = "inline"
			view2.style.display = "none"
			view3.style.display = "none"
			view4.style.display = "none"
				all0.style.display = "none"

		}
		if (style == "결제") {
			all.style.display = "none"
			view1.style.display = "none"
			view2.style.display = "inline"
			view3.style.display = "none"
			view4.style.display = "none"
				all0.style.display = "none"

		}
		if (style == "회원") {
			all.style.display = "none"
			view1.style.display = "none"
			view2.style.display = "none"
			view3.style.display = "inline"
			view4.style.display = "none"
				all0.style.display = "none"

		}

		if (style == "사이트이용") {
			all.style.display = "none"
			view1.style.display = "none"
			view2.style.display = "none"
			view3.style.display = "none"
			view4.style.display = "inline"
				all0.style.display = "none"

		}
	}
</SCRIPT>
<!-- ========================================================================= -->	

<span align="center"> <h3><a href="../customer/center.jsp">고객센터></a></h3><h1><a href="fnq_list.jsp">FQA</a></h1></span>
<h3 align="center">stampus를 편리하게 이용해보세요</h3>
<div>
<table align="center"   padding="0" cellspacing="0" >
	<tr align="center">
		<td>유형 <select
			onChange="change(this.options[this.selectedIndex].value)">
				<option>:::선택하세요:::</option>
				<option value="전체">전체</option>
				<option value="인증 및 사용">인증 및 사용</option>
				<option value="결제">결제</option>
				<option value="회원">회원</option>
				<option value="사이트이용">사이트이용</option>
		</select>
		</td>
		<td><h4>질문</h4></td>
		<td>자세히보기</td>
	</tr>
	</table>
	<table id=all0 align="center" >
			<%
    // 출력
		    for(int i=0;i<list0.size();i++)
		    {
 		%>
 		<tr>
			<td align="center" ><%=list0.get(i).getFnq_type()%></td>
			<td align="center" ><%=list0.get(i).getFnq_title()%></td>
			<td align="center"><a href="fnq_content.jsp?fnq_no=<%=list0.get(i).getFnq_no()%>">답변보기!</a></td>	
		<tr>
		<%
			}
		%>
	</table>
<!-- ========================================================================= -->	
<!-- ========================================================================= -->		
</div>
<div align="center" >
	<table id=all style="display: none;" align="center">
			<%
    // 출력
		    for(int i=0;i<list0.size();i++)
		    {
 		%>
 		<tr >
			<td align="center" width="200" align="right"> <%=list0.get(i).getFnq_type()%></td>
			<td align="center" width="1000"><%=list0.get(i).getFnq_title()%></td>
			<td align="center"><a href="fnq_content.jsp?fnq_no=<%=list0.get(i).getFnq_no()%>">답변보기!</a></td>	
		<tr>
		<%
			}
		%>
	</table>
<!-- ========================================================================= -->		
	<table id=view1 style="display: none;" align="center" >
		<%
		    for(int i=0;i<list1.size();i++)
		    {
 		%>
 		<tr>
			<td align="center" width="200" align="right"><%=list1.get(i).getFnq_type()%></td>
			<td align="center" width="1000"><%=list1.get(i).getFnq_title()%></td>
			<td align="center"><a href="fnq_content.jsp?fnq_no=<%=list1.get(i).getFnq_no()%>">답변보기!</a></td>	
		<td>
		<%
			}
		%>
	</table>
<!-- ========================================================================= -->		
	<table id=view2 style="display: none;" align="center" class="it">
		<% 
		    for(int i=0;i<list2.size();i++)
		    {
 		%><tr>
			<td align="center" width="200" align="right"><%=list2.get(i).getFnq_type()%></td>
			<td align="center" width="1000"><%=list2.get(i).getFnq_title()%></td>
			<td align="center"><a href="fnq_content.jsp?fnq_no=<%=list2.get(i).getFnq_no()%>">답변보기!</a></td>	
			</tr>
		<%
			}
		%>
	</table>
<!-- ========================================================================= -->		
	<table id=view3 style="display: none;" align="center" class="it">
		<%
		    for(int i=0;i<list3.size();i++)
		    {
 		%>
 		<tr>
			<td align="center" width="200" align="right"><%=list3.get(i).getFnq_type()%></td>
			<td align="center" width="1000"><%=list3.get(i).getFnq_title()%></td>
			<td align="center"><a href="fnq_content.jsp?fnq_no=<%=list3.get(i).getFnq_no()%>">답변보기!</a></td>	
		</tr>
		<%
			}
		%>
	</table>
<!-- ========================================================================= -->		
	<table id=view4 style="display: none;" align="center" >
		<%
		    for(int i=0;i<list4.size();i++)
		    {
 		%>
 		<tr>
			<td align="center" width="200" align="right"><%=list4.get(i).getFnq_type()%></td>
			<td align="center" width="1000"><%=list4.get(i).getFnq_title()%></td>
			<td align="center"><a href="fnq_content.jsp?fnq_no=<%=list4.get(i).getFnq_no()%>">답변보기!</a></td>	
		</tr>
		<%
			}
		%>
	
</table>
	<table>
	<tr>
		<%
		if(userid.equals("admin")){
		%>
			<td colspan="3" align="center">
			<a href="fnq_write.jsp">글올리기 </a>
			</td>
		<%
		}
		%>	
		</tr>
	</table>
</div>	
<!-- ========================================================================= -->	

			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />
