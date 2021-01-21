package dao;

import java.sql.*;
import java.util.ArrayList;
import db.DB;
import dto.FboardDto;

public class FboardDao {
	DB db = null;

	public FboardDao() {
		db = new DB();
	}
	
	public void write_ok(FboardDto fdto) throws SQLException {

		String sql = "insert into fboard(id, title, userid, content, fboard_img, writeday)";
		sql += " values(fboard_seq.nextval,?, ?, ?, ?, sysdate)";

		// 심부름꾼 생성
		db.pstmt = db.conn.prepareStatement(sql);

		db.pstmt.setString(1, fdto.getTitle());
		db.pstmt.setString(2, fdto.getUserid());
		db.pstmt.setString(3, fdto.getContent());
		db.pstmt.setString(4, fdto.getFboard_img());

		// 쿼리 실행
		db.pstmt.executeUpdate();
	}

	public void update_ok(FboardDto fdto) throws SQLException {

		String sql = "update fboard set title=?, content=?, fboard_img=? where id=?";

		db.pstmt = db.conn.prepareStatement(sql);
		
		if(fdto.getFboard_img() == null) {
	         fdto.setFboard_img("");
	      }

		db.pstmt.setString(1, fdto.getTitle());
		db.pstmt.setString(2, fdto.getContent());
		db.pstmt.setString(3, fdto.getFboard_img());
		db.pstmt.setInt(4, fdto.getId());

		db.pstmt.executeUpdate();

	}

	public void add_readnum(String id) throws SQLException {

		String sql = "update fboard set readnum = readnum + 1 where id=" + id;

		db.pstmt = db.conn.prepareStatement(sql);

		db.pstmt.executeUpdate();
	}

	public void delete_fboard(String id) throws SQLException {
		String sql = "delete from fboard where id = " + id;

		db.pstmt = db.conn.prepareStatement(sql);

		db.pstmt.executeUpdate();
	}

	public ArrayList<FboardDto> list(String cla, String word, String pager) throws SQLException {

		int index = get_index(pager);

		index = (index - 1) * 10;

		// 검색필드와 검색단어의 값을 request
		// 쿼리 생성
		String sql;
		if("".equals(cla)){//검색 조건이 없는 경우 => 모든 글 가져오기
            sql = "SELECT id, readnum, title, content, userid, writeday ";
            sql += " FROM(SELECT ROWNUM AS RM, id, readnum, title, content, userid, writeday";
            sql += " FROM(SELECT * FROM fboard ORDER BY writeday DESC)";
            sql += ") WHERE RM between "+ index +" and " + (index + 10);
        } else if("userid".equals(cla)){   //content 필드 검색
        	sql= "SELECT id, readnum, title, content, userid, writeday ";
	        sql += " FROM(SELECT ROWNUM AS RM, id, readnum, title, content, userid, writeday ";
	        sql += " FROM(SELECT * FROM fboard where userid like '%" + word + "%' ORDER BY writeday DESC)";
	        sql += ") WHERE RM between " + index + " and " + (index + 10);
        } else {   //title 필드 검색
        	sql = "SELECT id, readnum, title, content, userid, writeday ";
            sql += " FROM(SELECT ROWNUM AS RM, id, readnum, title, content, userid, writeday ";
            sql += " FROM(SELECT * FROM fboard where title like '%" + word + "%' ORDER BY writeday DESC)";
            sql += ") WHERE RM between " + index + " and "+(index + 10);
        }		
		
		db.pstmt = db.conn.prepareStatement(sql);
		db.rs = db.pstmt.executeQuery();

		ArrayList<FboardDto> list = new ArrayList<FboardDto>();
		while (db.rs.next()) {
			FboardDto fdto = new FboardDto();
			fdto.setId(db.rs.getInt("id"));
			fdto.setTitle(db.rs.getString("title"));
			fdto.setUserid(db.rs.getString("userid"));
			fdto.setContent(db.rs.getString("content"));
			fdto.setReadnum(db.rs.getInt("readnum"));
			fdto.setWriteday(db.rs.getString("writeday"));
            
			list.add(fdto);
		}
 
		return list;
	}

	public int get_total_page_cnt() throws SQLException {

		String sql = "select count(*) as cnt from fboard";
		db.pstmt = db.conn.prepareStatement(sql);
		db.rs = db.pstmt.executeQuery();
		db.rs.next();
		int page_cnt = (int) Math.ceil(db.rs.getInt("cnt") * 0.1);

		if(db.rs.getInt("cnt")%10 == 0) 
            page_cnt--;
        return page_cnt;

	}

	public int get_page_start(String pager) {
		int index = get_index(pager);
		int pstart = (int) Math.ceil(index * 0.1) * 10 - 9;
		return pstart;
	}

	public int get_page_end(String pager, int page_cnt) {
		int index = get_index(pager);
		int pend = (int) Math.ceil(index * 0.1) * 10;

		if (page_cnt < pend) {
			pend = page_cnt;
		}

		return pend;
	}

	public int get_index(String pager) {
		int index;

		if (pager == null) {
			index = 1;
		} else {
			index = Integer.parseInt(pager);
		}
		return index;
	}
	public FboardDto content(int id) throws SQLException {
		String sql = "select * from fboard where id=" + id;
		
		db.pstmt = db.conn.prepareStatement(sql);
		db.rs = db.pstmt.executeQuery();
		db.rs.next();
		FboardDto fdto = new FboardDto();
		fdto.setId(db.rs.getInt("id"));
		fdto.setTitle(db.rs.getString("title"));
		fdto.setUserid(db.rs.getString("userid"));
		fdto.setContent(db.rs.getString("content"));
		fdto.setReadnum(db.rs.getInt("readnum"));
		fdto.setWriteday(db.rs.getString("writeday"));
		fdto.setFboard_img(db.rs.getString("fboard_img"));
		
		return fdto;
	}

}
