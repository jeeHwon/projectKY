package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.DB;
import dto.FnqDto;

public class FnqlistDao {
	DB db = null;
	public FnqlistDao(){
		db = new DB();
	}
	//==============================list전체==================================================
		public ArrayList<FnqDto> list0() throws Exception
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
//==============================list인증 및 사용==================================================
		
	public ArrayList<FnqDto> list1() throws Exception
    {

    	//쿼리 생성
    	String sql = "select * from fnq where fnq_type='인증 및 사용'";
    	
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
	//==============================list결제==================================================

	public ArrayList<FnqDto> list2() throws Exception
    {

    	//쿼리 생성
    	String sql = "select * from fnq where fnq_type='결제'";
    	
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
	//==============================list회원==================================================

	public ArrayList<FnqDto> list3() throws Exception
    {

    	//쿼리 생성
    	String sql = "select * from fnq where fnq_type='회원'";
    	
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
	//==============================list사이트 이용==================================================

	public ArrayList<FnqDto> list4() throws Exception
    {

    	//쿼리 생성
    	String sql = "select * from fnq where fnq_type='사이트 이용'";
    	
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
}
