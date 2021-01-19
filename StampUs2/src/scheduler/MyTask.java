package scheduler;

import dao.*;
import java.util.TimerTask;

public class MyTask extends TimerTask {

    @Override
    public void run(){
        
    	try 
    	{
    		User_join_DAO ujDAO=new User_join_DAO();
    		ujDAO.getPenalty();
    		System.out.println("실행중");
    	}
    	catch(Exception e) 
    	{

    	}
    }
}