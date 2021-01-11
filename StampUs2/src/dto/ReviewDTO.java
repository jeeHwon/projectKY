package dto;

public class ReviewDTO {

	private int review_no,review_view;
	private String user_id,review_title,review_content,review_file,review_postday,hash;
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getReview_view() {
		return review_view;
	}
	public void setReview_view(int review_view) {
		this.review_view = review_view;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_file() {
		return review_file;
	}
	public void setReview_file(String review_file) {
		this.review_file = review_file;
	}
	public String getReview_postday() {
		return review_postday;
	}
	public void setReview_postday(String review_postday) {
		this.review_postday = review_postday;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
}
