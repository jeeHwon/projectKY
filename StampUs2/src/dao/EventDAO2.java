package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.EventDTO;
import dto.Study_my_DTO;

public class EventDAO2 {   
      String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
      String uid = "ky";
      String upw = "1234";
      Connection conn;
      
   public EventDAO2() throws Exception{ //디폴트는 같은 패키지에서만 접근가능해서 퍼블릭
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
         public ArrayList<EventDTO> pageList(String cla, String sword,String pager) throws Exception{
            
             int index;  // limit에 들어갈 index번호 생성
             String sql;
             String addsql;
            index=(Integer.parseInt(pager)-1)*10;
            if(cla==""){//검색 조건이 없는 경우 => 모든 글 가져오기
                sql="SELECT event_no,event_title,event_view,event_postday ";
                 sql=sql+" FROM(SELECT ROWNUM AS RM, SELECT event_no,event_title,event_view,event_postday";
                 sql=sql+" FROM(SELECT * FROM review ORDER BY event_no DESC)";
                 sql=sql+") WHERE RM between "+index+" and " +(index+10);
            } 
            if(cla.equals("content")){   //content 필드 검색
               sql="SELECT event_no,event_title,event_view,event_postday ";
                 sql=sql+" FROM(SELECT ROWNUM AS RM, event_no,event_title,event_view,event_postday ";
                 sql=sql+" FROM(SELECT * FROM event where event_content like '%"+sword+"%' ORDER BY event_no DESC)";
                 sql=sql+") WHERE RM between "+index+" and "+(index+10);
                 
                 addsql="where event_content like '%"+sword+"%'";
            }else{   //title 필드 검색
               sql="SELECT event_no,event_title,event_view,event_postday ";
                 sql=sql+" FROM(SELECT ROWNUM AS RM, event_no,event_title,event_view,event_postday ";
                 sql=sql+" FROM(SELECT * FROM event where event_title like '%"+sword+"%' ORDER BY event_no DESC)";
                 sql=sql+") WHERE RM between "+index+" and "+(index+10);
                 
                 addsql="where event_title like '%"+sword+"%'";
            }
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
         //===============================페이징=======================================
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