package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.WishlistDto;
import mysql.db.MysqlConnect;

public class WishlistDao {
MysqlConnect db = new MysqlConnect();


//insert 
	public void insertContent(WishlistDto dto) {
		String sql = "insert into wishlist (mem_id,content,wishday) values (?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWishday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	
	}
//delete
	public void deleteContent(String num) {
	
		String sql ="delete from wishlist where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 

}