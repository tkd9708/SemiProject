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

	// 주변명소 insert
	public void insertAround(WishlistDto dto) {
		String sql = "insert into wishlist (mem_num, spot_id, share_num, around_id, content,wishday) values (?,0,0,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemNum());
			pstmt.setString(2, dto.getAroundId());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getWishday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	
	}
	
	// spot insert
	public void insertSpot(WishlistDto dto) {
		String sql = "insert into wishlist (mem_num, spot_id, share_num, around_id, content,wishday) values (?,?,0,0,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemNum());
			pstmt.setString(2, dto.getSpotId());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getWishday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	
	}
	
	// 찜한 명소인지 확인
	public boolean isSpotSearch(String contentsid) {
		boolean find = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from wishlist where spot_id = ?";
		conn = db.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				find = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		
		return find;
	
	}
	
	//insert 
	public void insertContent(WishlistDto dto) {
		String sql = "insert into wishlist (mem_id,content,wishday) values (?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemNum());
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
	