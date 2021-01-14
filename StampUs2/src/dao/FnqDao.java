package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.DB;
import dto.FnqDto;

public class FnqDao {
	DB db = null;
	
	public FnqDao(){
		db = new DB();
	}
//===============================insert===============================================
	public void insert(FnqDto fdto) throws Exception 
    {

    	// 쿼리 생성
		String sql = "insert into fnq(fnq_no,fnq_type,fnq_title,fnq_q,fnq_a,fnq_img)";
		sql = sql + " values(fnq_seq.nextval,?,?,?,?,?)";
    	// 심부름꾼 생성
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt = db.conn.prepareStatement(sql);
		
		db.pstmt.setString(1, fdto.getFnq_type());
		db.pstmt.setString(2, fdto.getFnq_title());
		db.pstmt.setString(3, fdto.getFnq_q());
		db.pstmt.setString(4, fdto.getFnq_a());
		db.pstmt.setString(5,fdto.getFnq_img());
    	// 쿼리 실행
		db.pstmt.executeUpdate();
    	
		db.pstmt.close();
		db.conn.close();
    }
	
//==============================list==================================================
	public ArrayList<FnqDto> list() throws Exception
    {

    	//쿼리 생성
    	String sql = "select * from fnq ";
    	
    	//심부름꾼 생성
    	db.stmt = db.conn.createStatement();
    	
    	//쿼리 실행
    	db.rs = db.stmt.executeQuery(sql);
    
    	//NoticeDto를 여러 개 담을 수 있는 ArrayList 생성
    	ArrayList<FnqDto> list=new ArrayList<FnqDto>();
    	
    	//BoardDto 하나를 만들고 하나의 레코드를 전달
    	while(db.rs.next()) 
    	{
    		FnqDto fdto=new FnqDto();
    		fdto.setFnq_no(db.rs.getInt("fnq_no"));
    		fdto.setFnq_type(db.rs.getNString("fnq_type"));
    		fdto.setFnq_title(db.rs.getNString("fnq_title"));
    		list.add(fdto);
	}	
    	//ArrayList 객체를 넘긴다
    	return list;	
    }
	
//==============================content==================================================
	
	public FnqDto content(String fnq_no) throws Exception
    {

    	// 쿼리 생성
		String sql = "select * from fnq where fnq_no=" + fnq_no;
    	
    	// 심부름꾼 실행 => ResultSet
    	db.stmt = db.conn.createStatement();
    	
    	db.rs = db.stmt.executeQuery(sql);
    	
    	db.rs.next();
    	
    	FnqDto fdto = new FnqDto();
    	
    	fdto.setFnq_type(db.rs.getString("fnq_type"));
    	fdto.setFnq_no(db.rs.getInt("fnq_no"));
    	fdto.setFnq_q(db.rs.getString("fnq_q"));
    	fdto.setFnq_a(db.rs.getString("fnq_a"));
    	fdto.setFnq_img(db.rs.getString("fnq_img"));
    	
    	return fdto;
    }
	
//==============================update==================================================
	
	 public FnqDto update(String fnq_no) throws Exception
	    {

	    	// 쿼리 생성
			String sql = "select * from fnq where fnq_no=" + fnq_no;
	    	
	    	// 심부름꾼 실행 => ResultSet
	    	db.stmt = db.conn.createStatement();
	    	
	    	db.rs = db.stmt.executeQuery(sql);
	    	
	    	db.rs.next();
	    	
	    	FnqDto fdto = new FnqDto();
	    	
	    	fdto.setFnq_type(db.rs.getString("fnq_type"));
	    	fdto.setFnq_title(db.rs.getString("fnq_title"));
	    	fdto.setFnq_q(db.rs.getString("fnq_q"));
	    	fdto.setFnq_a(db.rs.getString("fnq_a"));
	    	fdto.setFnq_img(db.rs.getString("fnq_img"));
	    	return fdto;
	    }
	 
    	
	//==============================update_ok==================================================
	
	
	 public void update_ok(FnqDto fdto) throws Exception 
	    {

		 String sql = "update fnq set fnq_type=?,fnq_title=?,fnq_q=?,fnq_a=?,fnq_img=?  where fnq_no=?";    	
	    	db.pstmt = db.conn.prepareStatement(sql);
	    	

			db.pstmt = db.conn.prepareStatement(sql);
			db.pstmt.setString(1,fdto.getFnq_type());
			db.pstmt.setString(2, fdto.getFnq_title());
			db.pstmt.setString(3, fdto.getFnq_q());
			db.pstmt.setString (4, fdto.getFnq_a());
			db.pstmt.setString(5, fdto.getFnq_img());
			db.pstmt.setInt(6, fdto.getFnq_no());
	    	// 쿼리 실행
	    	db.pstmt.executeUpdate();
	    	
	    	db.pstmt.close();
	    	db.conn.close();
	    	
	    }	
	
		//==============================delete==================================================
	

	    public void delete(String fnq_no) throws Exception 
	    {

	    	String sql = "delete from fnq where fnq_no=" + fnq_no;
	    	
	    	db.stmt=db.conn.createStatement();
	    	
	    	db.stmt.executeUpdate(sql);
	    	
	    	db.stmt.close();
	    	db.conn.close();
	    }
	 
	}