package Shopping;
import java.sql.*;

public class ConnectionProvider {
	
	 

	public static Connection getCon() throws ClassNotFoundException, SQLException
	{
		try
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","1962");
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
		    return null;
		}
		
	}
	
}
