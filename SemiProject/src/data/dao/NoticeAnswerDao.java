package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.NoticedAnswerDto;
import mysql.db.MysqlConnect;


public class NoticeAnswerDao {
     
	
	MysqlConnect my=new MysqlConnect();
     
     //insert
     public void insertShareAnswer(NoticedAnswerDto dto)
     {
    	 String sql="insert into shareboardanswer (num,idx,id,memo,writeday) values (?,?,?,?,now())";
    	 Connection conn=null;
    	 PreparedStatement pstmt=null;
    	 conn=my.getConnection();
    	 
    	 try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getMemo());
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt);
		}
     }
     //������
     public List<NoticedAnswerDto> getAnswerList(String num)
     {
    	 List<NoticedAnswerDto> list=new Vector<NoticedAnswerDto>();
    	 Connection conn=null;
    	 PreparedStatement pstmt=null;
    	 ResultSet rs=null;
    	 String sql="select * from shareboardanswer where num=?";
    	 conn=my.getConnection();
    	 
    	 try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, num);
			//����
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				NoticedAnswerDto dto=new NoticedAnswerDto();
				dto.setNum(rs.getString("num"));
				dto.setIdx(rs.getString("idx"));
				dto.setId(rs.getString("id"));
				dto.setMemo(rs.getString("memo"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				//list�� �߰�
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
     //��� ����
     public void deleteAnswer(String idx)
     {
    	 String sql="delete from answer where idx=?";
    	 Connection conn=null;
    	 PreparedStatement pstmt=null;
    	 conn=my.getConnection();
    	 
    	 try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, idx);
		
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt);
		}
     }
 	
     public String getMemo(String idx)
 	{
 		String sql="select memo from shareboardanswer where idx=?";
 		String memo="";
 		Connection conn=null;
 		PreparedStatement pstmt=null;
 		ResultSet rs=null;
 		conn=my.getConnection();
 		
 		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, idx);
			
			//����
			pstmt.executeQuery();
			if(rs.next())
			{
				memo=rs.getString("memo");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			my.dbClose(conn, pstmt, rs);
		}
 		return memo;
 	}
     
     //����
     public void updateAnswer(String idx,String memo)
  	{
  		String sql="select * from shareboardanswer set memo where idx=?";
   		Connection conn=null;
  		PreparedStatement pstmt=null;
  		conn=my.getConnection();
  		
  		try {
 			pstmt=conn.prepareStatement(sql);
 			//���ε�
 			pstmt.setString(1, memo);
 			pstmt.setString(2, idx);
 			
 			//����
 			pstmt.execute();
 			
 			
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally {
 			my.dbClose(conn, pstmt);
 		}
  		
  	}
     

}

























