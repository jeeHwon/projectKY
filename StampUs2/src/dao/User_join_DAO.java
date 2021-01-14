package dao;

import java.sql.*;
import java.util.ArrayList;

import db.DB;
import dto.User_join_DTO;

public class User_join_DAO {

	DB db = new DB();
	
	
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
	
	public ArrayList<User_join_DTO> listByStudy(String study_no) throws Exception
	{
		String sql = "select user_join_no, user_id, study_no, to_char(join_day, 'yyyy-mm-dd') join_day, to_char(end_day, 'yyyy-mm-dd') end_day, deposit, penalty from user_join "+
					"where study_no="+study_no;
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<User_join_DTO> list = new ArrayList<User_join_DTO>();
		
		while(db.rs.next()) 
		{
			User_join_DTO ujDTO = new User_join_DTO();
			ujDTO.setJoin_day(db.rs.getString("join_day"));
			ujDTO.setStudy_no(db.rs.getInt("study_no"));
			ujDTO.setUser_id(db.rs.getString("user_id"));
			ujDTO.setUser_join_no(db.rs.getInt("user_join_no"));
			ujDTO.setEnd_day(db.rs.getString("end_day"));
			
			list.add(ujDTO);

		}
		
		return list;
	}
	
	public User_join_DTO listByIdandStudy(String user_id, String study_no) throws Exception
	{
		String sql = "select user_join_no, user_id, study_no, to_char(join_day, 'yyyy-mm-dd') join_day, to_char(end_day, 'yyyy-mm-dd'), deposit, penalty from user_join "+
					"where user_id='"+user_id+"' and study_no="+study_no;
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		
		User_join_DTO ujDTO = new User_join_DTO();
		
		if(db.rs.next()) 
		{
			ujDTO.setJoin_day(db.rs.getString("join_day"));
			ujDTO.setStudy_no(db.rs.getInt("study_no"));
			ujDTO.setUser_id(db.rs.getString("user_id"));
			ujDTO.setUser_join_no(db.rs.getInt("user_join_no"));
			ujDTO.setEnd_day(db.rs.getString("end_day"));
			
			
		}
		
		return ujDTO;
	}
	
	public ArrayList<User_join_DTO> countById(String user_id) throws Exception
	{
		String sql = "select study_no, end_day-sysdate cnt from user_join where user_id='"+user_id+"'";
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<User_join_DTO> list=new ArrayList<User_join_DTO>();
		
		while(db.rs.next()) 
		{
			double cnt = db.rs.getDouble("cnt");

			RankingDAO rDAO = new RankingDAO();
			
			String day = rDAO.getDays(db.rs.getInt("study_no"));
			
			String baseDaySql = "SELECT count(A.DT) " + 
					"FROM ( SELECT TO_CHAR (SDT + LEVEL - 1, 'YYYY-MM-DD') DT, " + 
					"              TO_CHAR (SDT + LEVEL - 1, 'D') D " + 
					"       FROM (SELECT TO_DATE(TO_CHAR(join_day, 'YYYY-mm-dd'),'YYYY-MM-DD') SDT, " + 
					"                    TO_DATE(TO_CHAR(sysdate, 'YYYY-mm-dd'),'YYYY-MM-DD') EDT " + 
					"              FROM user_join where user_id='"+user_id+"' and study_no="+db.rs.getInt("study_no")+") " + 
					"       CONNECT BY LEVEL <= EDT - SDT + 1) A " + 
					"WHERE A.D IN ("+day+")";
			
			
			if(cnt>0) 
			{
				sql = "select user_join_no, user_id, study_no, join_day, ("+baseDaySql+") cnt from user_join where user_id='"+user_id+"' and study_no="+db.rs.getInt("study_no");
			
			}
			else 
			{
				 baseDaySql = "SELECT count(A.DT) " + 
							"FROM ( SELECT TO_CHAR (SDT + LEVEL - 1, 'YYYY-MM-DD') DT, " + 
							"              TO_CHAR (SDT + LEVEL - 1, 'D') D " + 
							"       FROM (SELECT TO_DATE(TO_CHAR(join_day, 'YYYY-mm-dd'),'YYYY-MM-DD') SDT, " + 
							"                    TO_DATE(TO_CHAR(end_day, 'YYYY-mm-dd'),'YYYY-MM-DD') EDT " + 
							"              FROM user_join where user_id='"+user_id+"' and study_no="+db.rs.getInt("study_no")+") " + 
							"       CONNECT BY LEVEL <= EDT - SDT + 1) A " + 
							"WHERE A.D IN ("+day+")";

				sql = "select user_join_no, user_id, study_no, join_day, ("+baseDaySql+") cnt from user_join where user_id='"+user_id+"' and study_no="+db.rs.getInt("study_no");
			
			}
			
			Statement stmt = db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) 
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
	
	public ArrayList<User_join_DTO> countByStudy(String study_no) throws Exception
	{
		String sql = "select user_id, end_day-sysdate cnt from user_join where study_no='"+study_no+"'";
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<User_join_DTO> list=new ArrayList<User_join_DTO>();
		
		while(db.rs.next()) 
		{
			double cnt = db.rs.getDouble("cnt");

			RankingDAO rDAO = new RankingDAO();
			
			String day = rDAO.getDays(Integer.parseInt(study_no));
			
			String baseDaySql = "SELECT count(A.DT) " + 
					"FROM ( SELECT TO_CHAR (SDT + LEVEL - 1, 'YYYY-MM-DD') DT, " + 
					"              TO_CHAR (SDT + LEVEL - 1, 'D') D " + 
					"       FROM (SELECT TO_DATE(TO_CHAR(join_day, 'YYYY-mm-dd'),'YYYY-MM-DD') SDT, " + 
					"                    TO_DATE(TO_CHAR(sysdate, 'YYYY-mm-dd'),'YYYY-MM-DD') EDT " + 
					"              FROM user_join where user_id='"+db.rs.getString("user_id")+"' and study_no="+study_no+") " + 
					"       CONNECT BY LEVEL <= EDT - SDT + 1) A " + 
					"WHERE A.D IN ("+day+")";
			
			
			if(cnt>0) 
			{
				sql = "select user_join_no, user_id, study_no, join_day, ("+baseDaySql+") cnt from user_join where user_id='"+db.rs.getString("user_id")+"' and study_no="+study_no;
			
			}
			else 
			{
				 baseDaySql = "SELECT count(A.DT) " + 
							"FROM ( SELECT TO_CHAR (SDT + LEVEL - 1, 'YYYY-MM-DD') DT, " + 
							"              TO_CHAR (SDT + LEVEL - 1, 'D') D " + 
							"       FROM (SELECT TO_DATE(TO_CHAR(join_day, 'YYYY-mm-dd'),'YYYY-MM-DD') SDT, " + 
							"                    TO_DATE(TO_CHAR(end_day, 'YYYY-mm-dd'),'YYYY-MM-DD') EDT " + 
							"              FROM user_join where user_id='"+db.rs.getString("user_id")+"' and study_no="+study_no+") " + 
							"       CONNECT BY LEVEL <= EDT - SDT + 1) A " + 
							"WHERE A.D IN ("+day+")";

				sql = "select user_join_no, user_id, study_no, join_day, ("+baseDaySql+") cnt from user_join where user_id='"+db.rs.getString("user_id")+"' and study_no="+study_no;
			
			}
			
			Statement stmt = db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) 
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
	
	public ArrayList<User_join_DTO> countAll() throws Exception
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
