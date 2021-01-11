package dto;

public class Review_dat_DTO {
	private int review_dat_no,review_no;
	private String user_id,review_dat_content,review_dat_day;
	
	public int getReview_dat_no() {
		return review_dat_no;
	}
	public void setReview_dat_no(int review_dat_no) {
		this.review_dat_no = review_dat_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_dat_content() {
		return review_dat_content;
	}
	public void setReview_dat_content(String review_dat_content) {
		this.review_dat_content = review_dat_content;
	}
	public String getReview_dat_day() {
		return review_dat_day;
	}
	public void setReview_dat_day(String review_dat_day) {
		this.review_dat_day = review_dat_day;
	}
}
