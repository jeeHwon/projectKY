package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.EventDTO;
import dto.Study_my_DTO;

public class EventDAO {	
	   String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	   String uid = "ky";
	   String upw = "1234";
	   Connection conn;
	   
	public EventDAO() throws Exception{ //디폴트는 같은 패키지에서만 접근가능해서 퍼블릭
		Class.forName("oracle.jdbc.driver.OracleDriver"); //기능은 무조건 메소드내에서만 실행되기때문에 생성자를 만든다
		conn = DriverManager.getConnection(url, uid, upw);	
	}
	//=================================write_ok==================================================
	public String write_ok(EventDTO dto) throws Exception {
	
		//쿼리생성
		String sql="insert into event (event_no,event_adm, event_title, event_content, event_img, event_postday) ";
		sql=sql +" values (event_no_seq.nextval,?,?,?,?,SYSDATE)";
		
		//심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEvent_adm());
		pstmt.setString(2, dto.getEvent_title());
		pstmt.setString(3, dto.getEvent_content());
		pstmt.setString(4, dto.getEvent_img());

		//쿼리실행
		pstmt.executeUpdate();
		
		//글을 올리자마자 content로 가기
		sql="select max(event_no) as max from event"; //방금올린글 no 가져오기 
		pstmt=conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String event_no = rs.getString("max");
	    return event_no;
	}
	//=================================update_ok==================================================
	public void update_ok(EventDTO dto) throws Exception {
		
		//쿼리생성
		String sql="update event set event_title=?, event_content=?, event_img=? where event_no=?";
		
		//심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		if(dto.getEvent_img()==null) {
			dto.setEvent_img("");
		}
		pstmt.setString(1, dto.getEvent_title());
		pstmt.setString(2, dto.getEvent_content());
		pstmt.setString(3, dto.getEvent_img());
		pstmt.setInt(4, dto.getEvent_no());
		
		//쿼리실행
		pstmt.executeUpdate();
		
		//자원해제
		conn.close();
	}
	//=================================delete==================================================
	public void delete(String event_no) throws Exception {
		
		//쿼리생성
		String sql="delete from event where event_no="+event_no;
		
		//심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		//쿼리실행
		pstmt.executeUpdate();
		
		//자원해제
		conn.close();
	}
		//=====================content.jsp===============================
		public EventDTO content(int event_no) throws Exception{
			
			//쿼리생성
			String sql="select * from event where event_no="+event_no;
			//심부름꾼
			PreparedStatement pstmt=conn.prepareStatement(sql);
			//쿼리실행
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			EventDTO dto=new EventDTO();
			dto.setEvent_no(rs.getInt("event_no"));
			dto.setEvent_title(rs.getString("event_title"));
			dto.setEvent_content(rs.getString("event_content"));
			dto.setEvent_img(rs.getString("event_img"));
			dto.setEvent_postday(rs.getString("event_postday"));
			dto.setEvent_view(rs.getString("event_view"));
			
			return dto; //return이 있으면 conn.close()안됨
		}
			//=====================list.jsp===============================
			//페이징처리를 위한 객체 전달받기
			public ArrayList<EventDTO> list() throws Exception{
				//쿼리생성 - 정렬된 데이터 가져오기
				String sql="select * from event order by event_no desc";
				//2 정렬된 데이터에서 순서번호 붙이기
				sql="select rownum rnum, event_no, event_adm, event_title, event_postday, event_view from ("+sql+")";
				//3.원하는 부분에 해당되는 데이터 가져오기
				sql="select event_no, event_adm, event_title, event_postday, event_view from ("+sql+")"
						+" where rnum between ? and ? ";
				//심부름꾼
				PreparedStatement pstmt=conn.prepareStatement(sql);
				//쿼리실행
				ResultSet rs = pstmt.executeQuery();
				
				//보드디티오를 여러개 담을 수 있는 어레이리스트생성
				ArrayList<EventDTO> list=new ArrayList<EventDTO>();
				
				while(rs.next()) {
					EventDTO dto=new EventDTO();
					dto.setEvent_no(rs.getInt("event_no"));
					dto.setEvent_title(rs.getString("event_title"));
					dto.setEvent_postday(rs.getString("event_postday"));
					dto.setEvent_view(rs.getString("event_view"));
					
					list.add(dto);
				}
				return list; //return이 있으면 conn.close()안됨
			}
			public ArrayList<EventDTO> pageList(String pager) throws Exception{
			   
			    // limit에 들어갈 index번호 생성
			    int index;  // limit에 전달할 index값
//			    int pager;  // 현재 나타내고자 하는 페이지 값을 저장
			    if(pager==null){
			    	pager="1";
			    }
			    // index 만들기
			    index=(Integer.parseInt(pager)-1)*10;
			    // 쿼리 생성
			     String sql = "select * from (select row_number() over (order by event_no desc) num, A.* from event A order by event_no desc) where num between " 
			    				+ index + " and " + (index + 10);
			    // 심부름꾼생성
			    PreparedStatement pstmt=conn.prepareStatement(sql);
			    // 쿼리 실행 => ResultSet
			    ResultSet rs=pstmt.executeQuery();
			    ArrayList<EventDTO> list=new ArrayList<EventDTO>();
				
				while(rs.next()) {
					EventDTO dto=new EventDTO();
					dto.setEvent_no(rs.getInt("event_no"));
					dto.setEvent_title(rs.getString("event_title"));
					dto.setEvent_postday(rs.getString("event_postday"));
					dto.setEvent_view(rs.getString("event_view"));
					
					list.add(dto);
				}
				return list; //return이 있으면 conn.close()안됨
			}
			public int getTotalPage() throws Exception {
			  	 String sql="select count(*) as cnt from event";
			     PreparedStatement pstmt=conn.prepareStatement(sql);
		         ResultSet rs=pstmt.executeQuery();
		         rs.next();
		         int page_cnt;
		         page_cnt=rs.getInt("cnt")/10+1;
		         
		         if(rs.getInt("cnt")%10 == 0) 
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
