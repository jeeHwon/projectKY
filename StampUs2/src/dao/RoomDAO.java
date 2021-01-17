package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.RoomDTO;
import dto.User_join_DTO;

public class RoomDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@222.232.45.48:1521:xe";
	String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
	String user = "ky";
	String password = "1234";
	Connection conn;
	
	public RoomDAO() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");	
		conn = DriverManager.getConnection(url1, user, password);
	}
	
	public void insert(RoomDTO rdto) throws SQLException {
		//쿼리 생성
		String sql = "insert into ROOM (ROOM_NO, ROOM_TITLE, ROOM_START_DAY, ROOM_END_DAY, ";
		sql += " ROOM_CATEGORY, ROOM_CATEGORY2, ROOM_PEOPLE, ROOM_CHECK_DAY, ROOM_CERTI_TYPE, ";
		sql += " ROOM_FILE_NAME, ROOM_PENALTY, ROOM_CONTENT, ROOM_DEPOSIT, ROOM_CONDITION, ROOM_WRITE_DAY) ";
		sql += " values(ROOM_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE) ";
		//String sql = "insert into ROOM values(ROOM_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(SYSDATE,'yyyy-mm-dd')) ";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, rdto.getTitle());
		pstmt.setString(2, rdto.getStart_day());
		pstmt.setString(3, rdto.getEnd_day());
		pstmt.setString(4, rdto.getCategory());
		pstmt.setString(5, rdto.getCategory2());
		pstmt.setInt(6, rdto.getPeople());
		pstmt.setString(7, rdto.getCheck_day());
		pstmt.setString(8, rdto.getCerti_type());
		pstmt.setString(9, rdto.getFile_name());
		pstmt.setString(10, rdto.getPenalty());
		pstmt.setString(11, rdto.getContent());
		pstmt.setString(12, rdto.getDeposit());
		pstmt.setString(13, rdto.getCondition());
		
		//쿼리 실행
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	public ArrayList<RoomDTO> list() throws SQLException {
		
		String sql = "select * from room order by ROOM_NO desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
		while(rs.next()) {
			RoomDTO rdto = new RoomDTO();
			rdto.setId(rs.getInt("ROOM_NO"));
			rdto.setTitle(rs.getString("ROOM_TITLE"));
			rdto.setStart_day(rs.getString("ROOM_START_DAY"));
			rdto.setEnd_day(rs.getString("ROOM_END_DAY"));
			rdto.setCategory(rs.getString("ROOM_CATEGORY"));
			rdto.setCategory2(rs.getString("ROOM_CATEGORY2"));
			rdto.setPeople(rs.getInt("ROOM_PEOPLE"));
			rdto.setCheck_day(rs.getString("ROOM_CHECK_DAY"));
			rdto.setCerti_type(rs.getString("ROOM_CERTI_TYPE"));
			rdto.setDeposit(rs.getString("ROOM_DEPOSIT"));
			rdto.setPenalty(rs.getString("ROOM_PENALTY"));
			rdto.setContent(rs.getString("ROOM_CONTENT"));
			rdto.setFile_name(rs.getString("ROOM_FILE_NAME"));
			rdto.setCondition(rs.getString("ROOM_CONDITION"));
			rdto.setWrite_day(rs.getString("ROOM_WRITE_DAY"));
			list.add(rdto);
		}
		return list;
		
	}
	
	public ArrayList<RoomDTO> sort_list(String sort) throws SQLException {
		String sql = "select * from room order by ROOM_NO desc";
		switch (sort) {
		case "0":
			break;
		case "1":
			sql = "select * from room order by ROOM_PEOPLE desc";
			break;
		case "2":
			sql = "select * from room order by ROOM_WRITE_DAY";
			break;
		case "3":
			sql = "select * from room order by ROOM_START_DAY";
			break;
		default:
			break;
		}
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
		while(rs.next()) {
			RoomDTO rdto = new RoomDTO();
			rdto.setId(rs.getInt("ROOM_NO"));
			rdto.setTitle(rs.getString("ROOM_TITLE"));
			rdto.setStart_day(rs.getString("ROOM_START_DAY"));
			rdto.setEnd_day(rs.getString("ROOM_END_DAY"));
			rdto.setCategory(rs.getString("ROOM_CATEGORY"));
			rdto.setCategory2(rs.getString("ROOM_CATEGORY2"));
			rdto.setPeople(rs.getInt("ROOM_PEOPLE"));
			rdto.setCheck_day(rs.getString("ROOM_CHECK_DAY"));
			rdto.setCerti_type(rs.getString("ROOM_CERTI_TYPE"));
			rdto.setDeposit(rs.getString("ROOM_DEPOSIT"));
			rdto.setPenalty(rs.getString("ROOM_PENALTY"));
			rdto.setContent(rs.getString("ROOM_CONTENT"));
			rdto.setFile_name(rs.getString("ROOM_FILE_NAME"));
			rdto.setCondition(rs.getString("ROOM_CONDITION"));
			rdto.setWrite_day(rs.getString("ROOM_WRITE_DAY"));
			list.add(rdto);
		}
		return list;
		
	}
	
	public ArrayList<RoomDTO> cateList(String category) throws SQLException{
		
		String sql = "select * from room where ROOM_CATEGORY2 = '"+category+"' order by ROOM_NO desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
		if(rs.next()) {
			do {
				RoomDTO rdto = new RoomDTO();
				rdto.setId(rs.getInt("ROOM_NO"));
				rdto.setTitle(rs.getString("ROOM_TITLE"));
				rdto.setStart_day(rs.getString("ROOM_START_DAY"));
				rdto.setEnd_day(rs.getString("ROOM_END_DAY"));
				rdto.setCategory(rs.getString("ROOM_CATEGORY"));
				rdto.setCategory2(rs.getString("ROOM_CATEGORY2"));
				rdto.setPeople(rs.getInt("ROOM_PEOPLE"));
				rdto.setCheck_day(rs.getString("ROOM_CHECK_DAY"));
				rdto.setCerti_type(rs.getString("ROOM_CERTI_TYPE"));
				rdto.setDeposit(rs.getString("ROOM_DEPOSIT"));
				rdto.setPenalty(rs.getString("ROOM_PENALTY"));
				rdto.setContent(rs.getString("ROOM_CONTENT"));
				rdto.setFile_name(rs.getString("ROOM_FILE_NAME"));
				rdto.setCondition(rs.getString("ROOM_CONDITION"));
				rdto.setWrite_day(rs.getString("ROOM_WRITE_DAY"));
				list.add(rdto);
				
			} while (rs.next());
			
		} else {
			System.out.println("널이에유~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			return list();
		}
		return list;
		
		
	}
	public RoomDTO content(String id) throws SQLException {
		
		String sql = "select * from room where ROOM_NO= "+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		RoomDTO rdto = new RoomDTO();
		rdto.setId(rs.getInt("ROOM_NO"));
		rdto.setTitle(rs.getString("ROOM_TITLE"));
		rdto.setStart_day(rs.getString("ROOM_START_DAY"));
		rdto.setEnd_day(rs.getString("ROOM_END_DAY"));
		rdto.setCategory(rs.getString("ROOM_CATEGORY"));
		rdto.setCategory2(rs.getString("ROOM_CATEGORY2"));
		rdto.setPeople(rs.getInt("ROOM_PEOPLE"));
		rdto.setCheck_day(rs.getString("ROOM_CHECK_DAY"));
		rdto.setCerti_type(rs.getString("ROOM_CERTI_TYPE"));
		rdto.setDeposit(rs.getString("ROOM_DEPOSIT"));
		rdto.setPenalty(rs.getString("ROOM_PENALTY"));
		rdto.setContent(rs.getString("ROOM_CONTENT"));
		rdto.setFile_name(rs.getString("ROOM_FILE_NAME"));
		rdto.setCondition(rs.getString("ROOM_CONDITION"));
		rdto.setWrite_day(rs.getString("ROOM_WRITE_DAY"));
		return rdto;
	}
	
	public String getLastRoom() throws SQLException {
		String sql = "SELECT * FROM room WHERE room_no = (SELECT max(room_no) FROM room)";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		return rs.getString("ROOM_NO");
	}
	
	public int getCurrentPeople(String r_id) throws SQLException {
		String sql = "SELECT COUNT(*) AS CNT FROM user_join WHERE STUDY_NO = "+r_id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		return rs.getInt("CNT");
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
