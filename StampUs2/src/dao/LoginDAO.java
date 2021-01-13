package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.Session;

import dto.LoginDTO;


public class LoginDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LoginDAO() {
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
	
	public int login(LoginDTO dto) {
		String sql = "select USER_PW from USER_MEMBER where USER_ID = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			rs =pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(dto.getPwd())) {
					return 1; //로그인 성공
				}else {
					return 0; //비밀번호 불일치
				}
			}
			return -1; //아이디없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	public String findId(LoginDTO dto) throws Exception {
		String id = "";
		String sql = "select USER_ID from USER_MEMBER where EMAIL = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 id = rs.getString("USER_ID");
			}
		}catch(Exception e) {
			 e.printStackTrace();
		  }finally{
		   conn.close();
		  }
		return id;
	}
	public String findPw(LoginDTO dto) throws Exception {
		String pw = "";
		String sql = "select USER_PW from USER_MEMBER where USER_ID = ? and USER_NAME = ? and EMAIL = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pw = rs.getString("USER_PW");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return pw;
	}
	
}
