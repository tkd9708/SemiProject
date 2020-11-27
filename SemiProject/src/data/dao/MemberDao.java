package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mysql.db.MysqlConnect;

public class MemberDao {
	MysqlConnect db=new MysqlConnect();
	
	//���̵� ������ true��ȯ,������ false��ȯ
	public boolean isIdSearch(String id)
	{
		boolean find=false;
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where id=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
				find=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return find;
	}
	
	//�̸����� ������ true��ȯ,������ false��ȯ
	public boolean isEmailSearch(String email)
	{
		boolean find=false;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where email="+email;
		
		conn=db.getConnection();
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next())
				find=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return find;
	}
}