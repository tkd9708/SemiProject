package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.NoticeDto;
import mysql.db.MysqlConnect;

public class NoticeDao {

	MysqlConnect my=new MysqlConnect();

	//insert
	public void insertNotice(NoticeDto dto)
	{
		String sql="insert into noticeboard (id,subject,content,files,writeday) values (?,?,?,?,now())";
				
				
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=my.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFiles());

			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt);
		}
	}
	
	public int getTotalCount()
	{
		int n=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from noticeboard";
		conn=my.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				n=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt, rs);
		}
		return n;
	}

	
	public NoticeDto getData(String num)
	{
		NoticeDto dto=new NoticeDto();
		String sql="select * from noticeboard where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;


		conn=my.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			//실행
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setFiles(rs.getString("files"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setReadcount(rs.getInt("readcount"));
				


			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt, rs);
		}
		return dto;

	}
	
	//페이징처리한 리스트 목록 반환
	public List<NoticeDto> getList(int start,int end)
	{
		List<NoticeDto> list=new ArrayList<NoticeDto>();
		String sql="select * from noticeboard orders limit ?,?";
				   
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=my.getConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			//실행
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				NoticeDto dto=new NoticeDto();
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setFiles(rs.getString("files"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setReadcount(rs.getInt("readcount"));


				//list에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt, rs);
		}
		return list;
	}

	public int getMaxNum()
	{
		int max=0;
		String sql="select ifnull(max(num),0) from noticeboard";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;


		conn=my.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				max=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt, rs);
		}
		return max;


	}

	public void updateReadcount(String num)
	{
		String sql="update noticeboard set readcount=readcount+1 where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=my.getConnection();
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
			my.dbClose(conn, pstmt);
		}
	}
}




