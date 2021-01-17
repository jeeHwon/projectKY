package dao;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;

import db.DB;
import dto.GoalDTO;
import dto.Study_my_DTO;
import dto.User_join_DTO;

public class Study_my_DAO 
{
	DB db = new DB();
	
	
	public Study_my_DAO()
	{
		db = new DB();
	}
	

	public void insert(Study_my_DTO sDTO) throws Exception 
	{
		String sql = "insert into study_my values(study_my_seq.nextval, ?, ?, ?, ?, sysdate, ?)";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, sDTO.getUser_id());
		db.pstmt.setString(2, sDTO.getStudy_title());
		db.pstmt.setString(3, sDTO.getStudy_content());
		db.pstmt.setString(4, sDTO.getStudy_img());
		db.pstmt.setInt(5, sDTO.getStudy_no());
		
		db.pstmt.executeUpdate();
		
		GoalDAO gDAO=new GoalDAO();
		gDAO.insertGoal(sDTO);
		
		db.close();
		
	}
	
	public ArrayList<Study_my_DTO> list(int study_no) throws Exception
	{
		String sql="select * from study_my where study_no="+study_no+" order by study_my_no desc";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<Study_my_DTO> list = new ArrayList<Study_my_DTO>();
		
		while(db.rs.next()) 
		{
			Study_my_DTO sDTO = new Study_my_DTO();
			sDTO.setStudy_content(db.rs.getString("study_content"));
			sDTO.setStudy_day(db.rs.getString("study_day"));
			sDTO.setStudy_img(db.rs.getString("study_img"));
			sDTO.setStudy_my_no(db.rs.getInt("study_my_no"));
			sDTO.setStudy_no(db.rs.getInt("study_no"));
			sDTO.setStudy_title(db.rs.getString("study_title"));
			sDTO.setUser_id(db.rs.getString("user_id"));
			
			list.add(sDTO);
		}
		
		db.close();
		
		return list;
	}
	
	public Study_my_DTO content(String study_my_no) throws Exception
	{
		String sql = "select * from study_my where study_my_no="+study_my_no;
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		db.rs.next();
		
		Study_my_DTO sDTO = new Study_my_DTO();
		
		sDTO.setStudy_content(db.rs.getString("study_content"));
		sDTO.setStudy_day(db.rs.getString("study_day"));
		sDTO.setStudy_img(db.rs.getString("study_img"));
		sDTO.setStudy_my_no(db.rs.getInt("study_my_no"));
		sDTO.setStudy_no(db.rs.getInt("study_no"));
		sDTO.setStudy_title(db.rs.getString("study_title"));
		sDTO.setUser_id(db.rs.getString("user_id"));
		
		db.close();
		
		return sDTO;
	}
	
	//인증 글씨가 들어갔는지 검사하고 DTO 반환
	public Study_my_DTO containsCert(int study_my_no) throws Exception
	{
		System.out.println(study_my_no);
		
		String sql = "select * from study_my where (study_title like '%인증%' or study_content like '%인증%') and study_my_no="+study_my_no;
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		Study_my_DTO sDTO = new Study_my_DTO();
		
		if(db.rs.next()) 
		{
						
			sDTO.setStudy_content(db.rs.getString("study_content"));
			sDTO.setStudy_day(db.rs.getString("study_day"));
			sDTO.setStudy_img(db.rs.getString("study_img"));
			sDTO.setStudy_my_no(db.rs.getInt("study_my_no"));
			sDTO.setStudy_no(db.rs.getInt("study_no"));
			sDTO.setStudy_title(db.rs.getString("study_title"));
			sDTO.setUser_id(db.rs.getString("user_id"));
			
		}
		
		db.close();
				
		return sDTO;
	}
	
	public void update(Study_my_DTO sDTO) throws Exception 
	{
		String sql = "update study_my set study_title=?, study_content=?, study_img=? where study_my_no=?";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		if(sDTO.getStudy_img()==null) {
			sDTO.setStudy_img("");
		}
		
		db.pstmt.setString(1, sDTO.getStudy_title());
		db.pstmt.setString(2, sDTO.getStudy_content());
		db.pstmt.setString(3, sDTO.getStudy_img());
		db.pstmt.setInt(4, sDTO.getStudy_my_no());
		db.pstmt.executeUpdate();
		
		GoalDAO gDAO=new GoalDAO();
		gDAO.updateGoal(sDTO.getStudy_my_no());
		
		db.close();
		
	}
	
	public void delete(String study_my_no) throws Exception
	{
		String sql = "delete from study_my where study_my_no="+study_my_no;
		
		db.stmt = db.conn.createStatement();
		db.stmt.executeUpdate(sql);
		
		GoalDAO gDAO=new GoalDAO();
		gDAO.deleteGoal(study_my_no);
		
		db.close();
		
	}
	
	//오늘의 인증 처리
	public ArrayList<GoalDTO> goalList(String study_no) throws Exception
	{
		User_join_DAO ujDAO = new User_join_DAO();
		
		ArrayList<User_join_DTO> ujList = new ArrayList<User_join_DTO>();
		
		ujList = ujDAO.list(study_no);
		
		ArrayList<GoalDTO> gList = new ArrayList<GoalDTO>();
		
		GoalDAO gDAO = new GoalDAO();
		gList = gDAO.roomDayGoal(study_no);
	
		ArrayList<String> user1 = new ArrayList<String>();
		
		for(int i=0;i<ujList.size();i++) 
		{
			user1.add(ujList.get(i).getUser_id());
		}
		
		ArrayList<String> user2 = new ArrayList<String>();
		
		for(int i=0;i<gList.size();i++) 
		{
			user2.add(gList.get(i).getUser_id());
		}
		
		user1.removeAll(user2);
		
		for(int i=0;i<user1.size();i++) 
		{
			GoalDTO gDTO = new GoalDTO();
			gDTO.setUser_id(user1.get(i));
			gDTO.setIsgoal("미인증");
			gList.add(gDTO);
		}
		
		return gList;
	}
	
	// 오늘의 인증 현황
	public ArrayList<GoalDTO> isCertDay(String study_no) throws Exception 
	{
		String sql = "select room_check_day from room where room_no="+study_no;
		db.stmt=db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		db.rs.next();
		
		String room_check_day = db.rs.getString("room_check_day"); 
		
		GoalDAO gDAO = new GoalDAO();
		
		String day = gDAO.getDateDay();
		
		db.close();
		
		if(room_check_day.contains(day)) 
		{
			return goalList(study_no);
		}
		else 
		{
			return isHoliday(study_no);
		}
		
		
		
	}
	
	//쉬는 날 처리
	public ArrayList<GoalDTO> isHoliday(String study_no) throws Exception
	{
		User_join_DAO ujDAO = new User_join_DAO();
		
		ArrayList<User_join_DTO> ujList = new ArrayList<User_join_DTO>();
		
		ujList = ujDAO.list(study_no);
		
		ArrayList<GoalDTO> gList = new ArrayList<GoalDTO>();
		
		ArrayList<String> user1 = new ArrayList<String>();
		
		for(int i=0;i<ujList.size();i++) 
		{
			user1.add(ujList.get(i).getUser_id());
		}
		
		for(int i=0;i<user1.size();i++) 
		{
			GoalDTO gDTO = new GoalDTO();
			gDTO.setUser_id(user1.get(i));
			gDTO.setIsgoal("쉬는 날");
			gList.add(gDTO);
		}
		
		return gList;
	}
	
	//특정 쉬는 날 처리
	public GoalDTO isHoliday(String study_no, String goal_day, String user_id) throws Exception
	{
		GoalDTO gDTO = new GoalDTO();
	
		gDTO.setUser_id(user_id);
		gDTO.setGoal_day(goal_day);
		gDTO.setIsgoal("쉬는 날");
		
		System.out.println(user_id+"/"+goal_day+"쉬는 날 처리");
		return gDTO;
	}
	
	//특정 날 인증
	public GoalDTO goalList(String study_no, String goal_day, String user_id) throws Exception
	{
		GoalDTO gDTO = new GoalDTO();
		GoalDAO gDAO = new GoalDAO();
		
		gDTO = gDAO.roomDayGoal(study_no, goal_day, user_id);

		if(gDTO.getIsgoal()==null) 
		{
			gDTO.setUser_id(user_id);
			gDTO.setIsgoal("미인증");
			gDTO.setGoal_day(goal_day);
		}
		
		System.out.println(user_id+" "+gDTO.getIsgoal()+goal_day);
		return gDTO;
	}
	
	// 특정날의 인증 현황
	public ArrayList<GoalDTO> allCertDay(String study_no, String goal_day, String user_id, DayOfWeek dow) throws Exception 
	{
		String sql = "select room_check_day from room where room_no="+study_no;
		db.stmt=db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		db.rs.next();
		
		String room_check_day = db.rs.getString("room_check_day"); 
		
		GoalDAO gDAO = new GoalDAO();
		
		String day = gDAO.getDay(dow);
		
		ArrayList<GoalDTO> list = new ArrayList<GoalDTO>();
		
		if(room_check_day.contains(day)) 
		{
			list.add(goalList(study_no, goal_day, user_id));
			return list;
		}
		else 
		{
			list.add(isHoliday(study_no, goal_day, user_id));
			return list;
		}
		
	}
	
	public ArrayList<GoalDTO> allGoalList(String study_no) throws Exception
	{
		ArrayList<GoalDTO> list = new ArrayList<GoalDTO>();
		
		ArrayList<User_join_DTO> ujList=new ArrayList<User_join_DTO>();
		
		User_join_DAO ujDAO = new User_join_DAO();
		
		ujList = ujDAO.listByStudy(study_no);
	
		for(int i=0;i<ujList.size();i++) {
		
			String day = ujList.get(i).getJoin_day();
			String user_id = ujList.get(i).getUser_id();
			String[] ymd = day.split("-");
			int y = Integer.parseInt(ymd[0]);
			int m = Integer.parseInt(ymd[1]);
			int d = Integer.parseInt(ymd[2]);
			
			LocalDate join_day = LocalDate.of(y, m, d);
			LocalDate today = LocalDate.now();
				
			while(!(join_day.equals(today))) 
			{
				ArrayList<GoalDTO> glist=new ArrayList<GoalDTO>();
				
				DayOfWeek dow = join_day.getDayOfWeek();
								
				glist = allCertDay(study_no, join_day.toString(), user_id, dow);

				list.addAll(glist);
				
				join_day=join_day.plusDays(1);
							
			}
		}
		return list;
	}
	
}
