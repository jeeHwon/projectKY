package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.RoomDTO;

public class RoomDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url1 = "jdbc:oracle:thin:@20.194.41.83:1521:xe";
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
		sql += " ROOM_FILE_NAME, ROOM_PENALTY, ROOM_CONTENT, ROOM_DEPOSIT, ROOM_CONDITION) ";
		sql += " values(ROOM_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
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
}
