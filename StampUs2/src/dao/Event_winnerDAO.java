package dao;
import java.sql.ResultSet;
import java.util.ArrayList;
import db.DB;
import dto.Event_winnerDTO;

public class Event_winnerDAO {   
	DB db = null;
	String sql;
	public Event_winnerDAO(){
		db = new DB();
	}
	//=================================write_ok==================================================
	public String write_ok(Event_winnerDTO dto) throws Exception {

		sql="insert into event_winner (event_winner_no,event_no,Event_winner_adm,event_winnerid, Event_winner_title, Event_winner_content, Event_winner_img) ";
		sql=sql +" values (event_winner_seq.nextval,?,?,?,?,?,?)";

		db.pstmt=db.conn.prepareStatement(sql);
		db.pstmt.setInt(1, dto.getEvent_no());
		db.pstmt.setString(2, dto.getEvent_winner_adm());
		db.pstmt.setString(3, dto.getEvent_winnerid());
		db.pstmt.setString(4, dto.getEvent_winner_title());
		db.pstmt.setString(5, dto.getEvent_winner_content());
		db.pstmt.setString(6, dto.getEvent_winner_img());

		db.pstmt.executeUpdate();

		//글을 올리자마자 content로 가기
		sql="select max(event_winner_no) as max from event_winner"; //방금올린글 no 가져오기 
		db.pstmt=db.conn.prepareStatement(sql);
		ResultSet rs = db.pstmt.executeQuery();
		rs.next();
		String event_winner_no = rs.getString("max");
		return event_winner_no;
	}
	//=================================update_ok==================================================
	public void update_ok(Event_winnerDTO dto) throws Exception {

		String sql="update event_winner set Event_winner_title=?, Event_winner_content=?, Event_winner_img=? where event_no=?";

		db.pstmt=db.conn.prepareStatement(sql);

		if(dto.getEvent_winner_img()==null) {
			dto.setEvent_winner_img("");
		}
		db.pstmt.setString(1, dto.getEvent_winner_title());
		db.pstmt.setString(2, dto.getEvent_winner_content());
		db.pstmt.setString(3, dto.getEvent_winner_img());
		db.pstmt.setInt(4, dto.getEvent_no());

		db.pstmt.executeUpdate();

		db.close();
	}
	//=================================delete==================================================
	public void delete(String event_no) throws Exception {

		sql="delete from event_winner where event_no="+event_no;
		db.pstmt=db.conn.prepareStatement(sql);
		db.pstmt.executeUpdate();

		db.close();
	}
	//=====================content.jsp===============================
	public Event_winnerDTO content(int event_winner_no) throws Exception{

		sql="select * from event_winner where event_winner_no="+event_winner_no;
		db.pstmt=db.conn.prepareStatement(sql);
		db.rs = db.pstmt.executeQuery();
		db.rs.next();
		Event_winnerDTO dto=new Event_winnerDTO();
		dto.setEvent_winner_no(db.rs.getInt("event_winner_no"));
		dto.setEvent_winner_title(db.rs.getString("event_winner_title"));
		dto.setEvent_winner_content(db.rs.getString("event_winner_content"));
		dto.setEvent_winner_img(db.rs.getString("event_winner_img"));
		dto.setEvent_winner_postday(db.rs.getString("event_winner_postday"));
		dto.setEvent_winner_view(db.rs.getString("event_winner_view"));
		
		return dto; 
	}
	//=====================list.jsp===============================
	public ArrayList<Event_winnerDTO> list(String cla, String sword,String pager) throws Exception{
		String orderby = "";
		orderby=" order by event_winner_no desc)";
		int index;  // limit에 들어갈 index번호 생성
		index=(Integer.parseInt(pager)-1)*10;
		if(cla==""){//검색 조건이 없는 경우 => 모든 글 가져오기
			sql="SELECT event_winner_no,Event_winner_title,Event_winner_view,Event_winner_postday ";
			sql=sql+" FROM(SELECT ROWNUM AS RM, SELECT event_no,Event_winner_title,Event_winner_view,Event_winner_postday";
			sql=sql+" FROM(SELECT * FROM event_winner "+orderby;
			sql=sql+") WHERE RM between "+index+" and " +(index+10);
		} 
		if(cla.equals("content")){   //content 필드 검색
			sql="SELECT event_winner_no,Event_winner_title,Event_winner_view,Event_winner_postday ";
			sql=sql+" FROM(SELECT ROWNUM AS RM, event_winner_no,Event_winner_title,Event_winner_view,Event_winner_postday ";
			sql=sql+" FROM(SELECT * FROM event_winner where Event_winner_content like '%"+sword+"%'" +orderby;
			sql=sql+") WHERE RM between "+index+" and "+(index+10);
		}else{   //title 필드 검색
			sql="SELECT event_winner_no,Event_winner_title,Event_winner_view,Event_winner_postday ";
			sql=sql+" FROM(SELECT ROWNUM AS RM, event_winner_no,Event_winner_title,Event_winner_view,Event_winner_postday ";
			sql=sql+" FROM(SELECT * FROM event_winner where Event_winner_title like '%"+sword+"%'"+orderby;
			sql=sql+") WHERE RM between "+index+" and "+(index+10);
		}
		db.pstmt=db.conn.prepareStatement(sql);
		db.rs=db.pstmt.executeQuery();
		ArrayList<Event_winnerDTO> list=new ArrayList<Event_winnerDTO>();
		
		while(db.rs.next()) {
			Event_winnerDTO dto=new Event_winnerDTO();
			dto.setEvent_winner_no(db.rs.getInt("event_winner_no"));
			dto.setEvent_winner_title(db.rs.getString("Event_winner_title"));
			dto.setEvent_winner_postday(db.rs.getString("Event_winner_postday"));
			dto.setEvent_winner_view(db.rs.getString("Event_winner_view"));
			
			list.add(dto);
		}
		return list; //return이 있으면 conn.close()안됨
	}
	//===============================페이징=======================================
	public int getTotalPage() throws Exception {
		sql="select count(*) as cnt from event_winner";
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
}