package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.ShareBoardAnswerDto;
import mysql.db.MysqlConnect;

public class ShareBoardAnswerDao {
	
	MysqlConnect my=new MysqlConnect();
	
	//insert:���� �߿��Ѱ� �̰� ���۷� �߰��� �Ұ�����,
    //��۷� �߰��� �Ұ������̴�.�ڡڡڡڡ�
    //�׷��� �Ǵ��� dto�� ����ִ� num�� null�̸� ���۷�
    //null�� �ƴϸ� ��۷� insert�� �Ұ��̴�.
    public void insertBoard(ShareBoardAnswerDto dto) {
       String num=dto.getNum();
       int regroup=dto.getRegroup();
       int relevel=dto.getRelevel();
       int restep=dto.getRestep();
       String sql="insert into shareboardanswer (memo,star,relevel,regroup,restep,writeday) values (?,?,?,?,?,now())";
            
       if(num==null) {
          //������ �ǹ��Ѵ�
          regroup=this.getMaxNum()+1;
          relevel=0;
          restep=0;
       }else {
          //����� �ǹ��Ѵ�
          //���� �׷��� restep�� ���޹��� ������ ū��� ������ 1 ����
          this.updateRestep(regroup, restep);
          //�׸��� ���޹��� level,step�� 1 �����Ѵ�\
          relevel+=1;
          restep+=1;
       }
       Connection conn=null;
       PreparedStatement pstmt=null;
       conn=my.getConnection();
       try {
          pstmt=conn.prepareStatement(sql);
          pstmt.setString(1, dto.getMemo());
          pstmt.setString(2, dto.getStar());
         
          //������� ����
          pstmt.setInt(3, regroup);
          pstmt.setInt(4, relevel);
          pstmt.setInt(5, restep);
          pstmt.execute();
       } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }finally {
          my.dbClose(conn, pstmt);
       }
       
    }
	 //������ �߰��� ���� �׷��� ���޹��� step���� ū���� ����
    //�����͵��� restep�� ������+1�� �Ѵ�
    public void updateRestep(int regroup,int restep) {
       String sql="update shareboardanswer set restep=restep+1 where regroup=? and restep>?";
       Connection conn=null;
       PreparedStatement pstmt=null;
       conn=my.getConnection();
       try {
          pstmt=conn.prepareStatement(sql);
          pstmt.setInt(1, regroup);
          pstmt.setInt(2, restep);
          
          pstmt.execute();
       } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }finally {
          my.dbClose(conn, pstmt);
       }
    }
    
 
    
 //������ �ִ��� �˻�-������� true
       public boolean isGroupStep(int regroup) {
          boolean flag=false;
          String sql="select * from shareboardanswer where regroup=? and restep=0";
          Connection conn=null;
          PreparedStatement pstmt=null;
          ResultSet rs=null;
          conn=my.getConnection();
          try {
             pstmt=conn.prepareStatement(sql);
             pstmt.setInt(1, regroup);
             rs=pstmt.executeQuery();
             //�����Ͱ� ������� true
             if(rs.next()) {
                flag=true;
             }
          } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }finally {
             my.dbClose(conn, pstmt,rs);
          }
          
          return flag;
       }
       
       public int getMaxNum()
       {
          int max=0;
          String sql="select ifnull(max(num),0) from shareboardanswer";
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
       
    //��ü ���� ���ϱ�
   	public int getTotalCount() {
   		int tot=0;
   		Connection conn=null;
   		PreparedStatement pstmt=null;
   		ResultSet rs=null;
   		String sql="select count(*) from shareboardanswer";
   		
   		//mysql ���� ����
   		conn=my.getConnection();
   		try {
   			pstmt=conn.prepareStatement(sql);
   			rs=pstmt.executeQuery();
   			if(rs.next())
   				tot=rs.getInt(1);
   		} catch (SQLException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		}finally {
   			my.dbClose(conn, pstmt, rs);
   		}
   		return tot;
   	}

    


}
