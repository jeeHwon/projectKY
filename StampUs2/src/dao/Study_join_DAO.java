package dao;

import java.util.ArrayList;

import db.DB;
import dto.Study_join_DTO;
import dto.User_join_DTO;

public class Study_join_DAO 
{
	DB db = new DB();
	Study_join_DTO sjDTO = null;
	ArrayList<Study_join_DTO> list=null;
	
	public Study_join_DAO()
	{
		db = new DB();
	}
	
	
	
	public ArrayList<Study_join_DTO> study_join_list(String user_id) throws Exception
	{
		String sql = "select sj.user_join_no, sj.user_id, "
				+ "r.room_no, r.room_title, r.room_start_day, r.room_end_day, r.room_category, r.room_category2, r.room_people, r.room_condition, r.room_check_day, r.room_certi_type, r.room_file_name, r.room_penalty, r.room_content, r.room_deposit " + 
				"from user_join sj, room r " + 
				"where sj.study_no=r.room_no and sj.user_id='"+user_id+"'";
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		list = new ArrayList<Study_join_DTO>();
		
		while(db.rs.next()) 
		{
			sjDTO = new Study_join_DTO();
			sjDTO.setUser_join_no(db.rs.getInt("user_join_no"));
			sjDTO.setUser_id(db.rs.getString("user_id"));
			sjDTO.setRoom_no(db.rs.getInt("room_no"));
			sjDTO.setRoom_title(db.rs.getString("room_title"));
			sjDTO.setRoom_start_day(db.rs.getString("room_start_day"));
			sjDTO.setRoom_end_day(db.rs.getString("room_end_day"));
			sjDTO.setRoom_category(db.rs.getString("room_category"));
			sjDTO.setRoom_category2(db.rs.getString("room_category2"));
			sjDTO.setRoom_people(db.rs.getInt("room_people"));
			sjDTO.setRoom_condition(db.rs.getString("room_condition"));
			sjDTO.setRoom_check_day(db.rs.getString("room_check_day"));
			sjDTO.setRoom_certi_type(db.rs.getString("room_certi_type"));
			sjDTO.setRoom_file_name(db.rs.getString("room_file_name"));
			sjDTO.setRoom_penalty(db.rs.getString("room_penalty"));
			sjDTO.setRoom_content(db.rs.getString("room_content"));
			sjDTO.setRoom_deposit(db.rs.getString("room_deposit"));
			
			list.add(sjDTO);
		}

		db.close();
		
		return list;
	
	}
		
	public Study_join_DTO study_content(String room_no) throws Exception 
	{
		String sql = "select * from room where room_no="+room_no;
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		Study_join_DTO sjDTO = new Study_join_DTO();
		
		if(db.rs.next()) 
		{
			sjDTO.setRoom_no(db.rs.getInt("room_no"));
			sjDTO.setRoom_title(db.rs.getString("room_title"));
			sjDTO.setRoom_start_day(db.rs.getString("room_start_day"));
			sjDTO.setRoom_end_day(db.rs.getString("room_end_day"));
			sjDTO.setRoom_category(db.rs.getString("room_category"));
			sjDTO.setRoom_category2(db.rs.getString("room_category2"));
			sjDTO.setRoom_people(db.rs.getInt("room_people"));
			sjDTO.setRoom_condition(db.rs.getString("room_condition"));
			sjDTO.setRoom_check_day(db.rs.getString("room_check_day"));
			sjDTO.setRoom_certi_type(db.rs.getString("room_certi_type"));
			sjDTO.setRoom_file_name(db.rs.getString("room_file_name"));
			sjDTO.setRoom_penalty(db.rs.getString("room_penalty"));
			sjDTO.setRoom_content(db.rs.getString("room_content"));
			sjDTO.setRoom_deposit(db.rs.getString("room_deposit"));
		}

		db.close();
		
		return sjDTO;
	}
	
	
	public void insert(Study_join_DTO sjDTO) throws Exception
	{
		String sql = "insert into user_join values(user_join_seq.nextval, ?, ?, sysdate, ?, ?, ?)";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, sjDTO.getUser_id());
		db.pstmt.setInt(2, sjDTO.getRoom_no());
		db.pstmt.setString(3, sjDTO.getRoom_end_day());
		db.pstmt.setString(4, sjDTO.getRoom_deposit());
		db.pstmt.setString(5, sjDTO.getRoom_penalty());
		
		db.pstmt.executeUpdate();
		
		db.close();
	}
	
	public int getInfo(String user_id, String study_no) throws Exception
	{	
		String sql = "select count(*) cnt from user_join where user_id=? and study_no=?";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, user_id);
		db.pstmt.setString(2, study_no);
		
		db.rs = db.pstmt.executeQuery();
		
		db.rs.next();
		
		if(db.rs.getInt("cnt")==1) 
		{
			return 1;
		}
		else 
		{
			return 0;
		}
		
	}
	
	
	
}
