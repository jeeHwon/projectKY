<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@	page import="java.util.ArrayList" %>
<%@	page import="dto.FboardDto" %>
<%@	page import="dao.FboardDao" %>

<%
	session.getAttribute("userid");
%>

<%
	String userid = (String)session.getAttribute("userid");
	

	request.setCharacterEncoding("utf-8");
    FboardDto fdto = new FboardDto();
    FboardDao fdao = new FboardDao();
    String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
    String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String word = (request.getParameter("word") == null) ? "" : request.getParameter("word");
    ArrayList<FboardDto> list = fdao.list(cla, word, pager);
    
    
%>   
<jsp:include page="../header.jsp" />
<style>
	.fboard_list {
		width: 1100px;
	}
	table {
		width:1100px;
		border-top: 1px double #222;
		border-collapse: collapse;
	}
	tr {
		padding: 5px;

	}
	tr.page{
	font-size:17pt;
	height:100px;
	text-align:center;
	}
	
	tr.mid {
	border-bottom:1px solid #222;
	font-size:12pt;
	}
	.form{
		width:30%;
		padding:80px 0 15px 0;
		float:right;
		font-size:17pt;
	}
	h3{
		font-size: 30px;
	    font-weight: 500;
	    margin-top:70px;
	    float:left;
	}
	.top {
		font-size : 20px;
	}
	
	.button {
		margin-top:5px;
		float: center;
		font-size: 18px;
		width: 12%;
		height: 12%;
		border: 2px solid black;
		}

</style>
<section id="fboard_list">
	<div class="container">
		<div class="row">
		
<div class="fboard_list">
<h3>자유게시판</h3>
<table>
	<tr align="center" class="top" height="45">
		<td> 번호 </td>
		<td> 이름 </td>
		<td> 제목 </td>
		<td> 조회수 </td>
		<td> 등록일 </td>
	</tr>
<%
	for(int i = 0; i < list.size(); i++)
	{
%>
	<tr class="mid" height="45">
		<td align="center"><%=list.get(i).getId()%></td>
		<td align="center"><%=list.get(i).getUserid()%></td>
		<td align="center"><a href="board_readnum.jsp?id=<%=list.get(i).getId()%>&pager=<%=pager%>&cla=<%=cla%>&word=<%=word%>"><%=list.get(i).getTitle() %></a></td>
		<td align="center"><%=list.get(i).getReadnum()%></td>
		<td align="center"><%=list.get(i).getWriteday()%></td>
	</tr>
	
<%
	}
%>
<div class="form">
	<form name="searchFrm" method="post" action="board_list.jsp">
		<select name="cla">
			<option value="userid">이름</option>
			<option value="title">제목</option>
		</select>
		<input type="text" name="word" value="<%=word%>">
		<input type="submit" value="검색">
	</form>
</div>
		<!-- 사용자가 클릭하여 이동할 수 있는 페이지 출력 -->
		<tr class="page" height="50">
			<td colspan="1"></td>
			<td colspan="1"></td>
			<td colspan="1">
			<%
				//총 페이지 값을 구하기 => 총 레코드수/ 페이지당 레코드수
				int page_cnt = fdao.get_total_page_cnt();
				int pstart = fdao.get_page_start(pager);
				int pend =fdao.get_page_end(pager, page_cnt);
			
				if(page_cnt < pend){
					pend = page_cnt;
				}
			%>
			<!--10페이지 이전 페이지 이동  -->
			<%
			if(pstart != 1) { 
			%>
			<a href="board_list.jsp?pager=<%=pstart-1%>&pager=<%=pager%>&cla=<%=cla%>&word=<%=word%>">&#60;&#60;</a>
			<%
			} else{
			%>
				&#60;&#60;
			<%
			} 
			%>
			
			<!-- 1페이지 이전 페이지 이동-->
			<%
			if(Integer.parseInt(pager) != 1){ 
			%>
				<a href="board_list.jsp?pager=<%=Integer.parseInt(pager)-1%>&cla=<%=cla%>&word=<%=word%>">&#60;</a>
			<%
			} else{
			%>
				&#60;
			<%
			}
			%>
			
			<!-- pstart ~ pend 페이지출력 현재페이지는 색 변경 -->
			<%  
				for(int i= pstart; i<=pend; i++){
					String str = "";
					if(Integer.parseInt(pager) == i) 
						str="style='color:red;'";
			%>
				<a href="board_list.jsp?pager=<%=i%>&cla=<%=cla%>&word=<%=word%>" <%=str%>><%=i %></a>
			<%
			} 
			%>
			
			<!-- 1페이지 이후 페이지 이동-->
			<%
			if(Integer.parseInt(pager) != page_cnt){ 
			%>
				<a href="board_list.jsp?pager=<%=Integer.parseInt(pager)+1%>&cla=<%=cla%>&word=<%=word%>">&#62;</a>
			<%
			} else{
			%>
				&#62;
			<%
			} 
			%>
			
			<!--10페이지 이후 페이지 이동  -->
			<%
			if(pend != page_cnt){
			%>
				<a href="board_list.jsp?pager=<%=pend+1%>&cla=<%=cla%>&word=<%=word%>">&#62;&#62;</a>
			<%
			} else{
			%>
				&#62;&#62;
			<%
			} 
			%>
			</td>
			<td colspan="1" class="button">
				<a href="board_write.jsp">글쓰기</a></td>
			<td colspan="1" class="button">
				<a href="board_list.jsp">목록보기</a></td>
		</tr>
	</table>
</div>
</div>
</div>
</section>
<script>
	function init(){
		document.searchFrm.cla.value="<%=cla%>"
		if (document.searchFrm.cla.value==""){
		 	  document.searchFrm.cla.value="title"
		   }
	}
</script>
<jsp:include page="../footer.jsp" />
