<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page import="dao.ReviewDAO" %>
<%@ page import="dto.ReviewDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 세션변수 만들기
	session.setAttribute("userid", "test");  // (변수명,값)
%>
<%
	//DB연결
	ReviewDAO rdao=new ReviewDAO();
	
    request.setCharacterEncoding("utf-8");
	//페이저 설정 => 현재 나타내고자 하는 페이지 값을 저장
    int pager=(request.getParameter("pager")==null) ? 1 : Integer.parseInt(request.getParameter("pager"));  
    String cla=(request.getParameter("cla") == null) ? "" : request.getParameter("cla");
    String sword=(request.getParameter("sword") == null) ? "" : request.getParameter("sword");
    
    ArrayList<ReviewDTO> list=rdao.list(cla,sword,pager);
    pageContext.setAttribute("list",list);
%>	
    
<!DOCTYPE html>
<html>
<head>
<title>후기 리스트</title>
  <script>
    function init()
    {
    	document.se.cla.value="<%=cla%>";
    }
  </script>
</head>
<body onload="init()">
<jsp:include page="../header.jsp" />
	<section id="review_list">
	  <div align="center">
        <!-- 필드와 검색단어를 입력할 폼태그 -->
	    <div align="center">
	     <form name="se" method="post" action="review_list.jsp">
	       <select name="cla">
	         <option value="user_id"> 작성자 </option>
	         <option value="review_title"> 제목 </option>
	         <option value="hash"> 해시태그 </option>
	       </select>
	       <input type="text" name="sword" value="<%=sword%>">
	       <input type="submit" value="검색">
	     </form>
	    </div>
		  <table width="800" align="center">
		    <tr>
		      <td width="10%"> 글번호 </td>
		      <td width="10%"> 작성자 </td>
		      <td width="50%"> 제목 </td>
		      <td width="10%"> 조회수 </td>
		      <td width="20%"> 작성일 </td>   
		    </tr>
		    <c:forEach items="${list}" var="rdto">
		      <tr>
		        <td> ${rdto.review_no} </td>
		        <td> ${rdto.user_id} </td>
		        <td> <a href="review_view.jsp?review_no=${rdto.review_no}&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>"> ${rdto.review_title} </a> </td>
		        <td> ${rdto.review_view} </td>
		        <td> ${rdto.review_postday} </td>
		      </tr>
		    </c:forEach>
		    <tr> <!-- 사용자가 클릭하여 이동할수 있는 페이지 출력 -->
		       <td colspan="5">
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
		       <a href="review_list.jsp?pager=<%=pstart-1%>&cla=<%=cla%>&sword=<%=sword%>">◀◀</a>
		       <%
		         }
		         else
		         {
		       %>
		       		◀◀
		       <%
		         }
		       %>
		       <!-- 현재페이지 기준 1페이지 이전 -->
		       <%
		         if(pager !=1)
		         {	 
		       %>
		       <a href="review_list.jsp?pager=<%=pager-1%>&cla=<%=cla%>&sword=<%=sword%>">◀</a>
		       <%
		         }
		         else
		         {
		       %>                 
		                      ◀
		       <%
		         }
		         for(int i=pstart;i<=pend;i++)
		         {
		        	 String str="";
		        	 if(pager == i)
		        		 str="style='color:red;'";
		        	 
		       %>
		       	 <a href="review_list.jsp?pager=<%=i%>&cla=<%=cla%>&sword=<%=sword%>" <%=str%>> <%=i%> </a>
		       <%
		         }	
		       %>
		       <!-- 다음페이지 -->
		       <!-- 현재페이지 기준 1페이지 이후 -->
		       <%
		         if(pager != page_cnt)
		         { 
		       %>
		       <a href="review_list.jsp?pager=<%=pager+1%>&cla=<%=cla%>&sword=<%=sword%>">▶</a>
		       <%
		         }
		         else
		         {
		       %>
		                         ▶
		       <% 
		         }
		       %>
		       <!-- 현재페이지 기준 다음  10페이지 이후 -->
		       <%
		         if(page_cnt != pend)
		         {
		       %>
		         <a href="review_list.jsp?pager=<%=pend+1%>&cla=<%=cla%>&sword=<%=sword%>">▶▶</a>
		       <%
		         }
		         else
		         {
		       %>
		       		▶▶
		       <%
		         }
		       %>  	      
		      </td>
		    </tr>
		    <tr>
		      <td colspan="5" align="center"> <a href="review_write.jsp"> 글쓰기 </a> </td>
		    </tr>
		  </table>
	  </div>	    
	</section>
<jsp:include page="../footer.jsp" />   
</body>
</html>
<%
	rdao.conn_close();
%>