package dto;

public class Study_join_DTO 
{
	private int user_join_no, study_no;
	private String user_id, study_title, study_end, study_photo, daily_check;
	
	public int getUser_join_no() {
		return user_join_no;
	}
	public String getStudy_title() {
		return study_title;
	}
	public void setStudy_title(String study_title) {
		this.study_title = study_title;
	}
	public String getStudy_end() {
		return study_end;
	}
	public void setStudy_end(String study_end) {
		this.study_end = study_end;
	}
	public String getStudy_photo() {
		return study_photo;
	}
	public void setStudy_photo(String study_photo) {
		this.study_photo = study_photo;
	}
	public String getDaily_check() {
		return daily_check;
	}
	public void setDaily_check(String daily_check) {
		this.daily_check = daily_check;
	}
	public void setUser_join_no(int user_join_no) {
		this.user_join_no = user_join_no;
	}
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
