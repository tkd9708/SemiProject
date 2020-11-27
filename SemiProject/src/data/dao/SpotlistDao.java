package data.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import data.dto.SpotlistDto;
import mysql.db.MysqlConnect;

public class SpotlistDao {
	MysqlConnect db = new MysqlConnect();
	
	public void insertSpotlist(SpotlistDto dto) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "insert into spotlist(contentsid) values ('" + dto.getContentsid() + "')";
		
		conn = db.getConnection();
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt, rs);
		}
	}
}
