package dao;

import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.Calendar;

import db.DB;
import dto.GoalDTO;
import dto.Study_my_DTO;

public class GoalDAO {

	DB db = new DB();
	
	public GoalDAO() 
	{
		db = new DB();
	}
	
	public String getDay(DayOfWeek dow) 
	{
		String day="";
		
		switch(dow.toString()){
        case "SUNDAY":
            day = "sun";
            break ;
        case "MONDAY":
            day = "mon";
            break ;
        case "TUESDAY":
            day = "tue";
            break ;
        case "WEDNESDAY":
            day = "wed";
            break ;
        case "THURSDAY":
            day = "thu";
            break ;
        case "FRIDAY":
            day = "fri";
            break ;
        case "SATURDAY":
            day = "sat";
            break ;
             
    }
		
		return day;
	}
	
	public String getDateDay() throws Exception 
	{

	    String day = "";
	     
	    Calendar cal = Calendar.getInstance();
	     
	    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;

	    switch(dayNum){
	        case 1:
	            day = "sun";
	            break ;
	        case 2:
	            day = "mon";
	            break ;
	        case 3:
	            day = "tue";
	            break ;
	        case 4:
	            day = "wed";
	            break ;
	        case 5:
	            day = "thu";
	            break ;
	        case 6:
	            day = "fri";
	            break ;
	        case 7:
	            day = "sat";
	            break ;
	             
	    }
	     
	    return day ;
	}

	public void insertGoal(Study_my_DTO sDTO) throws Exception
	{
		String sql = "select room_check_day from room where room_no="+sDTO.getStudy_no();
		db.stmt=db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		db.rs.next();
		
		String room_check_day = db.rs.getString("room_check_day"); 
		
		String day = getDateDay();
		
		System.out.println(day);
		
		if(room_check_day.contains(day)) 
		{
			if(sDTO.getStudy_img()!=null) 
			{
				sql = "select * from goal where to_char(goal_day, 'yyyymmdd')=to_char(sysdate, 'yyyymmdd') and user_id='"+sDTO.getUser_id()+"' and goal_room_no="+sDTO.getStudy_no();
				db.stmt=db.conn.createStatement();
				db.rs = db.stmt.executeQuery(sql);
				
				if(!db.rs.next()) {
				
					sql = "select * from (" + 
							"select * from study_my " + 
							"order by study_my_no desc" + 
							") "+ 
							"WHERE ROWNUM= 1";
					
					db.stmt=db.conn.createStatement();
					db.rs = db.stmt.executeQuery(sql);
					
					db.rs.next();
					
					String title = db.rs.getString("study_title");
					String content = db.rs.getString("study_content");
					
					if(title.contains("인증")||content.contains("인증")) 
					{
						sql = "insert into goal values(goal_seq.nextval, ?, ?, ?, sysdate, ?)";
						
						db.pstmt=db.conn.prepareStatement(sql);
						db.pstmt.setString(1, sDTO.getUser_id());
						db.pstmt.setInt(2, sDTO.getStudy_no());
						db.pstmt.setString(3, "성공");
						db.pstmt.setInt(4, db.rs.getInt("study_my_no"));
						
						db.pstmt.executeUpdate();
					}
				
				}
			
			}
		}
		
		db.close();
		
	}
	
	public void updateGoal(int study_my_no) throws Exception
	{
		Study_my_DAO sDAO = new Study_my_DAO();
		Study_my_DTO sDTO = sDAO.containsCert(study_my_no);
		
		//인증이 있다면
		if(sDTO.getStudy_my_no()!=0) 
		{
			String sql="select * from goal where study_my_no="+study_my_no;
			db.stmt=db.conn.createStatement();
			db.rs = db.stmt.executeQuery(sql);
			
			if(db.rs.next()) {
				return;			
			}
			else {
				sql = "insert into goal values(goal_seq.nextval, ?, ?, ?, sysdate, ?)";
				
				db.pstmt=db.conn.prepareStatement(sql);
				db.pstmt.setString(1, sDTO.getUser_id());
				db.pstmt.setInt(2, sDTO.getStudy_no());
				db.pstmt.setString(3, "성공");
				db.pstmt.setInt(4, sDTO.getStudy_my_no());
				
				db.pstmt.executeUpdate();
				System.out.println("인증 생겨서 새로 입력");
			}
			
			
			
		}
		//인증이 없다면
		else 
		{
			String sql="select * from goal where study_my_no="+study_my_no;
			
			db.stmt=db.conn.createStatement();
			db.rs = db.stmt.executeQuery(sql);
			
			if(db.rs.next()) 
			{
				sql = "delete from goal where goal_no=?";
				
				db.pstmt=db.conn.prepareStatement(sql);
				db.pstmt.setInt(1, db.rs.getInt("goal_no"));
				
				db.pstmt.executeUpdate();
				System.out.println("인증 사라져서 인증 제거");
			}
			else 
			{
				return;
			}
				
			System.out.println("인증 없는 if문");
			
		}
	
		
	}
	
