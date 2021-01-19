package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.MemberDTO;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url1 = "jdbc:oracle:thin:@222.232.45.48:1521:xe";
			String url2 = "jdbc:oracle:thin:@db.sarte.kr:1521:xe";
			String uid = "ky";
			String upw = "1234";
			Class.forName(driver);
			      
			 conn = DriverManager.getConnection(url1, uid, upw);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void insert(MemberDTO dto) throws Exception{
		String sql = "insert into USER_MEMBER(USER_NO,USER_ID,USER_NICK,USER_PW,USER_NAME,AGE,GENDER,TEL,EMAIL,USER_INTEREST,USER_MONEY) ";
		sql = sql + " values(USER_MEMBER_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getUserid());
		pstmt.setString(2,dto.getNickName());
		pstmt.setString(3, dto.getPwd());
		pstmt.setString(4, dto.getName());
		pstmt.setString(5, dto.getAge());
		pstmt.setString(6, dto.getSex());
		pstmt.setString(7, dto.getPhoneNum());
		pstmt.setString(8, dto.getEmail());
		pstmt.setString(9, dto.getInterest());
		pstmt.setInt(10, dto.getMoney());

		pstmt.executeUpdate();
	}
	
	public MemberDTO userInfo(String userid) throws Exception {
		String sql = "select * from USER_MEMBER where USER_ID='" + userid+"'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		MemberDTO dto = new MemberDTO();
		rs.next();
		dto.setAge(rs.getString("AGE"));
		dto.setEmail(rs.getString("EMAIL"));
		dto.setInterest(rs.getString("USER_INTEREST"));
		dto.setMoney(rs.getInt("USER_MONEY"));
		dto.setName(rs.getNString("USER_NAME"));
		dto.setNickName(rs.getString("USER_NICK"));
		dto.setPhoneNum(rs.getString("TEL"));
		dto.setSex(rs.getString("GENDER"));
		dto.setUserid(rs.getString("USER_ID"));
		
		return dto;
	}
	
	public void update(MemberDTO dto) throws Exception {
		String sql = "update USER_MEMBER set EMAIL=?, USER_INTEREST=?, "
					+ " TEL=? where USER_ID=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEmail());
		pstmt.setString(2, dto.getInterest());
		pstmt.setString(3, dto.getPhoneNum());
		pstmt.setString(4, dto.getUserid());
		
		pstmt.executeUpdate();
		pstmt.close();
		
	}
	
	public void delete(String userid) throws Exception{
		String sql = "delete from USER_MEMBER where USER_ID='"+userid+"'";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
	}
	
	//pay 페이지에서 금액 충전시 user_member db에 user_money 더하는 함수
	public void pay_charge(String userid, String total_bill) throws SQLException {
		String sql = "update USER_MEMBER set USER_MONEY = USER_MONEY + ? where USER_ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, total_bill);
		pstmt.executeUpdate();
		pstmt.close();
	}
	
}
