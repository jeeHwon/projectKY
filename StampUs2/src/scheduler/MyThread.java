package scheduler;

import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 앱이 실행되는 동안 작업을 기다리는 스레드
 */
public class MyThread extends Thread {
    
    private boolean done = false;
    private Timer timer;
    private TimerTask task;
    
    public MyThread (TimerTask task) {
        this.task = task;
    }
    
    public void quit() {
        this.done = true;
        this.interrupt();
    }
    
    public boolean finishing() {
        return (done || Thread.interrupted());
    }

    @Override
    public void run() {
        super.run();
        
        timer = new Timer();
        
        Calendar now = Calendar.getInstance();
        timer.scheduleAtFixedRate(task, now.getTime(), 1000*60*60*24);
        
        while (!finishing()) {
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                break;
            }
        }
        
        timer.cancel();
    }
}