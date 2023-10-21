package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBHelper;

import entity.Users;

public class UsersDAO {
	private Connection coon = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public boolean isUserLogin(Users users) {
		try {
			coon = DBHelper.getConnection();
			String sql = "select * from users";
			pstmt = coon.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				if (rs.getString("username").equals(users.getUsername())&&rs.getString("password").equals(users.getPassword())) {
					return true;
				}
			}
			return false;	
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally{
			DBHelper.relsaseResource(rs, pstmt);
		}
	}
	
	
	public boolean insertUsersInfoToDB(Users users){
		try {
			coon = DBHelper.getConnection();
			
			String sql = "INSERT INTO `users` VALUES (?, ?, ?);";
			pstmt = coon.prepareStatement(sql);
			pstmt.setInt(1, users.getId());
			pstmt.setString(2, users.getUsername());
			pstmt.setString(3, users.getPassword());
			int temp = pstmt.executeUpdate();
			System.out.println(temp + "user" + "insert values");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally{
			DBHelper.relsaseResource(rs, pstmt);
		}
		
	}
}
