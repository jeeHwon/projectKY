package scheduler;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class Listener implements ServletContextListener {

    private MyThread myThread = null;
 
    /**
     * 앱 시작시 불리는 함수
     */
    public void contextInitialized(ServletContextEvent sce) {
        if ((myThread == null) || (!myThread.isAlive())) {
            myThread = new MyThread(new MyTask());
            myThread.start();
            System.out.println("웹 어플리케이션 시작!!");
        }
    }
    /**
     * 앱 종료시 불리는 함수 
     */
    public void contextDestroyed(ServletContextEvent sce){
        if (myThread != null && myThread.isAlive()) {
            myThread.quit();
        }
    }
}