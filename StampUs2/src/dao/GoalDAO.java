package dao;

import java.util.ArrayList;

import db.DB;
import dto.GoalDTO;
import dto.Study_my_DTO;

public class GoalDAO {

	DB db = null;
	
	public GoalDAO() 
	{
		db = new DB();
	}
	
	public void insertGoal(Study_my_DTO sDTO) throws Exception
	{
		if(sDTO.getStudy_img()!=null) 
		{
			String sql = "select * from (" + 
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
			System.out.println("인증 if문");
			
			if(db.rs.next()) 
			{
				sql = "insert into goal values(goal_seq.nextval, ?, ?, ?, sysdate, ?)";
				
				db.pstmt=db.conn.prepareStatement(sql);
				db.pstmt.setString(1, sDTO.getUser_id());
				db.pstmt.setInt(2, sDTO.getStudy_no());
				db.pstmt.setString(3, "성공");
				db.pstmt.setInt(4, db.rs.getInt("study_my_no"));
				
				db.pstmt.executeUpdate();
				System.out.println("결과값 있는 경우");
			}
			else 
			{
				sql = "insert into goal values(goal_seq.nextval, ?, ?, ?, sysdate, ?)";
				
				db.pstmt=db.conn.prepareStatement(sql);
				db.pstmt.setString(1, sDTO.getUser_id());
				db.pstmt.setInt(2, sDTO.getStudy_no());
				db.pstmt.setString(3, "성공");
				db.pstmt.setInt(4, sDTO.getStudy_my_no());
				
				db.pstmt.executeUpdate();
				System.out.println("인증 없어서 새로 입력");
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
				System.out.println("인증 사라져서 실패로 작성");
			}
			else 
			{
				return;
			}
				
			System.out.println("인증 없는 if문");
			
		}
	
		db.close();
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
				
		return list;
	}
	
	
	
}
