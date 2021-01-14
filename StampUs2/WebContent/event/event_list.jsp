<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.EventDAO" %>
<%@page import="java.sql.*" %>
<%@page import="dto.EventDTO" %>
<%@page import="java.util.ArrayList" %>
<%
	String userid = (String)session.getAttribute("userid");

	request.setCharacterEncoding("utf-8");
	String pager= (request.getParameter("pager") == null) ? "1" : request.getParameter("pager");
	EventDTO eDTO = new EventDTO();
	EventDAO eDAO = new EventDAO();
    
    //==========검색============
	String cla = (request.getParameter("cla") == null) ? "" : request.getParameter("cla");
 	String sword = (request.getParameter("sword") == null) ? "" : request.getParameter("sword");
    ArrayList<EventDTO> list=eDAO.pageList(cla,sword,pager);
%>
<jsp:include page="../header.jsp" />
<style>
table {
	width: 90%;
	border-top: 1px double #444444;
	border-collapse: collapse;
}
tr {
	padding: 5px;
}
div.center{font-size:30pt;}
tr.top{
	border-bottom: 7px solid #000000;
	font-size:17pt;
}
tr.mid {
	border-bottom:1px solid #000000;
	font-size:12pt;
}
tr.bottom{
	font-size:17pt;
	
}
tr.page{
	font-size:17pt;
	height:100px;

}
.page>td>a{
	padding:7px;
}
.form{
	width:30%;
	padding-top:20px;
	padding-bottom:10px;
	float:right;
	font-size:17pt;
}
/* 이미지 슬라이더 */
.evemt_slider .container{
	width: 600px;
}
.event_slider input[id*="slide"]{
    display: none;
}
.event_slider .event_img_slider{
    max-width: 1200px;
    margin: 0 auto;
    overflow: hidden;
}
.event_slider .slidelist{
    white-space: nowrap;
    font-size: 0;
}
.event_slider .slidelist > li{
    display: inline-block;
    vertical-align: middle;
    width: 100%;
    transition: all.5s;
}
.event_slider .slidelist > li > a{
    display: block;
    position: relative;
}
.event_slider .slidelist > li > a img{
    width: 100%;
}
.event_slider .slidelist label{
    position: absolute;
    z-index: 10;
    top: 50%;
    transform: translateY(-50%);
    padding: 50px;
    cursor: pointer;
}
.event_slider .slidelist .left{
    left: 30px;
    background:url('./eventImg/left.png') center center 100% no-repeat;
}
.event_slider .slidelist .right{
    right: 30px;
    background:url('./eventImg/right.png') center center 100% no-repeat;
}
.event_slider [id="slide1"]:checked ~ .event_img_slider .slidelist > li {transform:translateX(0%);}
.event_slider [id="slide2"]:checked ~ .event_img_slider .slidelist > li {transform:translateX(-100%);}
.event_slider [id="slide3"]:checked ~ .event_img_slider .slidelist > li {transform:translateX(-200%);}
</style>
	<section id="event_slider">
		<div class="container">
			<div class="row">
		<!-- 이미지 슬라이더 -->
				   <div class="event_slider">
                    <input type="radio" name="slide" id="slide1" checked>
                    <input type="radio" name="slide" id="slide2">
                    <input type="radio" name="slide" id="slide3">
                    <div class="event_img_slider">
                        <ul class="slidelist">
                            <li>
                           		<label for="slide3" class="left"><img src="eventImg/left.png"></label>
                                <a href="#"><img src="eventImg/event_img1.jpg" alt="이벤트" class="event_img"></a>
                                <label for="slide2" class="right"><img src="eventImg/right.png"></label>
                            </li>   
                            <li>
                                <label for="slide1" class="left"><img src="eventImg/left.png"></label>
                                <a href="#"><img src="eventImg/event_img2.png" alt="이벤트" class="event_img"></a>
                                <label for="slide3" class="right"><img src="eventImg/right.png"></label>
                            </li>   
                            <li>
                                <label for="slide2" class="left"><img src="eventImg/left.png"></label>
                                <a href="#"><img src="eventImg/event_img3.jpg" alt="이벤트" class="event_img"></a>
                                <label for="slide1" class="right"><img src="eventImg/right.png"></label>
                            </li>   
                        </ul>    
                    </div>
                </div>
			</div>
		</div>
	</section>
		<!-- 필드와 검색단어를 입력할 폼태그 -->
	<section id="event_list">
		<div class="container">
			<div class="row">
				<div class="form">
			      <form name="eventSearchFrm" action="event_list.jsp">
			         <select name="cla">
			            <option value="title">제목</option>         
			            <option value="content">내용</option>         
			         </select>
			         <input type="text" name="sword" value="<%=sword%>">      
			         <input type="submit" value="검색">      
			      </form>
		      </div>
				   <table>
				   <tr align="center" class="top" height="50">
				      <td>글번호</td>
				      <td>제목</td>
				      <td>작성일</td>
				      <td>조회수</td>
				   </tr>
				<%for(int i=0; i<list.size(); i++){ %>
				   <tr class="mid" height="50">
				      <td align="center"><%=list.get(i).getEvent_no()%></td>
				      <td align="center"><a href="event_getView.jsp?event_no=<%=list.get(i).getEvent_no()%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>"><%=list.get(i).getEvent_title()%></a></td>
				      <td align="center"><%=list.get(i).getEvent_postday()%></td>
				      <td align="center"><%=list.get(i).getEvent_view()%></td>
				   </tr>
				<% }%>
				<c:if test="${userid eq 'admin'}">
				   <tr class="bottom" height="50">
				      <td colspan="4" align="center" id=""><a href="event_write.jsp">글쓰기</a>
				      </td>
				   </tr>
				</c:if>
				   <tr class="page" height="50">
				      <td colspan="4" align="center">
				      <%
				         // 총 페이지값을 구하기  
				          int page_cnt=eDAO.getTotalPage();
				          int pstart=eDAO.getPstart(page_cnt,pager);
				          int pend=eDAO.getPend(page_cnt,pstart); 
				      %>
				        <!-- 이전페이지 -->
				        <!-- 현재 페이지 그룹 이전 10페이지 -->
				        <% if(pstart != 1){//(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이냐 => pstart=1)  %>
				         <a href="event_list.jsp?pager=<%=pstart-1%>&cla=<%=cla%>&sword=<%=sword%>"> ◀◀ </a>
				        <% }else{ %>  	  ◀◀	 	<% }%>
				        <!-- 현재페이지 기준 1페이지 이전 -->
				       <% if(Integer.parseInt(pager) != 1){ %> 
				        <a href="event_list.jsp?pager=<%=Integer.parseInt(pager)-1%>&cla=<%=cla%>&sword=<%=sword%>">◀  </a>
				       <% }else { %>   ◀
				       <% } for(int i=pstart;i<=pend;i++){
				             String str="";
				            if(Integer.parseInt(pager) == i)
				               str="style='color:red;'";  %>   
				         <a href="event_list.jsp?pager=<%=i%>&cla=<%=cla%>&sword=<%=sword%>" <%=str%>> <%=i%> </a> <!-- 페이지네이션 -->
				       <% }%>
				       <!-- 다음페이지 -->
				       <!-- 현재페이지 기준 1페이지 이후 -->
				       <% if(Integer.parseInt(pager) != page_cnt){%>
				      <a href="event_list.jsp?pager=<%=Integer.parseInt(pager)+1%>&cla=<%=cla%>&sword=<%=sword%>"> ▶ </a>
				      <%}else{ %>   	  ▶   	 	 <% }%>
				      <!-- 현재페이지 기준 다음 그룹으로 이동 -->
				      <%if(page_cnt != pend){%>
				        <a href="event_list.jsp?pager=<%=pend+1%>&cla=<%=cla%>&sword=<%=sword%>"> ▶▶  </a>
				      <% }else{ %>		   ▶▶  		 <%} %>
				      </td>
				   </tr>
				</table>
			</div>
		</div>
	</section>
<script>
function init(){
   document.eventSearchFrm.cla.value="<%=cla%>"
   if (document.eventSearchFrm.cla.value==""){
 	  document.eventSearchFrm.cla.value="title"
   }
}
init();
</script>
<jsp:include page="../footer.jsp" />