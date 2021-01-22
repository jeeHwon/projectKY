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
//페이저 설정 => 현재 나타내고자 하는 페이지 값을 저장
int pager=(request.getParameter("pager")==null) ? 1 : Integer.parseInt(request.getParameter("pager"));  
String cla=(request.getParameter("cla") == null) ? "" : request.getParameter("cla");
String sword=(request.getParameter("sword") == null) ? "" : request.getParameter("sword");

   // list메소드를 포함한 클래스 객체를 생성
   RevDao rdao=new RevDao();
   ArrayList<RevDto> list=rdao.list(cla,sword,pager);
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
	<table width=100%  height="900" align="center">
		<tr align="center" class="top" height="100">
			<td width="200">대표사진</td>
			<td>업체명</td>
			<td>홈페이지</td>
			<td>상세내용</td>
		</tr>
		<%
    // 출력
		    for(int i=0;i<list.size();i++)
		    {
 		%>	
		<tr align="center" class="mid" height="90"> 
			<td align="center"  width="50" ><img src="../img/rev/<%=list.get(i).getRev_img()%>" height="90"></td>
			<td align="center"><%=list.get(i).getRev_company()%></td>
			<td align="center"><%=list.get(i).getRev_addr()%></td>
			<td align="center"><a href="rev_content.jsp?rev_no=<%=list.get(i).getRev_no()%>">click!</a></td>
		</tr>
		<%
			}
		%>
				 <tr> <!-- 사용자가 클릭하여 이동할수 있는 페이지 출력 -->
		       <td colspan="5" align="center">
		       <%
		         // 총 페이지값을 구하기	총레코드수/페이지당레코드수
		         int content_cnt=rdao.content_cnt(cla, sword);		         
		       	 int page_cnt = content_cnt/10+1;		       	 
		       	 if(content_cnt==0)
		       		 page_cnt--;		       	   	 
		         int pstart; 
		         pstart=pager/10;
		         if(pager%10 ==0)
		        	 pstart=pstart-1;		         
		         pstart=Integer.parseInt(pstart+"1");
		         int pend=pstart+9;  // 251+9 => 260  총페이지:255
		         if(page_cnt < pend)
		        	 pend=page_cnt;
		         
		       %>
		       <!-- 이전페이지 -->
		       <!-- 현재페이지 그룹 이전 10페이지 -->
		       <%
		         if(pstart != 1)//(현재페이지에 출력되는 그룹이 가장 첫번쨰 그룹이냐=> pstart=1)
		         {
		       %>
		       <a href="rev_list.jsp?pager=<%=pstart-1%>&cla=<%=cla%>&sword=<%=sword%>">&lt;&lt;</a>
		       <%
		         }
		         else
		         {
		       %>
		       		&lt;&lt;
		       <%
		         }
		       %>
		       <!-- 현재페이지 기준 1페이지 이전 -->
		       <%
		         if(pager !=1)
		         {	 
		       %>
		       <a href="rev_list.jsp?pager=<%=pager-1%>&cla=<%=cla%>&sword=<%=sword%>">&lt;</a>
		       <%
		         }
		         else
		         {
		       %>                 
		          &lt;
		       <%
		         }
		         for(int i=pstart;i<=pend;i++)
		         {
		        	 String str="";
		        	 if(pager == i)
		        		 str="style='color:red;'";
		        	 
		       %>
		       	 <a href="rev_list.jsp?pager=<%=i%>&cla=<%=cla%>&sword=<%=sword%>" <%=str%>> <%=i%> </a>
		       <%
		         }	
		       %>
		       <!-- 다음페이지 -->
		       <!-- 현재페이지 기준 1페이지 이후 -->
		       <%
		         if(pager != page_cnt)
		         { 
		       %>
		       <a href="rev_list.jsp?pager=<%=pager+1%>&cla=<%=cla%>&sword=<%=sword%>">&gt;</a>
		       <%
		         }
		         else
		         {
		       %>
		          &gt;
		       <% 
		         }
		       %>
		       <!-- 현재페이지 기준 다음  10페이지 이후 -->
		       <%
		         if(page_cnt != pend)
		         {
		       %>
		         <a href="rev_list.jsp?pager=<%=pend+1%>&cla=<%=cla%>&sword=<%=sword%>">&gt;&gt;</a>
		       <%
		         }
		         else
		         {
		       %>
		       		&gt;&gt;
		       <%
		         }
		       %>  	      
		      </td>
		    </tr>
		<tr>
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








