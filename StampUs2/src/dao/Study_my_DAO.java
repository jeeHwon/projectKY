package dao;

import java.util.ArrayList;

import db.DB;
import dto.Study_my_DTO;

public class Study_my_DAO 
{
	DB db = null;
	
	
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
	
}
