package log;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class LogDAO {
	private static Connection conn;
	
	 public static Connection getConnection() throws ClassNotFoundException, SQLException
	 {
		try 
		{
			String dbURL= "jdbc:mysql://localhost:3306/machine_error?serverTimezone=UTC";
			//String dbURL= "jdbc:mysql://59.4.169.20:3306/process?serverTimezone=UTC";
			String dbID="root";
			String dbPassword="asdf0825..";
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}
		catch(Exception e)
		{
			e.printStackTrace();//오류가 뭔지 출력
		}
		return conn;
	}
}

