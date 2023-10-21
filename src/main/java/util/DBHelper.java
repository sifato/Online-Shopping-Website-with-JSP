package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class DBHelper {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/zepping?useUnicode=true&characterEncoding=UTF-8";
	private static final String USER = "root";
	private static final String PASSWORD = "1234";

	private static Connection coon = null;
	
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	
	public static Connection getConnection() throws SQLException {
		if (coon == null) {
			coon = DriverManager.getConnection(URL, USER, PASSWORD);
			return coon;
		}
		return coon;
	}
	
	
	public static void relsaseResource(ResultSet rs,PreparedStatement pstmt){
		
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (pstmt != null) {
			try {
				pstmt.close();
				pstmt = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void main(String[] args) {
		try {
			Connection connection = DBHelper.getConnection();
			if(connection!=null){
				System.out.println("The database connection is successful!");	
			}else {
				System.out.println("Abnormal database connection");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