	public void deleteGoal(String study_my_no) throws Exception 
	{
		String sql = "delete from goal where study_my_no="+study_my_no;
		
		db.stmt = db.conn.createStatement();
		db.stmt.executeUpdate(sql);
		db.close();
		
	}
	
	//방별 인증현황 가져오기
	public ArrayList<GoalDTO> roomGoal(String study_no) throws Exception
	{
		String sql = "select * from goal where goal_room_no="+study_no;
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<GoalDTO> list = new ArrayList<GoalDTO>();
		
		while(db.rs.next()) 
		{
			GoalDTO gDTO=new GoalDTO();
			
			gDTO.setGoal_day(db.rs.getString("goal_day"));
			gDTO.setGoal_no(db.rs.getInt("goal_no"));
			gDTO.setGoal_room_no(db.rs.getInt("goal_room_no"));
			gDTO.setIsgoal(db.rs.getString("isgoal"));
			gDTO.setUser_id(db.rs.getString("user_id"));
			
			list.add(gDTO);
		}
				
		db.close();
		
		return list;
	}
		
	//방별 아이디별 인증현황 가져오기
	public ArrayList<GoalDTO> roomGoal(String study_no, String user_id) throws Exception
	{
		String sql = "select goal_no, user_id, goal_room_no, isgoal, to_char(goal_day, 'yyyy-mm-dd') goal_day from goal where goal_room_no="+study_no+" user_id='"+user_id+"'";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<GoalDTO> list = new ArrayList<GoalDTO>();
		
		while(db.rs.next()) 
		{
			GoalDTO gDTO=new GoalDTO();
			
			gDTO.setGoal_day(db.rs.getString("goal_day"));
			gDTO.setGoal_no(db.rs.getInt("goal_no"));
			gDTO.setGoal_room_no(db.rs.getInt("goal_room_no"));
			gDTO.setIsgoal(db.rs.getString("isgoal"));
			gDTO.setUser_id(db.rs.getString("user_id"));
			
			list.add(gDTO);
		}
		
		db.close();
				
		return list;
	}
	
	
	//방별 오늘의 인증현황 가져오기
	public ArrayList<GoalDTO> roomDayGoal(String study_no) throws Exception
	{
		String sql = "select * from goal where goal_room_no="+study_no+" and to_char(goal_day, 'YYYYMMDD')=to_char(sysdate, 'YYYYMMDD')";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<GoalDTO> list = new ArrayList<GoalDTO>();
		
		while(db.rs.next()) 
		{
			GoalDTO gDTO=new GoalDTO();
			
			gDTO.setGoal_day(db.rs.getString("goal_day"));
			gDTO.setGoal_no(db.rs.getInt("goal_no"));
			gDTO.setGoal_room_no(db.rs.getInt("goal_room_no"));
			gDTO.setIsgoal(db.rs.getString("isgoal"));
			gDTO.setUser_id(db.rs.getString("user_id"));
			
			list.add(gDTO);
		}
				
		db.close();
		
		return list;
	}
	
	//방별 아이디별 특정 날짜의 인증현황 가져오기
	public GoalDTO roomDayGoal(String study_no, String goal_day, String user_id) throws Exception
	{
		String sql = "select goal_no, user_id, goal_room_no, isgoal, to_char(goal_day, 'yyyy-mm-dd') goal_day from goal where user_id='"+user_id+"' and goal_room_no="+study_no+" and to_char(goal_day, 'YYYY-MM-DD')='"+goal_day+"'";
				
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
			
		GoalDTO gDTO = new GoalDTO();
		
		if(db.rs.next()) 
		{
			gDTO.setGoal_day(db.rs.getString("goal_day"));
			gDTO.setGoal_no(db.rs.getInt("goal_no"));
			gDTO.setGoal_room_no(db.rs.getInt("goal_room_no"));
			gDTO.setIsgoal(db.rs.getString("isgoal"));
			gDTO.setUser_id(db.rs.getString("user_id"));
			
		}
		
		db.close();
		
		return gDTO;
	}
	
	public ArrayList<GoalDTO> roomDayGoalById(String study_no, String goal_day, String user_id) throws Exception
	{
		String sql = "select * from goal where goal_room_no="+study_no+" and to_char(goal_day, 'YYYY-MM-DD')='"+goal_day+"' and user_id='"+user_id+"'";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
			
		ArrayList<GoalDTO> list = new ArrayList<GoalDTO>();
		
		while(db.rs.next()) 
		{
			GoalDTO gDTO=new GoalDTO();
			
			gDTO.setGoal_day(db.rs.getString("goal_day"));
			gDTO.setGoal_no(db.rs.getInt("goal_no"));
			gDTO.setGoal_room_no(db.rs.getInt("goal_room_no"));
			gDTO.setIsgoal(db.rs.getString("isgoal"));
			gDTO.setUser_id(db.rs.getString("user_id"));
			
			list.add(gDTO);
		}
			
		db.close();
		
		return list;
	}
	
	
}
