package dao;

import java.util.ArrayList;

import db.DB;
import dto.Study_dat_DTO;
import dto.Study_my_DTO;

public class Study_dat_DAO 
{
	DB db = null;
	
	public Study_dat_DAO() 
	{
		db = new DB();
	}
	
	public void insert(Study_dat_DTO sdDTO) throws Exception
	{
	
		String sql = "insert into study_dat values(study_dat_seq.nextval, ?, ?, sysdate, ?)";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, sdDTO.getUser_id());
		db.pstmt.setString(2, sdDTO.getStudy_dat_content());
		db.pstmt.setInt(3, sdDTO.getStudy_my_no());
		
		db.pstmt.executeUpdate();
	
		db.close();
	
	}
	
	public ArrayList<Study_dat_DTO> list(int study_my_no) throws Exception
	{
		String sql="select * from study_dat where study_my_no="+study_my_no+" order by study_dat_no desc";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<Study_dat_DTO> list = new ArrayList<Study_dat_DTO>();
		
		while(db.rs.next()) 
		{
			Study_dat_DTO sDTO = new Study_dat_DTO();
			sDTO.setStudy_dat_no(db.rs.getInt("study_dat_no"));
			sDTO.setUser_id(db.rs.getString("user_id"));
			sDTO.setStudy_dat_content(db.rs.getString("study_dat_content"));
			sDTO.setStudy_dat_day(db.rs.getString("study_dat_day"));
			sDTO.setStudy_my_no(db.rs.getInt("study_my_no"));
			
			list.add(sDTO);
		}
		
		db.close();
		
		return list;
	}
	
	public void update(Study_dat_DTO sdDTO) throws Exception
	{
	
		String sql = "update study_dat set study_dat_content=? where study_dat_no=?";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, sdDTO.getStudy_dat_content());
		db.pstmt.setInt(2, sdDTO.getStudy_dat_no());
		
		db.pstmt.executeUpdate();
	
		db.close();
	
	}
	
	public void delete(String study_dat_no) throws Exception 
	{
		String sql = "delete from study_dat where study_dat_no="+study_dat_no;
		
		db.stmt = db.conn.createStatement();
		db.stmt.executeUpdate(sql);
		
		db.close();
	}
	
}
