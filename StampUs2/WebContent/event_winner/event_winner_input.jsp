<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="dao.Event_winnerDAO"%>
<%@page import="dao.EventDAO"%>
<%@page import="dto.Event_winnerDTO"%>
<%	
		EventDAO edao=new EventDAO();
		Event_winnerDAO dao=new Event_winnerDAO();
		Event_winnerDTO dto = new Event_winnerDTO();

		for(int i=64; i<184; i++){
			String adm = "관리자"+i;
			int event_no = i;
			String event_title = edao.getEvent_title(event_no);
			String title = "당첨자발표"+i;
			String winnerid = "당첨자"+i;
			String content = winnerid+"님,"+event_title+" 이벤트에 당첨을 축하합니다! ";
			
			dto.setEvent_no(event_no);
			dto.setEvent_winner_adm(adm);
			dto.setEvent_winner_title(title);
			dto.setEvent_winnerid(winnerid);
			dto.setEvent_winner_content(content);
	
			dao.write_ok(dto);
	}
%>