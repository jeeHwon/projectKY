package dao;

import java.util.ArrayList;
import java.util.Collections;
import java.sql.*;

import db.DB;
import dto.RankingDTO;
import dto.User_join_DTO;

public class RankingDAO 
{
	DB db = null;
	
	public RankingDAO()
	{
		db = new DB();
	}
		
	//유저의 방별 달성률
	public ArrayList<RankingDTO> userRoomRate(String user_id) throws Exception
	{
		User_join_DAO ujDAO = new User_join_DAO();
		
		ArrayList<User_join_DTO> ujList = new ArrayList<User_join_DTO>();
		
		ujList = ujDAO.listById(user_id);
		
		System.out.println(ujList.size());
		
		ArrayList<RankingDTO> list = new ArrayList<RankingDTO>();
		
		for(int i=0;i<ujList.size();i++) 
		{
			String sql = "select count(*) certcnt from goal where user_id='"+user_id+"' and goal_room_no="+ujList.get(i).getStudy_no();
			db.stmt= db.conn.createStatement();
			db.rs = db.stmt.executeQuery(sql);
			
			int certcnt=0;
			double cnt=0.0;
			double rate=0.0;
			
			if(db.rs.next()) 
			{
				certcnt = db.rs.getInt("certcnt");
			
				cnt = ujList.get(i).getCnt();
			
			 	rate = Math.round(certcnt/cnt*100)/100.0*100;		
			}
			
			sql = "select room_title from room where room_no="+ujList.get(i).getStudy_no();
			db.stmt= db.conn.createStatement();
			db.rs = db.stmt.executeQuery(sql);
			
			String room_title="";
			
			if(db.rs.next()) {
				room_title=db.rs.getString("room_title");
			}
			
			RankingDTO rDTO = new RankingDTO();
			
			rDTO.setStudy_no(ujList.get(i).getStudy_no());
			rDTO.setUser_id(user_id);
			rDTO.setRoom_title(room_title);
			rDTO.setRate(rate);
			
			list.add(rDTO);
		}
		
		return list;
	}
	
	//방 랭킹
	public ArrayList<RankingDTO> roomRanking() throws Exception
	{
		String sql = "select study_no, sum(end_day-sysdate) cnt from user_join group by study_no";
		db.stmt= db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<RankingDTO> list = new ArrayList<RankingDTO>();
		
		while(db.rs.next()) 
		{
			double totalcnt = db.rs.getDouble("cnt");
			
			if(totalcnt>0) 
			{
				sql = "select study_no, sum(trunc(sysdate-join_day)+1) cnt from user_join where study_no="+db.rs.getInt("study_no")+" group by study_no";

			}
			else 
			{
				sql = "select study_no, sum(trunc(end_day-join_day)+1) cnt from user_join where study_no="+db.rs.getInt("study_no")+" group by study_no";
			}
			
			Statement stmt= db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			ArrayList<User_join_DTO> ujList=new ArrayList<User_join_DTO>();
			
			while(rs.next()) 
			{
				User_join_DTO ujDTO = new User_join_DTO();
				ujDTO.setCnt(rs.getDouble("cnt"));
				ujDTO.setStudy_no(rs.getInt("study_no"));
				
				ujList.add(ujDTO);
			}

					
			for(int i=0;i<ujList.size();i++) 
			{
				sql = "select count(*) certcnt from goal where goal_room_no="+ujList.get(i).getStudy_no();
				stmt= db.conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				int certcnt=0;
				double cnt=0.0;
				double rate=0.0;
				
				if(rs.next()) 
				{
				
					certcnt = rs.getInt("certcnt");
				
					cnt = ujList.get(i).getCnt();
				
				 	rate = Math.round(certcnt/cnt*100)/100.0*100;
				
				}
				
				sql = "select room_title from room where room_no="+ujList.get(i).getStudy_no();
				stmt= db.conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				String room_title="";
				
				if(rs.next()) {
					room_title=rs.getString("room_title");
				}
				
				RankingDTO rDTO = new RankingDTO();
				
				rDTO.setStudy_no(ujList.get(i).getStudy_no());
				rDTO.setRoom_title(room_title);
				rDTO.setRate(rate);
				
				list.add(rDTO);
			}
			
			Collections.sort(list, new RankingDTO());
			
			for(int i=0;i<list.size();i++) 
			{
				list.get(i).setRank(i+1);
			}
		
		}
		return list;
	}
	
	//유저 랭킹
	public ArrayList<RankingDTO> userRanking() throws Exception
	{
		String sql = "select user_id, sum(end_day-sysdate) cnt from user_join group by user_id";
		db.stmt= db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<RankingDTO> list = new ArrayList<RankingDTO>();
		
		while(db.rs.next()) 
		{
			double totalcnt=db.rs.getDouble("cnt");
			
			if(totalcnt>0) 
			{
				sql = "select user_id, sum(trunc(sysdate-join_day)+1) cnt from user_join where user_id='"+db.rs.getString("user_id")+"' group by user_id";
			}
			else 
			{
				sql = "select user_id, sum(trunc(end_day-join_day)+1) cnt from user_join where user_id='"+db.rs.getString("user_id")+"' group by user_id";
			}
			
			Statement stmt = db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			ArrayList<User_join_DTO> ujList=new ArrayList<User_join_DTO>();
			
			while(rs.next()) 
			{
				User_join_DTO ujDTO = new User_join_DTO();
				ujDTO.setCnt(rs.getDouble("cnt"));
				ujDTO.setUser_id(rs.getString("user_id"));
				
				ujList.add(ujDTO);
			}
			
			
			for(int i=0;i<ujList.size();i++) 
			{
				sql = "select count(*) certcnt from goal where user_id='"+ujList.get(i).getUser_id()+"'";
				stmt= db.conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				int certcnt=0;
				double cnt=0.0;
				double rate=0.0;
				
				if(rs.next()) 
				{
				
					certcnt = rs.getInt("certcnt");
				
					cnt = ujList.get(i).getCnt();
				
				 	rate = Math.round(certcnt/cnt*100)/100.0*100;
				
				}
				
				RankingDTO rDTO = new RankingDTO();
				
				rDTO.setUser_id(ujList.get(i).getUser_id());
				rDTO.setRate(rate);
				
				list.add(rDTO);
			}
			
			Collections.sort(list, new RankingDTO());
			
			for(int i=0;i<list.size();i++) 
			{
				list.get(i).setRank(i+1);
			}
		
		}
		
		return list;
	}
	
	//아이디별 총 달성률
	public Double userRate(String user_id) throws Exception
	{
		User_join_DAO ujDAO = new User_join_DAO();
		
		ArrayList<User_join_DTO> ujList = new ArrayList<User_join_DTO>();
		
		ujList = ujDAO.listById(user_id);
		
		int certcnt=0;
		double cnt=0.0;
		double rate=0.0;
		
		for(int i=0;i<ujList.size();i++) 
		{
			String sql = "select count(*) certcnt from goal where user_id='"+user_id+"' and goal_room_no="+ujList.get(i).getStudy_no();
			db.stmt= db.conn.createStatement();
			db.rs = db.stmt.executeQuery(sql);
			
			if(db.rs.next()) 
			{
				certcnt += db.rs.getInt("certcnt");
			
				cnt += ujList.get(i).getCnt();

			}
			
		}
		
		rate = Math.round(certcnt/cnt*100)/100.0*100;
		
		return rate;
		
	}
	
}
