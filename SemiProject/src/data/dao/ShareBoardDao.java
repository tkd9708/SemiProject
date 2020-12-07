package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ShareBoardDto;
import data.dto.WishlistDto;
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
            //���ε�
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPhoto());
            pstmt.setString(3, dto.getSubject());
            pstmt.setString(4, dto.getContent());
            pstmt.setString(5, dto.getAddr());
            pstmt.setString(6, dto.getStar());
            
                                    

            //����
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
            //���ε�
            pstmt.setString(1, num);
            //����
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
      
      //����¡ó���� ����Ʈ ��� ��ȯ
      public List<ShareBoardDto> getList(int start,int end)
      {
         List<ShareBoardDto> list=new ArrayList<ShareBoardDto>();
         String sql="select * from shareboard where relevel=0 and restep=0 order by regroup desc, restep asc limit ?,?";
                  
         Connection conn=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         conn=my.getConnection();

         try {
            pstmt=conn.prepareStatement(sql);
            //���ε�
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            //����
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

      public List<ShareBoardDto> getReviewList(String num)
      {
         List<ShareBoardDto> list=new ArrayList<ShareBoardDto>();
         String sql="select distinct * from shareboard  where ?=regroup and relevel!=0 order by restep asc";
                  
         Connection conn=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         conn=my.getConnection();

         try {
            pstmt=conn.prepareStatement(sql);
            //���ε�
          
          pstmt.setString(1, num);
            //����
            rs=pstmt.executeQuery();
            while(rs.next())
            {
               ShareBoardDto dto=new ShareBoardDto();
               dto.setNum(rs.getString("num"));
               dto.setId(rs.getString("id"));
               dto.setContent(rs.getString("content"));
               dto.setStar(rs.getString("star"));
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
      //���ƿ� ����
      public void updateLikes(String num)
      {
         String sql="update shareboard set likes=likes+1 where num=?";
         Connection conn=null;
         PreparedStatement pstmt=null;
         conn=my.getConnection();
         try {
            pstmt=conn.prepareStatement(sql);
            //���ε� 
            pstmt.setString(1, num);

            //���� 
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
        String sql="update shareboard set restep=restep+1 where regroup=? and restep>?";
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
     
  //insert:���� �߿��Ѱ� �̰� ���۷� �߰��� �Ұ�����,
     //��۷� �߰��� �Ұ������̴�.�ڡڡڡڡ�
     //�׷��� �Ǵ��� dto�� ����ִ� num�� null�̸� ���۷�
     //null�� �ƴϸ� ��۷� insert�� �Ұ��̴�.
     public void insertBoard(ShareBoardDto dto) {
        String num=dto.getNum();
        int regroup=dto.getRegroup();
        int relevel=dto.getRelevel();
        int restep=dto.getRestep();
        String sql="insert into shareboard (id,subject,addr,photo,content,"
              + "star,relevel,regroup,restep,writeday) values (?,?,?,?,?,?,?,?,?,now())";
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
           pstmt.setString(1, dto.getId());
           pstmt.setString(2, dto.getSubject());
           pstmt.setString(3, dto.getAddr());
           pstmt.setString(4, dto.getPhoto());
           pstmt.setString(5, dto.getContent());
           pstmt.setString(6, dto.getStar());
           //������� ����
           pstmt.setInt(7, relevel);
           pstmt.setInt(8, regroup);
           pstmt.setInt(9, restep);
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
           String sql="select * from shareboard where regroup=? and restep=0";
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
        
        //�Խñ� ����
        public void sharedelete(String num) {
          Connection conn=null;
          PreparedStatement pstmt=null;
          String sql="delete from shareboard where num=?";
          conn=my.getConnection();
          try {
             pstmt=conn.prepareStatement(sql);
             pstmt.setString(1, num);
             pstmt.execute();
          }catch(SQLException e) {
             e.printStackTrace();
          }finally {
             my.dbClose(conn, pstmt);
          }
       }
        
     
           
  
     
}

      