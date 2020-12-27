package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DB 
{
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@211.205.104.35:1521:xe";
	private String uid = "ky";
	private String upw = "1234";
	public Connection conn = null;
	public Statement stmt = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	
	public DB() 
	{	
		try 
		{
			Class.forName(driver);
		    conn = DriverManager.getConnection(url, uid, upw);
		}
		catch(Exception e) 
		{
			System.out.println("DB Connection Error");
		}

	}
	
	public void close() 
	{
		try 
		{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		catch(Exception e) 
		{
			System.out.println("DB is not closed");
		}
	}
	
}
