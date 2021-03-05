package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	String url ="jdbc:mysql://13.125.69.248:3306/user";
	String id ="donghyeok";
	String pass ="8341";
	String driver = "com.mysql.jdbc.Driver";
	
	public int login(String uid, String upass) {
		System.out.println("ID: "+ uid);
		System.out.println("PASS: "+upass);
		
		String sql = "SELECT password FROM user WHERE ID = ?";
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(upass)) {
					return 1;//로그인성공
				}else {
					return 0;//password틀림
				}
			}
			return -1;//가입되지 않았음
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2; //db 오류
	}
	
	public int join(userDTO ut) {
		String sql = "insert into user (ID, password, name, email, phoneNum, addr) values (?, ?, ?, ?, ?, 'Busan')";
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql); //sql 실행문
			psmt.setString(1, ut.getUserID());
			psmt.setString(2, ut.getUserPASS());
			psmt.setString(3, ut.getUserName());
			psmt.setString(4, ut.getUserID());
			psmt.setString(5, ut.getUserNum());
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //db 오류
	}
	
}
