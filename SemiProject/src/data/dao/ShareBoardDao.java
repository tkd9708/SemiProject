package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import data.dto.ShareBoardDto;
import mysql.db.MysqlConnect;

public class ShareBoardDao {
	
	MysqlConnect my=new MysqlConnect();
	
	//insert
		public void insertShare(ShareBoardDto dto)
		{
			String sql="insert into shareboard (id,photo,subject,content,addr,star,writeday) values (?,?,?,?,?,?,now())";
					
					
			Connection conn=null;
			PreparedStatement pstmt=null;
			conn=my.getConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPhoto());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getContent());
				pstmt.setString(5, dto.getAddr());
				pstmt.setString(6, dto.getStar());
				
												

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
			String sql="select count(*) from shareboard";
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
		
		public ShareBoardDto getData(String num)
		{
			ShareBoardDto dto=new ShareBoardDto();
			String sql="select * from shareboard where num=?";
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
					dto.setAddr(rs.getString("addr"));
					dto.setLikes(rs.getInt("likes"));
					dto.setStar(rs.getString("star"));
					dto.setPhoto(rs.getString("photo"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
					

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
		public List<ShareBoardDto> getList(int start,int end)
		{
			List<ShareBoardDto> list=new ArrayList<ShareBoardDto>();
			String sql="select * from shareboard orders limit ?,?";
					   
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
					ShareBoardDto dto=new ShareBoardDto();
					dto.setNum(rs.getString("num"));
					dto.setId(rs.getString("id"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setAddr(rs.getString("addr"));
					dto.setLikes(rs.getInt("likes"));
					dto.setStar(rs.getString("star"));
					dto.setPhoto(rs.getString("photo"));
					dto.setWriteday(rs.getTimestamp("writeday"));
							

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
			String sql="select ifnull(max(num),0) from shareboard";
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
			String sql="update shareboard set readcount=readcount+1 where num=?";
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
		
		//좋아요 증가
	      public void updateLikes(String num)
	      {
	         String sql="update shareboard set likes=likes+1 where num=?";
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

		


