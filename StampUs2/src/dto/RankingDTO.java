package dto;

import java.util.Comparator;

public class RankingDTO implements Comparator<RankingDTO>
{
	private int study_no, rank;
	private String user_id, room_title;
	private double rate;

	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
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
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	
	@Override
	public int compare(RankingDTO o1, RankingDTO o2) {
		if(o1.rate>o2.rate) return -1;
		if(o1.rate<o2.rate) return 1;
		return 0;
	}
	
	
	
	
}
