package dto;

public class GoalDTO {

	private int goal_no, goal_room_no;
	private String user_id, isgoal, goal_day;
	
	public int getGoal_no() {
		return goal_no;
	}
	public void setGoal_no(int goal_no) {
		this.goal_no = goal_no;
	}
	public int getGoal_room_no() {
		return goal_room_no;
	}
	public void setGoal_room_no(int goal_room_no) {
		this.goal_room_no = goal_room_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getIsgoal() {
		return isgoal;
	}
	public void setIsgoal(String isgoal) {
		this.isgoal = isgoal;
	}
	public String getGoal_day() {
		return goal_day;
	}
	public void setGoal_day(String goal_day) {
		this.goal_day = goal_day;
	}
	
	
	
}
