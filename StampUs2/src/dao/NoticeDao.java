package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.DB;
import custom.dto.NoticeDto;

public class NoticeDao {
	DB db = null;
	
	public NoticeDao(){
		db = new DB();
	}
//===============================insert===============================================
	public void insert(NoticeDto ndto) throws Exception 
    {

    	// 쿼리 생성
		String sql = "insert into notice(notice_no,notice_title,notice_content,notice_file,notice_postday)";
		sql = sql + " values(notice_seq.nextval,?,?,?,sysdate)";
    	// 심부름꾼 생성
		db.pstmt = db.conn.prepareStatement(sql);
		db.pstmt.setString(1, ndto.getNotice_title());
		db.pstmt.setString(2, ndto.getNotice_content());
		db.pstmt.setString(3, ndto.getNotice_file());
    	
    	// 쿼리 실행
		db.pstmt.executeUpdate();
    	
		db.pstmt.close();
		db.conn.close();
    }
//==============================list==================================================
	public ArrayList<NoticeDto> list() throws Exception
    {

    	//쿼리 생성
    	String sql = "select * from notice ";
    	
    	//심부름꾼 생성
    	db.stmt = db.conn.createStatement();
    	
    	//쿼리 실행
    	db.rs = db.stmt.executeQuery(sql);
    
    	//NoticeDto를 여러 개 담을 수 있는 ArrayList 생성
    	ArrayList<NoticeDto> list=new ArrayList<NoticeDto>();
    	
    	//BoardDto 하나를 만들고 하나의 레코드를 전달
    	while(db.rs.next()) 
    	{
    		NoticeDto ndto=new NoticeDto();
    		ndto.setNotice_no(db.rs.getInt("notice_no"));
    		ndto.setNotice_title(db.rs.getNString("notice_title"));
    		ndto.setNotice_view(db.rs.getInt("notice_view"));
    		ndto.setNotice_postday(db.rs.getNString("notice_postday"));
    		list.add(ndto);
	}	
    	//ArrayList 객체를 넘긴다
    	return list;	
    }
	
//==============================content==================================================
	
	public NoticeDto content(String notice_no) throws Exception
    {

    	// 쿼리 생성
		String sql = "select * from notice where notice_no=" + notice_no;
    	
    	// 심부름꾼 실행 => ResultSet
    	db.stmt = db.conn.createStatement();
    	
    	db.rs = db.stmt.executeQuery(sql);
    	
    	db.rs.next();
    	
    	NoticeDto ndto = new NoticeDto();
    	
    	ndto.setNotice_no(db.rs.getInt("notice_no"));
    	ndto.setNotice_title(db.rs.getString("notice_title"));
    	ndto.setNotice_content(db.rs.getString("notice_content"));
    	ndto.setNotice_file(db.rs.getString("notice_file"));
    	ndto.setNotice_postday(db.rs.getString("notice_postday"));
    	ndto.setNotice_view(db.rs.getInt("notice_view"));
    	
    	return ndto;
    }
//==============================update==================================================
	
	 public NoticeDto update(String notice_no) throws Exception
	    {

	    	// 쿼리 생성
	    	String sql = "select * from notice where notice_no=" + notice_no;
	    	
	    	// 심부름꾼 실행 => ResultSet
	    	db.stmt = db.conn.createStatement();
	    	
	    	db.rs = db.stmt.executeQuery(sql);
	    	
	    	db.rs.next();
	    	
	    	NoticeDto ndto = new NoticeDto();
	    	
	    	ndto.setNotice_no(db.rs.getInt("notice_no"));
	    	ndto.setNotice_title(db.rs.getString("notice_title"));
	    	ndto.setNotice_content(db.rs.getString("notice_content"));
	    	ndto.setNotice_file(db.rs.getString("notice_file"));
	    	ndto.setNotice_postday(db.rs.getString("notice_postday"));
	    	ndto.setNotice_view(db.rs.getInt("notice_view"));
	    	return ndto;
	    }
	    
	//==============================update_ok==================================================
	
	
	 public void update_ok(NoticeDto ndto) throws Exception 
	    {

			String sql = "update notice set notice_title=?,notice_content=?,notice_file=?,notice_postday=sysdate where notice_no=?";
	    	
	    	db.pstmt = db.conn.prepareStatement(sql);
	    	
	    	db.pstmt = db.conn.prepareStatement(sql);
			db.pstmt.setString(1, ndto.getNotice_title());
			db.pstmt.setString(2, ndto.getNotice_content());
			db.pstmt.setString(3, ndto.getNotice_file());
			db.pstmt.setInt(4, ndto.getNotice_no());
	    	
	    	
	    	db.pstmt.executeUpdate();
	    	
	    	db.pstmt.close();
	    	db.conn.close();
	    	
	    }	
	
		//==============================delete==================================================
	

	    public void delete(String notice_no) throws Exception 
	    {

	    	String sql = "delete from notice where notice_no=" + notice_no;
	    	
	    	db.stmt=db.conn.createStatement();
	    	
	    	db.stmt.executeUpdate(sql);
	    	
	    	db.stmt.close();
	    	db.conn.close();
	    }
	    
	}