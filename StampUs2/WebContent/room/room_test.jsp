<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="dao.RoomDAO" %>
<%@ page import="dto.RoomDTO" %>
<%
	RoomDAO rdao = new RoomDAO();
	ArrayList<RoomDTO> list = rdao.list();
	pageContext.setAttribute("list", list);

%>
<jsp:include page="../header.jsp" />


    
    <section id="roomList">
        <div class="container">
			<div class="row">
            <select id="r_start_day" name="r_start_day" class="ui_select">
				<c:forEach var="i" begin="2" end="8" step="1">
                 	<option value="${i}">${i}명</option>
				</c:forEach>
             </select>
			</div>
        </div>
    </section>
    


<jsp:include page="../footer.jsp" />