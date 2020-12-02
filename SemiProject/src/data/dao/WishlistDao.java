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

	// �ֺ���� insert
	public void insertAround(WishlistDto dto) {
		String sql = "insert into wishlist (memId, spotId, shareNum, aroundId, content,wishday) values (?,0,0,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemId());
			pstmt.setString(2, dto.getAroundId());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getWishday());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}

	}

	// spot insert
	public void insertSpot(WishlistDto dto) {
		String sql = "insert into wishlist (memId, spotId, shareNum, aroundId, content,wishday) values (?,?,0,0,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemId());
			pstmt.setString(2, dto.getSpotId());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getWishday());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}

	}

	// ���� ������� Ȯ��
	public boolean isSpotSearch(String contentsid) {
		boolean find = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from wishlist where spotId = ?";
		conn = db.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentsid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	// insert
	public void insertContent(WishlistDto dto) {
		String sql = "insert into wishlist (memId,content,wishday) values (?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemId());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWishday());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}

	}

	// delete
	public void deleteContent(String num) {

		String sql = "delete from wishlist where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}

	}

	public List<WishlistDto> getList(String memId)
	{
		List<WishlistDto> list = new ArrayList<WishlistDto>();
		String sql = "select * from wishlist where memId=? order by wishday asc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				WishlistDto dto = new WishlistDto();
				String spotId = rs.getString("spotId");
				String shareNum = rs.getString("shareNum");
				dto.setContent(rs.getString("content"));
				dto.setWishday(rs.getString("wishday"));
				dto.setAroundId(rs.getString("aroundId"));
				if(!rs.getString("spotId").equals("0")) {
					String tsql = "select title from spotlist where contentsid=? ";
					PreparedStatement tpstmt = null;
					ResultSet trs = null;
					tpstmt = conn.prepareStatement(tsql);
					tpstmt.setString(1, spotId);
					trs = tpstmt.executeQuery();
					while(trs.next()) {
						dto.setTitle(trs.getString("title"));
						dto.setSubject("0");
					}
				}
				
				else if(!rs.getString("shareNum").equals("0")) {
					String shsql = "select subject from shareboard where num=?";
					PreparedStatement shpstmt = null;
					ResultSet shrs = null;
					shpstmt = conn.prepareStatement(shsql);
					shpstmt.setString(1, shareNum);
					shrs=shpstmt.executeQuery();
					while(shrs.next()) {
						dto.setSubject(shrs.getString("subject"));
						dto.setTitle("0");
					}
				}
					else {
					dto.setTitle("0");
					dto.setSubject("0");
					}
				
				
				System.out.println(dto.getTitle());
				//System.out.println(dto.getSubject());
				System.out.println(dto.getWishday());
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
			
		}
		
	
		
		return list;
	}
	
	
	//spot �̸��ޱ�
	public WishlistDto getspotTitle(String contensid) {
		String sql = "select s.title w.wishday from spotlist s, wishlist w where s.contentsid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		WishlistDto dto = new WishlistDto();
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contensid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	
}
