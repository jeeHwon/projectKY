package dao;

import java.util.ArrayList;
import db.DB;
import dto.Event_dat_DTO;

public class Event_dat_DAO{
	DB db = null;
	
	public Event_dat_DAO(){
		db = new DB();
	}
	//================================insert==================================
	public void insert(Event_dat_DTO edDTO) throws Exception{
	
		String sql = "insert into event_dat values(event_dat_seq.nextval, ?, ?, sysdate, ?)";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, edDTO.getUser_id());
		db.pstmt.setString(2, edDTO.getEvent_dat_content());
		db.pstmt.setInt(3, edDTO.getEvent_no());
		
		db.pstmt.executeUpdate();
	
		db.close();
	
	}
	
	//================================list==================================
	public ArrayList<Event_dat_DTO> list(int event_no) throws Exception{
		String sql="select * from event_dat where event_no="+event_no+" order by event_dat_no desc";
		
		db.stmt = db.conn.createStatement();
		db.rs = db.stmt.executeQuery(sql);
		
		ArrayList<Event_dat_DTO> list = new ArrayList<Event_dat_DTO>();
		
		while(db.rs.next()) {
			Event_dat_DTO sDTO = new Event_dat_DTO();
			sDTO.setEvent_dat_no(db.rs.getInt("Event_dat_no"));
			sDTO.setUser_id(db.rs.getString("user_id"));
			sDTO.setEvent_dat_content(db.rs.getString("Event_dat_content"));
			sDTO.setEvent_dat_day(db.rs.getString("Event_dat_day"));
			sDTO.setEvent_no(db.rs.getInt("Event_no"));
			
			list.add(sDTO);
		}
		
		db.close();
		
		return list;
	}
	
	//================================update==================================
	public void update(Event_dat_DTO sdDTO) throws Exception{
	
		String sql = "update event_dat set event_dat_content=? where event_dat_no=?";
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, sdDTO.getEvent_dat_content());
		db.pstmt.setInt(2, sdDTO.getEvent_dat_no());
		
		db.pstmt.executeUpdate();
	
		db.close();
	}
	
	//================================delete==================================
	public void delete(String event_dat_no) throws Exception {
		String sql = "delete from event_dat where event_dat_no="+event_dat_no;
		
		db.stmt = db.conn.createStatement();
		db.stmt.executeUpdate(sql);
		
		db.close();
	}
	
}