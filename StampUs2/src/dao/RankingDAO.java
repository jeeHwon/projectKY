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
	
	//요일 칼럼 가져오기
	public String getDays(int room_no) throws Exception
	{
		String sql = "select room_check_day from room where room_no="+room_no;

		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		String day = "";
		
		if(db.rs.next()) { 
			
			
			String check_day=db.rs.getString("room_check_day");
			
			String[] days=check_day.split(",");
			
			for(int i=0;i<days.length;i++) 
			{
				switch(days[i]) 
				{
					case "sun":days[i]="'1'";break;
					case "mon":days[i]="'2'";break;
					case "tue":days[i]="'3'";break;
					case "wed":days[i]="'4'";break;
					case "thu":days[i]="'5'";break;
					case "fri":days[i]="'6'";break;
					case "sat":days[i]="'7'";break;
					
				}
			}
			
			
			for(int i=0;i<days.length;i++) {
				if(i!=days.length-1) 
				{
					day += days[i]+",";
				}
				else 
				{
					day += days[i];
				}
				
			}
		
		}
		return day;
		
	}
	
	//유저의 방별 달성률
	public ArrayList<RankingDTO> userRoomRate(String user_id) throws Exception
	{
		User_join_DAO ujDAO = new User_join_DAO();
		
		ArrayList<User_join_DTO> ujList = new ArrayList<User_join_DTO>();
		
		ujList = ujDAO.countById(user_id);
				
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
			
				if(cnt!=0) {
				
					rate = certcnt/cnt*100;
				}
				else 
				{
					rate = 0.0;
				}
				
			 	String sRate = String.format("%.2f", rate);
			 	
			 	rate = Double.parseDouble(sRate);
		
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
		String sql = "select study_no from user_join group by study_no";
		db.stmt= db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<RankingDTO> list = new ArrayList<RankingDTO>();
		
		User_join_DAO uDAO= new User_join_DAO();
		
		while(db.rs.next()) 
		{
			ArrayList<User_join_DTO> ujList=new ArrayList<User_join_DTO>();
			
			ujList = uDAO.countByStudy(db.rs.getString("study_no"));
			
			sql = "select count(*) certcnt from goal where goal_room_no="+db.rs.getString("study_no");
			Statement stmt= db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
				
			int certcnt=0;
			double cnt=0.0;
			double rate=0.0;
				
			rs.next();
			
			certcnt = rs.getInt("certcnt");
			
			for(int i=0;i<ujList.size();i++) 
			{
				cnt += ujList.get(i).getCnt();
			}
			
			if(cnt!=0) 
			{
				rate = certcnt/cnt*100;
			}
			else 
			{
				rate = 0.0;
			}
			
			String sRate = String.format("%.2f", rate);
				 	
			rate = Double.parseDouble(sRate);
					
			sql = "select room_title from room where room_no="+db.rs.getString("study_no");
			stmt= db.conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			String room_title="";
			
			if(rs.next()) {
				room_title=rs.getString("room_title");
			}
			
			RankingDTO rDTO = new RankingDTO();
			
			rDTO.setStudy_no(db.rs.getInt("study_no"));
			rDTO.setRoom_title(room_title);
			rDTO.setRate(rate);
			
			list.add(rDTO);
		}
			
		Collections.sort(list, new RankingDTO());

		int ranks[]= new int[list.size()];
		
		ranks[0]=1;
		list.get(0).setRank(1);
		
		for(int i=1;i<list.size();i++) 
		{
			ranks[i] = list.get(i).getRate() == list.get(i-1).getRate() ? ranks[i-1] : i + 1;
			
			list.get(i).setRank(ranks[i]); 
		}
		
		return list;
	}
	
	//유저 랭킹
	public ArrayList<RankingDTO> userRanking() throws Exception
	{
		String sql = "select user_id from user_join group by user_id";
		db.stmt= db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<RankingDTO> list = new ArrayList<RankingDTO>();
		
		User_join_DAO uDAO= new User_join_DAO();
		
		while(db.rs.next()) 
		{
			ArrayList<User_join_DTO> ujList=new ArrayList<User_join_DTO>();
			
			ujList = uDAO.countById(db.rs.getString("user_id"));
			
			sql = "select count(*) certcnt from goal where user_id='"+db.rs.getString("user_id")+"'";
			Statement stmt= db.conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			rs.next();
			
			int certcnt=0;
			double cnt=0.0;
			double rate=0.0;
			
			certcnt = rs.getInt("certcnt");
			
			for(int i=0;i<ujList.size();i++) 
			{
				cnt += ujList.get(i).getCnt();
			}
			
			if(cnt!=0) {
				rate = certcnt/cnt*100;
			}
			else 
			{
				rate = 0.0;
			}
			
			String sRate = String.format("%.2f", rate);
			 	
			rate = Double.parseDouble(sRate);
			 	
			RankingDTO rDTO = new RankingDTO();
				
			rDTO.setUser_id(db.rs.getString("user_id"));
			rDTO.setRate(rate);
				
			list.add(rDTO);
		
		}	
			
		Collections.sort(list, new RankingDTO());
			
		int ranks[]= new int[list.size()];
		
		ranks[0]=1;
		list.get(0).setRank(1);
		
		for(int i=1;i<list.size();i++) 
		{
			ranks[i] = list.get(i).getRate() == list.get(i-1).getRate() ? ranks[i-1] : i + 1;
			
			list.get(i).setRank(ranks[i]); 
		}

		return list;
	}
	
	//아이디별 총 달성률
	public Double userRate(String user_id) throws Exception
	{
		User_join_DAO ujDAO = new User_join_DAO();
		
		ArrayList<User_join_DTO> ujList = new ArrayList<User_join_DTO>();
		
		ujList = ujDAO.countById(user_id);
		
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
		if(cnt!=0) 
		{
			rate = certcnt/cnt*100;
		}
		else 
		{
			rate = 0.0;
		}
		
	 	String sRate = String.format("%.2f", rate);
	 	
	 	rate = Double.parseDouble(sRate);

		return rate;
		
	}
	
}
