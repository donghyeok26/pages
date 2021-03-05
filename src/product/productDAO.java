package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import CONTENT.CONTENTDTO;

public class productDAO {
	String url ="jdbc:mysql://13.125.69.248:3306/user";
	String id ="donghyeok";
	String pass ="8341";
	String driver = "com.mysql.jdbc.Driver";
	
	public ArrayList<productDTO> getproductlist() {
		String sql = "select * from product";
		ArrayList<productDTO> list = new ArrayList<productDTO>();
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			System.out.println("sql :"+ psmt);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				productDTO pt = new productDTO();
				pt.setProID(rs.getString("proID"));
				pt.setProName(rs.getString("proName"));
				pt.setContent(rs.getString("content"));
				pt.setRegdate(rs.getDate("regdate"));
				pt.setPrice(rs.getInt("price"));
				pt.setPath(rs.getString("path"));
				pt.setHit(rs.getInt("hit"));
				pt.setStatus(rs.getInt("status"));
				list.add(pt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list; //db ¿À·ù
	}
	
	//getdetail
public productDTO getdetail(String proID) {
		
		String sql = "SELECT * FROM product WHERE proID=?";
		productDTO pt = null;
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pass);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, proID);
			System.out.println(psmt);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				pt = new productDTO();
				pt.setProID(rs.getString("proID"));
				pt.setProName(rs.getString("proName"));
				pt.setContent(rs.getString("content"));
				pt.setRegdate(rs.getDate("regdate"));
				pt.setPrice(rs.getInt("price"));
				pt.setPath(rs.getString("path"));
				pt.setHit(rs.getInt("hit"));
				pt.setStatus(rs.getInt("status"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pt;
	}
}
