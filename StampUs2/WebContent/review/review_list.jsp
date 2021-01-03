<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 세션변수 만들기
	session.setAttribute("userid", "channy");  // (변수명,값)
%>
<%
	//DB연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Connection conn = DriverManager.getConnection(url, uid, upw);
    
    request.setCharacterEncoding("utf-8");
    // limit에 들어갈 index번호 생성
    int index;  // limit에 전달할 index값
    int pager;  // 현재 나타내고자 하는 페이지 값을 저장
    if(request.getParameter("pager")==null)
    {
    	pager=1;
    }
    else
    {
    	pager=Integer.parseInt(request.getParameter("pager"));
    }
    // index 만들기
    index=(pager-1)*10;
    // 아무거나 => 검색조건이 없다..
    // 검색필드와 검색단어의 값을 request합니다..
    String sql="";
    String addsql="";
    String cla="";
    String sword="";
    if(request.getParameter("cla")==null)
    {
    	sql="SELECT review_no,review_title,review_view,review_postday,user_id ";
        sql=sql+" FROM(SELECT ROWNUM AS RM, review_no,review_title,review_view,review_postday,user_id ";
        sql=sql+" FROM(SELECT * FROM review ORDER BY review_no DESC)";
        sql=sql+") WHERE RM between "+index+" and " +(index+10);
    }
    else
    {
       cla=request.getParameter("cla");  // 검색필드 => user_id, review_title
       sword=request.getParameter("sword"); // 검색단어
       if(cla.equals("user_id"))
       {
    // user_id 필드를 검색
    	sql="SELECT review_no,review_title,review_view,review_postday,user_id ";
        sql=sql+" FROM(SELECT ROWNUM AS RM, review_no,review_title,review_view,review_postday,user_id ";
        sql=sql+" FROM(SELECT * FROM review where user_id like '%"+sword+"%' ORDER BY review_no DESC)";
        sql=sql+") WHERE RM between "+index+" and "+(index+10);
        
        addsql="where user_id like '%"+sword+"%'";
       }
       else
       {
    // review_title 필드를 검색
    	sql="SELECT review_no,review_title,review_view,review_postday,user_id ";
        sql=sql+" FROM(SELECT ROWNUM AS RM, review_no,review_title,review_view,review_postday,user_id ";
        sql=sql+" FROM(SELECT * FROM review where review_title like '%"+sword+"%' ORDER BY review_no DESC)";
        sql=sql+") WHERE RM between "+index+" and "+(index+10);
        
        addsql="where review_title like '%"+sword+"%'";
       }
    }
     
    // 심부름꾼생성
    Statement stmt=conn.createStatement();
    // 쿼리 실행 => ResultSet
    ResultSet rs=stmt.executeQuery(sql);
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
        <!-- 필드와 검색단어를 입력할 폼태그 -->
	    <div align="center">
	     <form name="se" method="post" action="review_list.jsp">
	       <select name="cla">
	         <option value="user_id"> 작성자 </option>
	         <option value="review_title"> 제목 </option>
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
		    <%
		    while(rs.next())
		    {
		    %>
		    <tr>
		      <td> <%=rs.getString("review_no")%> </td>
		      <td> <%=rs.getString("user_id")%> </td>
		      <td> <a href="review_view.jsp?review_no=<%=rs.getInt("review_no")%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>"> <%=rs.getString("review_title")%> </a> </td>
		      <td> <%=rs.getString("review_view")%> </td>
		      <td> <%=rs.getString("review_postday")%> </td>
		    </tr>
		    <%
		    }
		    %>
		    <tr> <!-- 사용자가 클릭하여 이동할수 있는 페이지 출력 -->
       <td colspan="5">
       <%
         // 총 페이지값을 구하기	총레코드수/페이지당레코드수
         sql="select count(*) as cnt from review "+addsql;
       	 ResultSet rs2 = stmt.executeQuery(sql);
       	 rs2.next();
       	 int page_cnt = rs2.getInt("cnt")/10+1;
       	 
       	 if(rs2.getInt("cnt")==0)
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
	</section>
<jsp:include page="../footer.jsp" />   
</body>
</html>
<%
	rs.close();
	stmt.close();
	conn.close();
%>