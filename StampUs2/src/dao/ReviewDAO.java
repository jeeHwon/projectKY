package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import dto.ReviewDTO;

public class ReviewDAO {
	// DB연결
	String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	String uid = "ky";
	String upw = "1234";
	Connection conn;	
	public ReviewDAO() throws ClassNotFoundException,SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
	}
	
	public void conn_close() throws SQLException
    {
    	conn.close();
    }   
	public void write_ok(ReviewDTO rdto) throws Exception
	{
		// 쿼리 생성
		String sql="insert into review(review_no,user_id,review_title,review_content,";
		sql=sql+"review_file,review_postday,hash) ";
		sql=sql+" values(review_seq.nextval,?,?,?,?,TO_DATE(SYSDATE,'YY.MM.DD HH24:MI:SS'),?)";
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, rdto.getUser_id());
		pstmt.setString(2, rdto.getReview_title());
		pstmt.setString(3, rdto.getReview_content());
		pstmt.setString(4, rdto.getReview_file());
		pstmt.setString(5, rdto.getHash());		
		// 쿼리실행
		pstmt.executeUpdate();		
	}
	public boolean delete(String connectId,String review_no) throws ClassNotFoundException, SQLException
	{
		// 쿼리 생성
		String sql="select user_id from review where review_no="+review_no;
		 // 심부름꾼 
	    Statement stmt=conn.createStatement();
	    // 실행후 ResultSet
	    ResultSet rs=stmt.executeQuery(sql);
	    rs.next();	    
	    //현재 아이디가 작성자 아이디와 같은지 확인
	    if(connectId.equals(rs.getString("user_id")))
	    {
	    	sql="delete from review where review_no="+review_no;
	        stmt=conn.createStatement();
	        stmt.executeUpdate(sql);
	        return true;
	    }
	    else
	    {
	        // 이동
	        return false; 
	    }		
	}
	public ReviewDTO update(String review_no) throws ClassNotFoundException, SQLException
	{
		// 쿼리 생성
	    String sql="select * from review where review_no="+review_no;
	 	// 심부름꾼 생성
	    Statement stmt=conn.createStatement();
	    // 쿼리 실행 => ResultSet
	    ResultSet rs=stmt.executeQuery(sql);
	    rs.next();
	    
	    ReviewDTO rdto=new ReviewDTO();
	    rdto.setReview_title(rs.getString("review_title"));
	    rdto.setReview_content(rs.getString("review_content"));
	    
	    return rdto;	
	}
	public boolean update_ok(String connectId,ReviewDTO rdto) throws ClassNotFoundException, SQLException
	{
		// 쿼리 생성
		String sql="select user_id from review where review_no="+rdto.getReview_no();
	    // 심부름꾼 
	    Statement stmt=conn.createStatement();
	    // 실행후 ResultSet
	    ResultSet rs=stmt.executeQuery(sql);
	    rs.next();
	    
	    if(connectId.equals(rs.getString("user_id")))
	    {
	    	//쿼리생성
	    	sql="update review set review_title=?,review_content=?,review_file=?,";
	    	sql=sql+"review_postday=TO_DATE(SYSDATE,'YY.MM.DD HH24:MI:SS'),hash=? where review_no=?";
	    	// 심부름꾼 생성
	    	PreparedStatement pstmt=conn.prepareStatement(sql);
	    	pstmt.setString(1, rdto.getReview_title());
	    	pstmt.setString(2, rdto.getReview_content());
	    	pstmt.setString(3, rdto.getReview_file());
	    	pstmt.setString(4, rdto.getHash());
	    	pstmt.setInt(5, rdto.getReview_no());    	
	    	pstmt.executeUpdate();
	    	return true;
	    }
	    else
	    {
	    	return false; 
	    }
	}
	public void view(String review_no) throws ClassNotFoundException, SQLException
	{
		// 쿼리 생성
	    String sql="update review set review_view=review_view+1 where review_no="+review_no; 
	    // 심부름꾼 생성 
	    Statement stmt=conn.createStatement();
	    // 쿼리 실행
	    stmt.executeUpdate(sql); 
	}
	public ArrayList<ReviewDTO> list(String cla, String sword,int pager) throws ClassNotFoundException, SQLException
	{
		int index=(pager-1)*10; // index값
		String sql="";		
		if(cla==null)
	    {
	    	sql="SELECT review_no,review_title,review_view,review_postday,user_id ";
	        sql=sql+" FROM(SELECT ROWNUM AS RM, review_no,review_title,review_view,review_postday,user_id ";
	        sql=sql+" FROM(SELECT * FROM review ORDER BY review_no DESC)";
	        sql=sql+") WHERE RM between "+index+" and " +(index+10);
	    }
	    else if(cla.equals("user_id"))
	    {
	    // user_id 필드를 검색
	    	sql="SELECT review_no,review_title,review_view,review_postday,user_id ";
	        sql=sql+" FROM(SELECT ROWNUM AS RM, review_no,review_title,review_view,review_postday,user_id ";
	        sql=sql+" FROM(SELECT * FROM review where user_id like '%"+sword+"%' ORDER BY review_no DESC)";
	        sql=sql+") WHERE RM between "+index+" and "+(index+10);
	        
	    }
	    else if(cla.equals("review_title"))
	    {
	    // review_title 필드를 검색
	    	sql="SELECT review_no,review_title,review_view,review_postday,user_id ";
	        sql=sql+" FROM(SELECT ROWNUM AS RM, review_no,review_title,review_view,review_postday,user_id ";
	        sql=sql+" FROM(SELECT * FROM review where review_title like '%"+sword+"%' ORDER BY review_no DESC)";
	        sql=sql+") WHERE RM between "+index+" and "+(index+10);        
	    }
	    else
	    {
	   	// hash 필드를 검색
		    sql="SELECT review_no,review_title,review_view,review_postday,user_id ";
		    sql=sql+" FROM(SELECT ROWNUM AS RM, review_no,review_title,review_view,review_postday,user_id ";
		    sql=sql+" FROM(SELECT * FROM review where hash like '%"+sword+"%' ORDER BY review_no DESC)";
		    sql=sql+") WHERE RM between "+index+" and "+(index+10);	        
	    }	     
	    // 심부름꾼생성
	    Statement stmt=conn.createStatement();
	    // 쿼리 실행 => ResultSet
	    ResultSet rs=stmt.executeQuery(sql);
	    
	    ArrayList<ReviewDTO> list=new ArrayList<ReviewDTO>();
	    while(rs.next())
    	{
	    	ReviewDTO rdto=new ReviewDTO();
	    	rdto.setReview_no(rs.getInt("review_no"));
	    	rdto.setUser_id(rs.getString("user_id"));
	    	rdto.setReview_title(rs.getString("review_title"));
	    	rdto.setReview_view(rs.getInt("review_view"));
	    	rdto.setReview_postday(rs.getString("review_postday"));
	    	
	    	list.add(rdto);
    	}
	    return list;
	}
	// 게시판 글의 수를 구하기	
	public int content_cnt(String cla, String sword) throws ClassNotFoundException, SQLException
	{
		String addsql="";
        if(cla.equals("user_id"))
       	 addsql="where user_id like '%"+sword+"%'";
        else if(cla.equals("review_title"))
       	 addsql="where review_title like '%"+sword+"%'";
        else if(cla.equals("hash"))
       	 addsql="where hash like '%"+sword+"%'";
        
        String sql="select count(*) as cnt from review "+addsql;
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        rs.next();
        int result=rs.getInt("cnt");
        return result;
	}
	public ReviewDTO content(String review_no) throws ClassNotFoundException, SQLException
	{
		// 쿼리 생성
	    String sql="select * from review where review_no="+review_no;
	 	// 심부름꾼 생성
	    Statement stmt=conn.createStatement();
	    // 쿼리실행  => ResultSet에 저장
	    ResultSet rs=stmt.executeQuery(sql);
	    rs.next();
	    
	    ReviewDTO rdto=new ReviewDTO();
	    rdto.setReview_no(Integer.parseInt(review_no));
	    rdto.setUser_id(rs.getString("user_id"));
	    rdto.setReview_title(rs.getString("review_title"));
	    rdto.setReview_content(rs.getString("review_content"));
	    rdto.setReview_file(rs.getString("review_file"));
	    rdto.setReview_postday(rs.getString("review_postday"));
	    rdto.setReview_view(rs.getInt("review_view"));
	    rdto.setHash(rs.getString("hash"));
	    
	    return rdto;
	}
}
