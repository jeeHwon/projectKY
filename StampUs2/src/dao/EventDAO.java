package dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import db.DB;
import dto.EventDTO;

public class EventDAO {   
	DB db = null;
	String sql;
	public EventDAO(){
		db = new DB();
	}
	//=================================write_ok==================================================
	public String write_ok(EventDTO dto) throws Exception {

		sql="insert into event (event_no,event_adm, event_title, event_content, event_img, event_postday) ";
		sql=sql +" values (event_no_seq.nextval,?,?,?,?,SYSDATE)";

		db.pstmt=db.conn.prepareStatement(sql);
		db.pstmt.setString(1, dto.getEvent_adm());
		db.pstmt.setString(2, dto.getEvent_title());
		db.pstmt.setString(3, dto.getEvent_content());
		db.pstmt.setString(4, dto.getEvent_img());

		db.pstmt.executeUpdate();

		//글을 올리자마자 content로 가기
		sql="select max(event_no) as max from event"; //방금올린글 no 가져오기 
		db.pstmt=db.conn.prepareStatement(sql);
		ResultSet rs = db.pstmt.executeQuery();
		rs.next();
		String event_no = rs.getString("max");
		return event_no;
	}
	//=================================update_ok==================================================
	public void update_ok(EventDTO dto) throws Exception {

		String sql="update event set event_title=?, event_content=?, event_img=? where event_no=?";

		db.pstmt=db.conn.prepareStatement(sql);

		if(dto.getEvent_img()==null) {
			dto.setEvent_img("");
		}
		db.pstmt.setString(1, dto.getEvent_title());
		db.pstmt.setString(2, dto.getEvent_content());
		db.pstmt.setString(3, dto.getEvent_img());
		db.pstmt.setInt(4, dto.getEvent_no());

		db.pstmt.executeUpdate();

		db.close();
	}
	//=================================delete==================================================
	public void delete(String event_no) throws Exception {
		sql="delete from event_dat where event_no="+event_no;
		db.pstmt=db.conn.prepareStatement(sql);	  
		db.pstmt.executeUpdate();

		sql="delete from event where event_no="+event_no;
		db.pstmt=db.conn.prepareStatement(sql);
		db.pstmt.executeUpdate();

		db.close();
	}
	//=====================content.jsp===============================
	public EventDTO content(int event_no) throws Exception{

		sql="select * from event where event_no="+event_no;
		db.pstmt=db.conn.prepareStatement(sql);
		db.rs = db.pstmt.executeQuery();
		db.rs.next();
		EventDTO dto=new EventDTO();
		dto.setEvent_no(db.rs.getInt("event_no"));
		dto.setEvent_title(db.rs.getString("event_title"));
		dto.setEvent_content(db.rs.getString("event_content"));
		dto.setEvent_img(db.rs.getString("event_img"));
		dto.setEvent_postday(db.rs.getString("event_postday"));
		dto.setEvent_view(db.rs.getString("event_view"));

		return dto; 
	}
	//=====================list.jsp===============================
	public ArrayList<EventDTO> list(String sort,String cla, String sword,String pager) throws Exception{
		String orderby = "";
		if(sort.equals("1")) {
			orderby=" order by event_view desc)";
		}else if(sort.equals("2")) {
			orderby=" order by event_postday)";
		}else {
			orderby=" order by event_no desc)";
		}
		int index;  // limit에 들어갈 index번호 생성
		index=(Integer.parseInt(pager)-1)*10;
		if(cla==""){//검색 조건이 없는 경우 => 모든 글 가져오기
			sql="SELECT event_no,event_title,event_view,event_postday ";
			sql=sql+" FROM(SELECT ROWNUM AS RM, SELECT event_no,event_title,event_view,event_postday";
			sql=sql+" FROM(SELECT * FROM event "+orderby;
			sql=sql+") WHERE RM between "+index+" and " +(index+10);
		} 
		if(cla.equals("content")){   //content 필드 검색
			sql="SELECT event_no,event_title,event_view,event_postday ";
			sql=sql+" FROM(SELECT ROWNUM AS RM, event_no,event_title,event_view,event_postday ";
			sql=sql+" FROM(SELECT * FROM event where event_content like '%"+sword+"%'" +orderby;
			sql=sql+") WHERE RM between "+index+" and "+(index+10);
		}else{   //title 필드 검색
			sql="SELECT event_no,event_title,event_view,event_postday ";
			sql=sql+" FROM(SELECT ROWNUM AS RM, event_no,event_title,event_view,event_postday ";
			sql=sql+" FROM(SELECT * FROM event where event_title like '%"+sword+"%'"+orderby;
			sql=sql+") WHERE RM between "+index+" and "+(index+10);
		}
		db.pstmt=db.conn.prepareStatement(sql);
		db.rs=db.pstmt.executeQuery();
		ArrayList<EventDTO> list=new ArrayList<EventDTO>();
		
		while(db.rs.next()) {
			EventDTO dto=new EventDTO();
			dto.setEvent_no(db.rs.getInt("event_no"));
			dto.setEvent_title(db.rs.getString("event_title"));
			dto.setEvent_postday(db.rs.getString("event_postday"));
			dto.setEvent_view(db.rs.getString("event_view"));
			
			list.add(dto);
		}
		return list; //return이 있으면 conn.close()안됨
	}
	
	public void sort_list(String sort) {
		
	}
	//===============================페이징=======================================
	public int getTotalPage() throws Exception {
		sql="select count(*) as cnt from event";
		db.pstmt=db.conn.prepareStatement(sql);
		db.rs=db.pstmt.executeQuery();
		db.rs.next();
		int page_cnt;
		page_cnt=db.rs.getInt("cnt")/10+1;

		if(db.rs.getInt("cnt")%10 == 0) 
			page_cnt--;
		return page_cnt;
	}
	public int getPstart(int page_cnt, String pager) {
		int pstart;

		pstart=Integer.parseInt(pager)/10; 
		if(Integer.parseInt(pager)%10 ==0)
			pstart=pstart-1;

		pstart=Integer.parseInt(pstart+"1");
		return pstart;
	}
	public int getPend(int page_cnt,int pstart) {
		int pend=pstart+9;
		if(page_cnt < pend)
			pend=page_cnt;
		return pend;
	}
	//=================이벤트제목가져오기======================
	public String getEvent_title(int event_no) throws SQLException {
		sql="select event_title from event where event_no="+event_no;
		db.pstmt = db.conn.prepareStatement(sql);
		db.rs = db.pstmt.executeQuery();
		db.rs.next();
		return db.rs.getString("event_title");
		
	}
}