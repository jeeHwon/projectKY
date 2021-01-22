package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.DB;
import dto.RevDto;

public class RevDao {
	DB db = null;
	
	public RevDao(){
		db = new DB();
	}
//===============================insert===============================================
	public void insert(RevDto rdto) throws Exception 
    {

    	// 쿼리 생성
		String sql = "insert into rev(rev_no,rev_company,rev_addr,rev_tel,rev_pay,rev_img)";
		sql = sql + " values(rev_seq.nextval,?,?,?,?,?)";
    	// 심부름꾼 생성
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt = db.conn.prepareStatement(sql);
		db.pstmt.setString(1,rdto.getRev_company());
		db.pstmt.setString(2, rdto.getRev_addr());
		db.pstmt.setString(3, rdto.getRev_tel());
		db.pstmt.setInt (4, rdto.getRev_pay());
		db.pstmt.setString(5, rdto.getRev_img());
    	// 쿼리 실행
		db.pstmt.executeUpdate();
    	
		db.pstmt.close();
		db.conn.close();
    }
	
//==============================list==================================================

    public ArrayList<RevDto> list(String cla, String sword,int pager) throws ClassNotFoundException, SQLException
		{
			int index=(pager-1)*10; // index값
			String sql="";		

		    	sql="SELECT *";
		        sql=sql+" FROM(SELECT ROWNUM AS RM, rev_no,rev_img,rev_company,rev_addr";
		        sql=sql+" FROM(SELECT * FROM rev ORDER BY rev_no DESC)";
		        sql=sql+") WHERE RM between "+index+" and " +(index+10);

		    // 심부름꾼생성
			db.stmt=db.conn.createStatement();
		    // 쿼리 실행 => ResultSet
			db.rs=db.stmt.executeQuery(sql);
		    
		    ArrayList<RevDto> list=new ArrayList<RevDto>();
		    while(db.rs.next()) 
	    	{
	    		RevDto rdto=new RevDto();
	    		rdto.setRev_no(db.rs.getInt("rev_no"));
	    		rdto.setRev_img(db.rs.getNString("rev_img"));
	    		rdto.setRev_company(db.rs.getNString("rev_company"));
	    		rdto.setRev_addr(db.rs.getNString("rev_addr"));
	    		list.add(rdto);
		}	
	    	//ArrayList 객체를 넘긴다
	    	return list;	
	    }
//==============================content==================================================
	
	public RevDto content(String rev_no) throws Exception
    {

    	// 쿼리 생성
		String sql = "select * from rev where rev_no=" + rev_no;
    	
    	// 심부름꾼 실행 => ResultSet
    	db.stmt = db.conn.createStatement();
    	
    	db.rs = db.stmt.executeQuery(sql);
    	
    	db.rs.next();
    	
    	RevDto rdto = new RevDto();
    	
    	rdto.setRev_no(db.rs.getInt("rev_no"));
    	rdto.setRev_img(db.rs.getString("rev_img"));
    	rdto.setRev_company(db.rs.getString("rev_company"));
    	rdto.setRev_addr(db.rs.getString("rev_addr"));
    	rdto.setRev_tel(db.rs.getString("rev_tel"));
    	rdto.setRev_pay(db.rs.getInt("rev_pay"));
    	
    	return rdto;
    }
	
//==============================update==================================================
	
	 public RevDto update(String rev_no) throws Exception
	    {

	    	// 쿼리 생성
			String sql = "select * from rev where rev_no=" + rev_no;
	    	
	    	// 심부름꾼 실행 => ResultSet
	    	db.stmt = db.conn.createStatement();
	    	
	    	db.rs = db.stmt.executeQuery(sql);
	    	
	    	db.rs.next();
	    	
	    	RevDto rdto = new RevDto();
	    	
	    	rdto.setRev_no(db.rs.getInt("rev_no"));
	    	rdto.setRev_pay(db.rs.getInt("rev_pay"));
	    	rdto.setRev_company(db.rs.getString("rev_company"));
	    	rdto.setRev_addr(db.rs.getString("rev_addr"));
	    	rdto.setRev_tel(db.rs.getString("rev_tel"));
	    	rdto.setRev_img(db.rs.getString("rev_img"));
	    	return rdto;
	    }
	
    	// 쿼리 실행
	//==============================update_ok==================================================
	
	
	 public void update_ok(RevDto rdto) throws Exception 
	    {

		 String sql = "update rev set rev_company=?,rev_addr=?,rev_tel=?,rev_pay=?,rev_img=?  where rev_no=?";	    	
	    	db.pstmt = db.conn.prepareStatement(sql);
	    	

			db.pstmt = db.conn.prepareStatement(sql);
			db.pstmt.setString(1,rdto.getRev_company());
			db.pstmt.setString(2, rdto.getRev_addr());
			db.pstmt.setString(3, rdto.getRev_tel());
			db.pstmt.setInt (4, rdto.getRev_pay());
			db.pstmt.setString(5, rdto.getRev_img());
			db.pstmt.setInt(6, rdto.getRev_no());
	    	// 쿼리 실행
	    	db.pstmt.executeUpdate();
	    	
	    	db.pstmt.close();
	    	db.conn.close();
	    	
	    }	
	 
		//==============================delete==================================================
	

	    public void delete(String rev_no) throws Exception 
	    {

	    	String sql = "delete from rev where rev_no=" + rev_no;
	    	
	    	db.stmt=db.conn.createStatement();
	    	
	    	db.stmt.executeUpdate(sql);
	    	
	    	db.stmt.close();
	    	db.conn.close();
	    }
		//==============================pager==================================================

	    public int content_cnt(String cla, String sword) throws ClassNotFoundException, SQLException
		{
			String addsql="";
	        if(cla.equals("user_id"))
	       	 addsql="where user_id like '%"+sword+"%'";
	        else if(cla.equals("rev_company"))
	       	 addsql="where rev_company '%"+sword+"%'";
	        else if(cla.equals("hash"))
	       	 addsql="where hash like '%"+sword+"%'";
	        
	        String sql="select count(*) as cnt from rev "+addsql;
	        db.stmt=db.conn.createStatement();
	        db.rs=db.stmt.executeQuery(sql);
	        db.rs.next();
	        int result=db.rs.getInt("cnt");
	        return result;
		}
	}