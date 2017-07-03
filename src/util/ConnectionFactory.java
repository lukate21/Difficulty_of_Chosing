package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory 
{
	public static Connection getConnection() 
	{		
		Connection conn = null;
		
		try 
		{		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1522:xe";
			String username = "scott";
			String password = "tiger";
			
			conn = DriverManager.getConnection(url, username, password);
			
		} 
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return conn;
	}
}
