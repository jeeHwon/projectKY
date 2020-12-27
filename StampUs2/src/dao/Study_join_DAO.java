package dao;

import java.util.ArrayList;

import db.DB;
import dto.Study_join_DTO;
import dto.Study_my_DTO;

public class Study_join_DAO 
{
	DB db = null;
	Study_join_DTO sjDTO = null;
	ArrayList<Study_join_DTO> list=null;
	
	public Study_join_DAO()
	{
		db = new DB();
	}
	
	public ArrayList<Study_join_DTO> study_join_list(String user_id) throws Exception
	{
		String sql = "select sj.user_join_no, sj.user_id, sj.study_no, stu.study_title, stu.study_end, stu.study_img " + 
				"from user_join sj, study stu " + 
				"where sj.study_no=stu.study_no and sj.user_id='"+user_id+"'";
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		list = new ArrayList<Study_join_DTO>();
		
		while(db.rs.next()) 
		{
			sjDTO = new Study_join_DTO();
			sjDTO.setUser_join_no(db.rs.getInt("user_join_no"));
			sjDTO.setUser_id(db.rs.getString("user_id"));
			sjDTO.setStudy_no(db.rs.getInt("study_no"));
			sjDTO.setStudy_title(db.rs.getString("study_title"));
			sjDTO.setStudy_end(db.rs.getString("study_end"));
			sjDTO.setStudy_photo(db.rs.getString("study_img"));
			
			list.add(sjDTO);
		}
		

		db.close();
		
		return list;
	
	}
		
	
	public void insert(Study_join_DTO sjDTO) throws Exception
	{
		String sql = "insert into user_join values(user_join_seq.nextval, ?, ?)";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, sjDTO.getUser_id());
		db.pstmt.setInt(2, sjDTO.getStudy_no());
		
		db.pstmt.executeUpdate();
		
		db.close();
	}
	
}
