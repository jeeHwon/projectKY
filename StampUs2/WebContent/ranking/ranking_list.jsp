<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<%

	String user_id = session.getAttribute("userid").toString();

	RankingDAO rDAO = new RankingDAO();
	ArrayList<RankingDTO> ulist = rDAO.userRoomRate(user_id);
	
	rDAO = new RankingDAO();
	double urate=rDAO.userRate(user_id);
	
	rDAO = new RankingDAO();
	ArrayList<RankingDTO> rlist = rDAO.roomRanking();
	
	rDAO = new RankingDAO();
	ArrayList<RankingDTO> urlist = rDAO.userRanking();
	
	pageContext.setAttribute("ulist", ulist);
	pageContext.setAttribute("urate", urate);
	pageContext.setAttribute("rlist", rlist);
	pageContext.setAttribute("urlist", urlist);
	
 %>
<jsp:include page="../header.jsp" />
<style>

	.one {color:gold;}
	.two {color:silver;}
	.three {color:brown;}

	#roomContent .room_title {font-size: 36px; text-align: left; color: #000; padding:10px; margin:0px;}
    #roomContent .header{height:160px;}
    
    #roomContent .preview_btn {float:right; margin-top: 2%; text-align: center; width:50%;}
    #roomContent .preview_btn a {font-size: 18px; box-sizing: border-box; display: inline-block; padding: 10px 30px 12px 30px;}
    #roomContent .preview_btn a.white {background-color: #fff; margin-right: 1%; margin-left: 1%; color: #CB230C; border: 1px solid #CB230C;}
    #roomContent .preview_btn a.white:hover {background: #fff; border-color: #000; color: #000;}
    #roomContent .preview_btn a.red {background-color: #CB230C; margin-right: 1%; margin-left: 1%; color: #fff; border: 1px solid #E68D80;}
    #roomContent .preview_btn a.red:hover {background: #E68D80; border-color: #CB230C; color: #fff;}  
    	
	#flexContent {display: flex; flex-wrap: wrap; flex-direction: row;}
	    
    #roomContent .preview_left {background: #2c2f34;}
    #roomContent .preview_left {width: 20%; order:0; height: 800px; padding:20px; color:#fff}
    #roomContent .preview_left table { color:#fff}
    #roomContent .preview_left > div {text-align: left;}
    #roomContent .preview_left .rate {text-align: right;}
	#roomContent .preview_left h2{font-size:24px; font-weight: 500;}

	#roomContent #room_ranking {order:1; width:38%; height: 100%;}
	#roomContent #user_ranking {order:2; width:38%; height: 100%;}
	#roomContent .study_my_list { margin-left:2%; padding:20px; border:1px solid black; border-radius: 10px; height: 800px; margin-bottom: 20px;}
	#roomContent .study_my_list h2 {font-size:24px; padding: 20px; border-bottom: 1px solid black;}
	#roomContent .study_my_list h3 {font-size:18px; padding: 20px; border-bottom: 1px solid black;}
	
	.study_my_list table {font-size:18px; line-height: 50px; width:100%;}
	.study_my_list table td {padding:5px; border-bottom: 1px solid #222;}
	
</style>
<section id="roomContent">
	<div class="container">
		<div class="row">
			<div class="room_title">
				<strong>달성률/랭킹 보기</strong>
			</div>
			<div id="flexContent">
				<div class="preview_left">

					<h2>내 전체 달성률</h2>
					<div class="rate"><h2>${urate}%</h2></div>

					<h2>내 방별 달성률</h2>
					<table>
						<c:forEach var="dto" items="${ulist}">
							<tr>
								<td>${dto.room_title}</td>
								<td>${dto.rate}%</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="room_ranking">
					<div class="study_my_list">
						<h2>방별 인증 랭킹</h2>
						<table>
							<c:forEach var="dto" items="${rlist}">
								<tr class="border_bottom">
									<c:if test="${dto.rank==1}">
										<td>${dto.rank }<i class="fas fa-crown one fa-2x"></i></td>
									</c:if>
									<c:if test="${dto.rank==2}">
										<td>${dto.rank }<i class="fas fa-crown two fa-2x"></i></td>
									</c:if>
									<c:if test="${dto.rank==3}">
										<td>${dto.rank }<i class="fas fa-crown three fa-2x"></i></td>
									</c:if>
									<c:if test="${dto.rank>=4 }">
										<td>${dto.rank }</td>
									</c:if>
									<td>${dto.room_title }</td>
									<td>${dto.rate }%</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="user_ranking">
					<div class="study_my_list">
						<h2>회원별 인증 랭킹</h2>
						<table>
							<c:forEach var="dto" items="${urlist}">
								<tr class="border_bottom">
									<c:if test="${dto.rank==1}">
										<td>${dto.rank }<i class="fas fa-crown one fa-2x"></i></td>
									</c:if>
									<c:if test="${dto.rank==2}">
										<td>${dto.rank }<i class="fas fa-crown two fa-2x"></i></td>
									</c:if>
									<c:if test="${dto.rank==3}">
										<td>${dto.rank }<i class="fas fa-crown three fa-2x"></i></td>
									</c:if>
									<c:if test="${dto.rank>=4 }">
										<td>${dto.rank }</td>
									</c:if>
									<td>${dto.user_id }</td>
									<td>${dto.rate }%</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../footer.jsp" />
