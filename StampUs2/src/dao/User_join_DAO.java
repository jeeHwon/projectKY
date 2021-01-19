package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
		
		db.close();
		return list;
	}
	
	public User_join_DTO listById(String study_no, String user_id) throws Exception
	{
		String sql = "select user_join_no, user_id, study_no, to_char(join_day, 'yyyy-mm-dd') join_day, to_char(end_day, 'yyyy-mm-dd') end_day, deposit, penalty from user_join where study_no="+study_no+" and user_id='"+user_id+"'";
		
		db.stmt=db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		User_join_DTO ujDTO = new User_join_DTO();
		
		if(db.rs.next()) 
		{
			ujDTO.setStudy_no(db.rs.getInt("study_no"));
			ujDTO.setUser_id(db.rs.getString("user_id"));
			ujDTO.setUser_join_no(db.rs.getInt("user_join_no"));
			ujDTO.setJoin_day(db.rs.getString("join_day"));
			ujDTO.setEnd_day(db.rs.getString("end_day"));
		}
		
		db.close();
		
		return ujDTO;
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
		db.close();
		
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
		
		db.close();
		
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
			
			System.out.println(day);
			
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
			
			System.out.println(sql);
			
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

		db.close();
		
		return list;
	}
	
	public void getPenalty() throws Exception
	{
		String sql = "select user_join_no, user_id, study_no, deposit, penalty, cur_deposit, room_check_day "
				+ "from user_join, room where user_join.study_no=room.room_no";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		while(db.rs.next()) 
		{
			String room_check_day = db.rs.getString("room_check_day");
			LocalDate yesterday = LocalDate.now().minusDays(1);
			
			DayOfWeek dow=yesterday.getDayOfWeek();
			
			GoalDAO gDAO = new GoalDAO();
			
			String day=gDAO.getDay(dow);
			
			String yday = yesterday.format(DateTimeFormatter.BASIC_ISO_DATE);
			
			if(room_check_day.contains(day)) 
			{
				sql = "select * from goal where user_id=? and goal_room_no=? and to_char(goal_day, 'YYYYMMDD')=?";
				PreparedStatement pstmt = db.conn.prepareStatement(sql);
				pstmt.setString(1, db.rs.getString("user_id"));
				pstmt.setString(2, db.rs.getString("study_no"));
				pstmt.setString(3, yday);
				
				ResultSet rs = pstmt.executeQuery();
				
				if(!rs.next()) 
				{
					sql="update user_join set cur_deposit=? where user_join_no=?";
					
					double deposit = db.rs.getDouble("deposit");
					deposit = deposit*(db.rs.getDouble("penalty")/100.0);
					double cur_deposit = db.rs.getDouble("cur_deposit")-deposit;
					
					System.out.println("cur_deposit"+cur_deposit);
					System.out.println("penalty"+db.rs.getDouble("penalty"));
					
					pstmt= db.conn.prepareStatement(sql);
					pstmt.setDouble(1, cur_deposit);
					pstmt.setString(2, db.rs.getString("user_join_no"));
					
					pstmt.executeUpdate();
					
				}
				
			}
			
			
		}
		
	}
	
}
