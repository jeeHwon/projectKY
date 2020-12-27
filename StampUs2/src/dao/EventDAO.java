package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EventDTO;
import dto.Study_my_DTO;

//event_view 기본값 0 으로 설정하기 
//private String no;
//private String adm;
//private String title;
//private String content;
//private String img;
//private String view;
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
		pstmt.setString(1, dto.getAdm());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getImg());

		//쿼리실행
		pstmt.executeUpdate();
		
		//글을 올리자마자 content로 가기
		sql="select max(event_no) as max from event"; //방금올린글 no 가져오기 
		pstmt=conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String no = rs.getString("max");
	    return no;
	}
	//=================================update_ok==================================================
	public void update_ok(EventDTO dto) throws Exception {
		
		//쿼리생성
		String sql="update event set event_title=?, event_content=?, event_img=? where event_no=?";
		
		//심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		if(dto.getImg()==null) {
			dto.setImg("");
		}
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getContent());
		pstmt.setString(3, dto.getImg());
		pstmt.setString(4, dto.getNo());
		
		//쿼리실행
		pstmt.executeUpdate();
		
		//자원해제
		conn.close();
	}
	//=================================delete==================================================
	public void delete(String no) throws Exception {
		
		//쿼리생성
		String sql="delete from event where event_no="+no;
		
		//심부름꾼
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		//쿼리실행
		pstmt.executeUpdate();
		
		//자원해제
		conn.close();
	}
	//=====================list.jsp===============================
		public ArrayList<EventDTO> list() throws Exception{
			//쿼리생성
			String sql="select * from event order by event_no desc";
			//심부름꾼
			PreparedStatement pstmt=conn.prepareStatement(sql);
			//쿼리실행
			ResultSet rs = pstmt.executeQuery();
			
			//보드디티오를 여러개 담을 수 있는 어레이리스트생성
			ArrayList<EventDTO> list=new ArrayList<EventDTO>();
			
			while(rs.next()) {
				EventDTO dto=new EventDTO();
				dto.setNo(rs.getString("event_no"));
				dto.setTitle(rs.getString("event_title"));
				dto.setPostday(rs.getString("event_postday"));
				dto.setView(rs.getString("event_view"));
				
				list.add(dto);
			}
			return list; //return이 있으면 conn.close()안됨
		}
		//=====================content.jsp===============================
		public EventDTO content(String no) throws Exception{
			
			//쿼리생성
			String sql="select * from event where event_no="+no;
			//심부름꾼
			PreparedStatement pstmt=conn.prepareStatement(sql);
			//쿼리실행
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			EventDTO dto=new EventDTO();
			dto.setNo(rs.getString("event_no"));
			dto.setTitle(rs.getString("event_title"));
			dto.setContent(rs.getString("event_content"));
			dto.setImg(rs.getString("event_img"));
			dto.setPostday(rs.getString("event_postday"));
			dto.setView(rs.getString("event_view"));

			return dto; //return이 있으면 conn.close()안됨
		}
}
