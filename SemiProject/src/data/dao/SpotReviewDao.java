package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.dto.SpotReviewDto;
import mysql.db.MysqlConnect;

public class SpotReviewDao {
	MysqlConnect db = new MysqlConnect();
	
	public void spotReviewInsert(SpotReviewDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into spotreview(contentsid, memNum, content, writeday, star) values (?,?,?,now(),?)";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContentsid());
			pstmt.setString(2, dto.getMemNum());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getStar());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
	}
	
	public List<SpotReviewDto> getList(String contentsid){
		List<SpotReviewDto> list = new ArrayList<SpotReviewDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from spotreview where contentsid=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SpotReviewDto dto = new SpotReviewDto();
				dto.setContent(rs.getString("content"));
				dto.setContentsid(rs.getString("contentsid"));
				dto.setMemNum(rs.getString("memNum"));
				dto.setNum(rs.getString("num"));
				dto.setStar(rs.getInt("star"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setLikes(rs.getInt("likes"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
		return list;
	}
	
	public int getTotalCount(String contentsid) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from spotreview where contentsid=?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsid);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				total = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return total;
	}
	
	public void updateLikes(String num)
	{
		String sql="update spotreview set likes=likes+1 where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩 
			pstmt.setString(1, num);

			//실행 
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
}
