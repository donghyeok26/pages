package CONTENT;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class contentDAO {
	String url ="jdbc:mysql://13.125.69.248:3306/user";
	String id ="donghyeok";
	String pass ="8341";
	String driver = "com.mysql.jdbc.Driver";
	
	//게시글 조회
	public ArrayList<CONTENTDTO> getList(int page, String field, String query) {
		System.out.println("page : ");
		
		
		int start = 1+(page - 1)*10;//1 + (3 - 1) *10
		int end = 10*page;
		
		String sql = "SELECT *  "
				+ "		FROM (SELECT @rownum:=@rownum+1 as num, n.*  "
				+ "			FROM (SELECT * "
				+ "				FROM CONTENT  "
				+ "				WHERE AVAILALBLE = 1"
				+ "				and "+field+" like ? "
				+ "        	ORDER BY REGDATE DESC)n, "
				+ "		(SELECT @rownum:=0)row)t "
				+ "	WHERE t.num between ? and ?";
		ArrayList<CONTENTDTO> list = new ArrayList<CONTENTDTO>();
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+query+"%");
			psmt.setInt(2, start);
			psmt.setInt(3, end);
			System.out.println("sql :"+ psmt);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				CONTENTDTO ct = new CONTENTDTO();
				ct.setContentID(rs.getInt("CONTENTID"));
				ct.setTitle(rs.getString("TITLE"));
				ct.setUserID(rs.getString("USERID"));
				ct.setRegdate(rs.getDate("REGDATE"));
				ct.setHit(rs.getInt("HIT"));
				list.add(ct);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list; //db 오류
	}
	//총 페이지 수
	public int getCount(String field, String query) {
		int count = 0;
		String sql = "SELECT count(t.CONTENTID)as cnt  "
				+ "		FROM (SELECT @rownum:=@rownum+1 as num, n.*  "
				+ "			FROM (SELECT * "
				+ "				FROM CONTENT  "
				+ "				WHERE AVAILALBLE = 1"
				+ "				and "+field+" like ? "
				+ "        	ORDER BY REGDATE DESC)n, "
				+ "		(SELECT @rownum:=0)row)t ";
		
		ArrayList<CONTENTDTO> list = new ArrayList<CONTENTDTO>();
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+query+"%");
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count; //db 오류
	}
	
public CONTENTDTO getContent(int contentID) {
		
		String sql = "SELECT * FROM CONTENT WHERE CONTENTID=?";
		CONTENTDTO ct = null;
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setInt(1, contentID);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				ct = new CONTENTDTO();
				ct.setContentID(rs.getInt("CONTENTID"));
				ct.setTitle(rs.getString("TITLE"));
				ct.setUserID(rs.getString("USERID"));
				ct.setRegdate(rs.getDate("REGDATE"));
				ct.setContent(rs.getString("CONTENT"));
				ct.setHit(rs.getInt("HIT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ct;
	}

	//hit수 증가
	public void addHit(int hit,int contentID) {
		String sql = "UPDATE CONTENT SET HIT=? WHERE CONTENTID = ?";
		int result = 0;
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setInt(1, hit+1);
			psmt.setInt(2, contentID);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//글쓰기 writeCotent
	public int writeCotent(String userID, String title, String content) {
		String sql = "INSERT INTO CONTENT(TITLE, USERID, CONTENT) VALUES(?, ?, ?)";
		CONTENTDTO ct = null;
		int result = 0;
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1,title);
			psmt.setString(2,userID);
			psmt.setString(3,content);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//글 수정 updateContent
	
	public int updateContent(int contentID, String title, String content) {
		
		String sql = "UPDATE CONTENT SET TITLE=?, CONTENT=? WHERE CONTENTID = ?";
		CONTENTDTO ct = null;
		int result = 0;
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, contentID);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//게시글 삭제

public int delContent(int contentID) {
	
	String sql = "UPDATE CONTENT SET AVAILALBLE = 2 WHERE CONTENTID = ?;";
	CONTENTDTO ct = null;
	int result = 0;
	try {
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url,id,pass);
		PreparedStatement psmt = con.prepareStatement(sql);
		psmt.setInt(1, contentID);
		result = psmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return result;
}

}
