package dao;

import java.sql.*;
import java.util.ArrayList;

import db.DB;
import dto.Fboard_datDto;


public class Fboard_datDao {
	DB db = null;
	
	public Fboard_datDao() {
		db = new DB();
	}
	public void dat_insert(Fboard_datDto fddto) throws SQLException {
		
		String sql = "insert into fboard_dat (dat_no, userid, content, writeday, dat_no_id) ";
		sql += " values (fboard_dat_seq.nextval, ?, ?, sysdate, ?)";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, fddto.getUserid());
		db.pstmt.setString(2, fddto.getContent());
		db.pstmt.setInt(3, fddto.getDat_no_id());
		
		db.pstmt.executeUpdate();
		
		db.close();
	}
	public ArrayList<Fboard_datDto> dat_content(String dat_no_id) throws SQLException {
		String sql = "select * from fboard_dat where dat_no_id=" + dat_no_id + " order by dat_no desc";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<Fboard_datDto> list = new ArrayList<Fboard_datDto>();
		
		while(db.rs.next()) {
			Fboard_datDto fddto = new Fboard_datDto();
			fddto.setUserid(db.rs.getString("userid"));
			fddto.setContent(db.rs.getString("content"));
			fddto.setWriteday(db.rs.getString("writeday"));
			
			list.add(fddto);
		}
		return list;
	}
	
	public void dat_update(Fboard_datDto fddto) throws SQLException {
		
		String sql = "update fboard_dat set content=? where dat_no=?";
		
		db.pstmt = db.conn.prepareStatement(sql);
		db.pstmt.setString(1, fddto.getContent());
	    db.pstmt.setInt(2, fddto.getDat_no());
	    
	    db.pstmt.executeUpdate();
		
		db.close();
	}
	
	public void dat_delete(String dat_no) throws SQLException {
		String sql = "delete from fboard_dat where dat_no="+ dat_no;
		
		db.stmt = db.conn.createStatement();
		db.stmt.execute(sql);
		
		db.close();
	}
}
