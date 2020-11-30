package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.dto.SpotlistDto;
import mysql.db.MysqlConnect;

public class SpotlistDao {
	MysqlConnect db = new MysqlConnect();
	
	// insert
	public void insertSpotlist(SpotlistDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into spotlist(contentsid, title, label1, label2, roadaddr, latitude, longitude, tag, introduction, thumbnail) "
				+ "values (?,?,?,?,?,?,?,?,?,?)";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContentsid());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getLabel1());
			pstmt.setString(4, dto.getLabel2());
			pstmt.setString(5, dto.getRoadaddr());
			pstmt.setDouble(6, dto.getLatitude());
			pstmt.setDouble(7, dto.getLongitude());
			pstmt.setString(8, dto.getTag());
			pstmt.setString(9, dto.getIntroduction());
			pstmt.setString(10, dto.getThumbnail());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public List<SpotlistDto> getList(){
		List<SpotlistDto> list = new ArrayList<SpotlistDto>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from spotlist";
		
		conn = db.getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				SpotlistDto dto = new SpotlistDto();
				dto.setContentsid(rs.getString("contentsid"));
				dto.setIntroduction(rs.getString("introduction"));
				dto.setLabel1(rs.getString("label1"));
				dto.setLabel2(rs.getString("label2"));
				dto.setLatitude(rs.getDouble("latitude"));
				dto.setLongitude(rs.getDouble("longitude"));
				dto.setRoadaddr(rs.getString("roadaddr"));
				dto.setTag(rs.getString("tag"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setTitle(rs.getString("title"));
				dto.setStar(rs.getInt("star"));
				dto.setLikes(rs.getInt("likes"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt);
		}
		
		return list;
	}
	
	public SpotlistDto getData(String contentsid) {
		SpotlistDto dto = new SpotlistDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from spotlist where contentsid = ?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setContentsid(rs.getString("contentsid"));
				dto.setIntroduction(rs.getString("introduction"));
				dto.setLabel1(rs.getString("label1"));
				dto.setLabel2(rs.getString("label2"));
				dto.setLatitude(rs.getDouble("latitude"));
				dto.setLongitude(rs.getDouble("longitude"));
				dto.setRoadaddr(rs.getString("roadaddr"));
				dto.setTag(rs.getString("tag"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setTitle(rs.getString("title"));
				dto.setStar(rs.getInt("star"));
				dto.setLikes(rs.getInt("likes"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
		
		return dto;
	}
	
	public List<SpotlistDto> getList(int start, int perpage, String label2){
		// 그룹변수의 내림차순, 같은 그룹인경우 step의 오름차순 출력
		// limit로 시작번지와 몇개를 가져올지 바인딩
		String sql = "select * from spotlist where label2 like '%" + label2 + "%' limit ?,?";
		List<SpotlistDto> list = new ArrayList<SpotlistDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SpotlistDto dto = new SpotlistDto();
				dto.setContentsid(rs.getString("contentsid"));
				dto.setIntroduction(rs.getString("introduction"));
				dto.setLabel1(rs.getString("label1"));
				dto.setLabel2(rs.getString("label2"));
				dto.setLatitude(rs.getDouble("latitude"));
				dto.setLongitude(rs.getDouble("longitude"));
				dto.setRoadaddr(rs.getString("roadaddr"));
				dto.setTag(rs.getString("tag"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setTitle(rs.getString("title"));
				dto.setStar(rs.getInt("star"));
				dto.setLikes(rs.getInt("likes"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	public int getTotalCount(String label2) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from spotlist where label2 like '%" + label2 + "%'";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		
		return total;
	}
	
	public void updateLikes(String contentsid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update spotlist set likes = likes + 1 where contentsid = ?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsid);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	
	public void updateStar(String contentsid, int avg) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update spotlist set star = ? where contentsid = ?";
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, avg);
			pstmt.setString(2, contentsid);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}
}
