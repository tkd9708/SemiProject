package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.ShareBoardAnswerDto;
import mysql.db.MysqlConnect;

public class ShareBoardAnswerDao {
	
	MysqlConnect my=new MysqlConnect();
	
	//insert:제일 중요한건 이게 새글로 추가를 할것인지,
    //답글로 추가를 할것인지이다.★★★★★
    //그래서 판단을 dto에 들어있는 num이 null이면 새글로
    //null이 아니면 답글로 insert를 할것이다.
    public void insertBoard(ShareBoardAnswerDto dto) {
       String num=dto.getNum();
       int regroup=dto.getRegroup();
       int relevel=dto.getRelevel();
       int restep=dto.getRestep();
       String sql="insert into shareboardanswer (memo,star,relevel,regroup,restep,writeday) values (?,?,?,?,?,now())";
            
       if(num==null) {
          //새글을 의미한다
          regroup=this.getMaxNum()+1;
          relevel=0;
          restep=0;
       }else {
          //답글을 의미한다
          //같은 그룹중 restep이 전달받은 값보다 큰경우 무조건 1 증가
          this.updateRestep(regroup, restep);
          //그리고 전달받은 level,step을 1 증가한다\
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
         
          //여기부터 주의
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
	 //데이터 추가시 같은 그룹중 전달받은 step보다 큰값을 가진
    //데이터들은 restep을 무조건+1을 한다
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
    
 
    
 //원글이 있는지 검사-있을경우 true
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
             //데이터가 있을경우 true
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
       
    //전체 갯수 구하기
   	public int getTotalCount() {
   		int tot=0;
   		Connection conn=null;
   		PreparedStatement pstmt=null;
   		ResultSet rs=null;
   		String sql="select count(*) from shareboardanswer";
   		
   		//mysql 서버 연결
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
