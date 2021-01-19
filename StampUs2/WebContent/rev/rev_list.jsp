<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.*"%>
<%@ page import ="dao.RevDao" %>
<%@ page import ="dto.RevDto" %>
<%
   // list메소드를 포함한 클래스 객체를 생성
   RevDao rdao=new RevDao();
   ArrayList<RevDto> list=rdao.list();
   pageContext.setAttribute("list", list);
   String userid="";
   if(session.getAttribute("userid")!=null)
   {
      userid=session.getAttribute("userid").toString();
   }  
%>    
<jsp:include page="../header.jsp" />

<section id="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
	<div class="container">
		<div class="row">
			<div class="본인 파일의 이름으로 지정하세요(추후 css 적용위해)">
<!-- ========================================================================= -->	
			
<style>
td {
	border: 1px solid #cccccc;
}

td {
	border-left: none;
	border-right: none;
	border-bottom: none;
}

tr.top{
border-bottom:4px solid #000000;
font-size:17pt;
font-family:"HMKMRHD", sans-serif;
}
tr.mid{
border-bottom:1px solid #000000;
font-size:12pt;
font-family:"HMKMRHD", sans-serif;

}
</style>
<!-- ========================================================================= -->	

<title>협력업체목록</title>
<jsp:include page="../left_nav.jsp" />
	<img src="revimg/rev.png">
	<div align="center" class="center"> 
	</div>
	<p align="center">stampus를 편리하게 이용해보세요</p>
	<div align="center">
	<table width=100%  height="800" align="center">
		<tr align="center" class="top" height="100">
			<td>대표사진</td>
			<td>업체명</td>
			<td>홈페이지</td>
			<td>상세내용</td>
		</tr>
		<%
    // 출력
		    for(int i=0;i<list.size();i++)
		    {
 		%>	
		<tr align="center" class="mid" height="70"> 
			<td align="center"><img src="../img/rev/<%=list.get(i).getRev_img()%>" width="200"></td>
			<td align="center"><%=list.get(i).getRev_company()%></td>
			<td align="center"><%=list.get(i).getRev_addr()%></td>
			<td align="center"><a href="rev_content.jsp?rev_no=<%=list.get(i).getRev_no()%>">click!</a></td>
		</tr>
		<%
			}
		%>
		<tr>
		<%
		if(userid.equals("admin")){
		%>
			<td colspan="4" align="center">
			<a href="rev_write.jsp">글쓰기 </a>
			</td>
		<%
		}
		%>	
		</tr>
	</table>
<!-- ========================================================================= -->	
	
</div>			
			</div>
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />








