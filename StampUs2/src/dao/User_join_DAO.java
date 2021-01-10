package dao;

import java.sql.*;
import java.util.ArrayList;

import db.DB;
import dto.User_join_DTO;

public class User_join_DAO {

	DB db = null;
	
	
	public User_join_DAO()
	{
		db = new DB();
	}
	
	public ArrayList<User_join_DTO> list(String study_no) throws Exception
	{
		String sql = "select * from user_join where study_no="+study_no;
		
		db.stmt=db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<User_join_DTO> list= new ArrayList<User_join_DTO>();
		
		while(db.rs.next()) 
		{
			User_join_DTO ujDTO = new User_join_DTO();
			
			ujDTO.setStudy_no(db.rs.getInt("study_no"));
			ujDTO.setUser_id(db.rs.getString("user_id"));
			ujDTO.setUser_join_no(db.rs.getInt("user_join_no"));
			ujDTO.setJoin_day(db.rs.getString("join_day"));
			
			list.add(ujDTO);
		}
		
		return list;
	}
	
	public ArrayList<User_join_DTO> listById(String user_id) throws Exception
	{
		String sql = "select study_no, end_day-sysdate cnt from user_join where user_id='"+user_id+"'";
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<User_join_DTO> list=new ArrayList<User_join_DTO>();
		
		while(db.rs.next()) 
		{
			double cnt = db.rs.getDouble("cnt");
			System.out.println(cnt);
			System.out.println("실행중");
			if(cnt>0) 
			{
				sql = "select user_join_no, user_id, study_no, join_day, trunc(sysdate-join_day)+1 cnt from user_join where user_id='"+user_id+"' and study_no="+db.rs.getInt("study_no");
			}
			else 
			{
				sql = "select user_join_no, user_id, study_no, join_day, trunc(end_day-join_day)+1 cnt from user_join where user_id='"+user_id+"' and study_no="+db.rs.getInt("study_no");
			}
			
			Statement stmt = db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) 
			{
				User_join_DTO ujDTO = new User_join_DTO();
				ujDTO.setJoin_day(rs.getString("join_day"));
				ujDTO.setStudy_no(rs.getInt("study_no"));
				ujDTO.setUser_id(rs.getString("user_id"));
				ujDTO.setUser_join_no(rs.getInt("user_join_no"));
				ujDTO.setCnt(rs.getDouble("cnt"));
				
				list.add(ujDTO);
			}
			
		}
		
		return list;
	}
	
	public ArrayList<User_join_DTO> listAll() throws Exception
	{
		String sql = "select end_day-sysdate cnt from user_join";
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
	
		ArrayList<User_join_DTO> list=new ArrayList<User_join_DTO>();
		
		while(db.rs.next()) 
		{
			double cnt = db.rs.getDouble("cnt");
			
			if(cnt>0) 
			{
				sql = "select user_join_no, user_id, study_no, join_day, trunc(sysdate-join_day)+1 cnt from user_join";
			}
			else 
			{
				sql = "select user_join_no, user_id, study_no, join_day, trunc(end_day-join_day)+1 cnt from user_join";	
			}
			
			Statement stmt = db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
				
			while(rs.next()) 
			{
				User_join_DTO ujDTO = new User_join_DTO();
				ujDTO.setJoin_day(rs.getString("join_day"));
				ujDTO.setStudy_no(rs.getInt("study_no"));
				ujDTO.setUser_id(rs.getString("user_id"));
				ujDTO.setUser_join_no(rs.getInt("user_join_no"));
				ujDTO.setCnt(rs.getDouble("cnt"));
				
				list.add(ujDTO);
			}

		}

		return list;
	}
	
}
