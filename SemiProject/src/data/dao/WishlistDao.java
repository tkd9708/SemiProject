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
	
	//일정가져오기 //회원이 등록한 일반 일정
	
	  public List<WishlistDto> getData(String mem_id) { 
		
		  List<WishlistDto> list = new ArrayList<WishlistDto>();
	  
	  String sql = "select * from wishlist where mem_id=?"; Connection conn = null;
	  PreparedStatement pstmt = null; ResultSet rs = null;
	  
	  conn = db.getConnection(); try { pstmt = conn.prepareStatement(sql);
	  pstmt.setString(1, mem_id);
	  
	  rs = pstmt.executeQuery(); while(rs.next()) { WishlistDto dto = new
	  WishlistDto(); dto.setMem_id(rs.getString("mem_id"));
	  dto.setContent(rs.getString("content")); dto.setNum(rs.getString("num"));
	  dto.setShare_num(rs.getString("share_num"));
	  dto.setSpot_id(rs.getString("spot_id"));
	  dto.setWishday(rs.getString("wishday"));
	  
	  list.add(dto); }
	  
	  } catch (SQLException e) { // TODO Auto-generated catch block
	  e.printStackTrace(); }finally { db.dbClose(conn, pstmt, rs); } return list; 
	  }
	 
	 

}