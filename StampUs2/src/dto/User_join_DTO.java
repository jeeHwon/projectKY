package dto;

public class User_join_DTO 
{
	private int user_join_no, study_no, deposit, penalty;
	private String user_id, join_day, end_day;
	private double cnt;
	

	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getPenalty() {
		return penalty;
	}
	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	
	public double getCnt() {
		return cnt;
	}
	public void setCnt(double cnt) {
		this.cnt = cnt;
	}
	public int getUser_join_no() {
		return user_join_no;
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
	public String getJoin_day() {
		return join_day;
	}
	public void setJoin_day(String join_day) {
		this.join_day = join_day;
	}
	
	
	
}
