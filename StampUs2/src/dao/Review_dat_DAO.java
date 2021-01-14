package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import dto.Review_dat_DTO;

public class Review_dat_DAO {
	// DB연결
	String url = "jdbc:oracle:thin:@222.232.45.48:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Connection conn;
	public Review_dat_DAO() throws ClassNotFoundException, SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
	}
	public void conn_close() throws SQLException
    {
    	conn.close();
    }
	public ArrayList<Review_dat_DTO> review_content(String review_no) throws ClassNotFoundException, SQLException
	{
		// 쿼리생성
	    String sql="select * from review_dat where review_no="+review_no;
	    Statement stmt=conn.createStatement();
	    ResultSet rs=stmt.executeQuery(sql);
	    
	    ArrayList<Review_dat_DTO> list=new ArrayList<Review_dat_DTO>();
	    while(rs.next())
	    {
	    	Review_dat_DTO rddto=new Review_dat_DTO();
	    	rddto.setReview_dat_no(rs.getInt("review_dat_no"));
	    	rddto.setUser_id(rs.getString("user_id"));
	    	rddto.setReview_dat_content(rs.getString("review_dat_content"));
	    	rddto.setReview_dat_day(rs.getString("review_dat_day"));
	    
	    	list.add(rddto);
	    }
	    return list;
	}
	public void dat_write_ok(Review_dat_DTO rddto) throws Exception
	{
		// 쿼리 완성
		String sql="insert into review_dat(review_dat_no,user_id,review_dat_content,";
		sql=sql+"review_dat_day,review_no) "; 
		sql=sql+" values(review_dat_seq.nextval,?,?,SYSDATE,?)";
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, rddto.getUser_id());
		pstmt.setString(2, rddto.getReview_dat_content());
		pstmt.setInt(3, rddto.getReview_no());
		// 쿼리 실행
		pstmt.executeUpdate();
	}
	public boolean dat_delete(String review_dat_no,String connectId) throws Exception
	{
		// 쿼리 생성
		String sql="select review_no,user_id from review_dat where review_dat_no="+review_dat_no;
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
	    rs.next();
	    
		//현재 아이디가 작성자 아이디와 같은지 확인
	    if(connectId.equals(rs.getString("user_id")))
	    {
	    	sql="delete from review_dat where review_dat_no="+review_dat_no;
	    	stmt=conn.createStatement();
	    	stmt.executeUpdate(sql);
	    	return true;
	    }
	    else
	    	return false; 
	}
	public boolean dat_update_ok(Review_dat_DTO rddto,String connectId) throws Exception
	{
		// 쿼리 생성
	 	String sql="select review_no,user_id from review_dat where review_dat_no="+rddto.getReview_dat_no();
	 	Statement stmt=conn.createStatement();
	 	ResultSet rs=stmt.executeQuery(sql);
	    rs.next();
	    
	    // 접속자의 아이디와 글쓴이의 아이디가 같은지
	    if(connectId.equals(rs.getString("user_id")))
	    {
	    	sql="update review_dat set user_id=?,review_dat_content=?,";
	        sql=sql+"review_dat_day=SYSDATE where review_dat_no=?";
	    	// 심부름꾼 생성
	        PreparedStatement pstmt=conn.prepareStatement(sql);
	        pstmt.setString(1, rddto.getUser_id());
	        pstmt.setString(2, rddto.getReview_dat_content());
	        pstmt.setInt(3, rddto.getReview_dat_no());
	        pstmt.executeUpdate();
	        return true;
	    }
	    else
	    	return false; 
	}
}
