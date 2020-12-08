package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.ShareBoardDto;
import data.dto.SpotlistDto;
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
         String sql="select count(*) from shareboard where relevel=0 and restep=0";
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
               dto.setRegroup(rs.getInt("regroup"));
               dto.setRelevel(rs.getInt("relevel"));
               dto.setRestep(rs.getInt("restep"));
               
               

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
         String sql="select * from shareboard where relevel=0 and restep=0 order by regroup desc, restep asc limit ?,?";
                  
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
               dto.setRegroup(rs.getInt("regroup"));
               dto.setRelevel(rs.getInt("relevel"));
               dto.setRestep(rs.getInt("restep"));     

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

      public List<ShareBoardDto> getReviewList(int regroup)
      {
         List<ShareBoardDto> list=new ArrayList<ShareBoardDto>();
         String sql="select * from shareboard where regroup=? and relevel!=0 order by restep asc";
                  
         Connection conn=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         conn=my.getConnection();

         try {
            pstmt=conn.prepareStatement(sql);
            //바인딩
            pstmt.setInt(1, regroup);
            //실행
            rs=pstmt.executeQuery();
            while(rs.next())
            {
               ShareBoardDto dto=new ShareBoardDto();
               dto.setNum(rs.getString("num"));
               dto.setId(rs.getString("id"));
               dto.setContent(rs.getString("content"));
               dto.setStar(rs.getString("star"));
               dto.setWriteday(rs.getTimestamp("writeday"));
               dto.setRegroup(rs.getInt("regroup"));
               dto.setRelevel(rs.getInt("relevel"));
               dto.setRestep(rs.getInt("restep"));      

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
      
    //데이터 추가시 같은 그룹중 전달받은 step보다 큰값을 가진
     //데이터들은 restep을 무조건+1을 한다
     public void updateRestep(int regroup,int restep1) {
        String sql="update shareboard set restep=restep+1 where regroup=? and restep>?";
        Connection conn=null;
        PreparedStatement pstmt=null;
        conn=my.getConnection();
        try {
           pstmt=conn.prepareStatement(sql);
           pstmt.setInt(1, regroup);
           pstmt.setInt(2, restep1);
           
           pstmt.execute();
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }finally {
           my.dbClose(conn, pstmt);
        }
     }
     
  //insert:제일 중요한건 이게 새글로 추가를 할것인지,
     //답글로 추가를 할것인지이다.★★★★★
     //그래서 판단을 dto에 들어있는 num이 null이면 새글로
     //null이 아니면 답글로 insert를 할것이다.
     public void insertBoard(ShareBoardDto dto) {
        String num=dto.getNum();
        int regroup=dto.getRegroup();
        int relevel=dto.getRelevel();
        int restep=dto.getRestep();
        String sql="insert into shareboard (id,subject,addr,photo,content,"
              + "star,relevel,regroup,restep,writeday) values (?,?,?,?,?,?,?,?,?,now())";
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
           pstmt.setString(1, dto.getId());
           pstmt.setString(2, dto.getSubject());
           pstmt.setString(3, dto.getAddr());
           pstmt.setString(4, dto.getPhoto());
           pstmt.setString(5, dto.getContent());
           pstmt.setString(6, dto.getStar());
           //여기부터 주의
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
     
  //원글이 있는지 검사-있을경우 true
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
        
        public int isNextStep(int regroup, int relevel, int restep) {
			/* boolean flag=false; */
        	int num=0;
            String sql="select * from shareboard where regroup=? and relevel = ? and restep = ?";
            Connection conn=null;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            conn=my.getConnection();
            try {
               pstmt=conn.prepareStatement(sql);
               pstmt.setInt(1, regroup);
               pstmt.setInt(2, relevel+1);
               pstmt.setInt(3, restep+1);
               rs=pstmt.executeQuery();
               //데이터가 있을경우 true
               if(rs.next()) {
                  num=rs.getInt("num");
               }
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }finally {
               my.dbClose(conn, pstmt,rs);
            }
            
            return num;
         }
           
      //게시글 삭제
        public void sharedelete(String num,String num1) {
          Connection conn=null;
          PreparedStatement pstmt=null;
          String sql="delete from shareboard where num=? or regroup=?";
          conn=my.getConnection();
          try {
             pstmt=conn.prepareStatement(sql);
             pstmt.setString(1, num);
             pstmt.setString(2, num1);
             pstmt.execute();
          }catch(SQLException e) {
             e.printStackTrace();
          }finally {
             my.dbClose(conn, pstmt);
          }
       }
        
      //댓글 삭제
        public void deleteReview(String num) {
          Connection conn=null;
          PreparedStatement pstmt=null;
          String sql="delete from shareboard where num = ?";
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
      
        
      //댓글 개수 구하기
        public int getCount(int regroup){
            int count =0;
            Connection conn=null;
            PreparedStatement pstmt=null;
            ResultSet rs=null;
            String sql="select count(*) from shareboard where regroup=? and relevel!=0";
            conn=my.getConnection();
            try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, regroup);
            rs=pstmt.executeQuery();
            if(rs.next()) {
               count=rs.getInt(1);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
            
            return count;
            
       
        }
        
//게시글 수정
        
        
        public void updateShardBoard(ShareBoardDto dto) {
           Connection conn=null;
           PreparedStatement pstmt=null;
           String sql="";
           conn=my.getConnection();
           try {
              if(dto.getPhoto()==null) {
                 sql="update shareboard set subject=?, addr=?, content=?, star=? where num=?";
                 pstmt=conn.prepareStatement(sql);
                 //바인딩
                 pstmt.setString(1, dto.getSubject());
                 pstmt.setString(2, dto.getAddr());
                 pstmt.setString(3, dto.getContent());
                 pstmt.setString(4, dto.getStar());
                 pstmt.setString(5, dto.getNum());
              }else {
                 sql="update shareboard set subject=?, addr=?, photo=? , content=?, star=? where num=?";
                 pstmt=conn.prepareStatement(sql);
                 //바인딩
                 pstmt.setString(1, dto.getSubject());
                 pstmt.setString(2, dto.getAddr());
                 pstmt.setString(3, dto.getPhoto());
                 pstmt.setString(4, dto.getContent());
                 pstmt.setString(5, dto.getStar());
                 pstmt.setString(6, dto.getNum());
                 
                 
              }
              pstmt.execute();
           } catch (SQLException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
           }finally {
              my.dbClose(conn, pstmt);
           }
        }
     
        
        public List<ShareBoardDto> getSearchList(int start, int perpage, String search){
    		List<ShareBoardDto> list = new ArrayList<ShareBoardDto>();
    		Connection conn = null;
    		PreparedStatement pstmt = null;
    		ResultSet rs = null;
    		String sql = "select * from shareboard where addr like '%" + search + "%' limit ?,?";
    		
    		conn = my.getConnection();
    		try {
    			pstmt = conn.prepareStatement(sql);
    			pstmt.setInt(1, start);
    			pstmt.setInt(2, perpage);
    			rs = pstmt.executeQuery();
    			
    			while(rs.next()) {
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
    	               dto.setRegroup(rs.getInt("regroup"));
    	               dto.setRelevel(rs.getInt("relevel"));
    	               dto.setRestep(rs.getInt("restep"));     

    	               //list에 추가
    	               list.add(dto);
    			}
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} finally {
    			my.dbClose(conn, pstmt, rs);
    		}
    		
    		return list;
    	}
    	
    	
    	public int getSearchTotalCount(String search) {
    		int total = 0;
    		Connection conn = null;
    		PreparedStatement pstmt = null;
    		ResultSet rs = null;
    		String sql = "select count(*) from shareboard where addr like '%" + search + "%'";
    		
    		conn = my.getConnection();
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
    			my.dbClose(conn, pstmt, rs);
    		}
    		
    		
    		return total;
    	}
    	
    	 //댓글 수정
        public void updateShardBoardanswer(String content,String num) {
            Connection conn=null;
            PreparedStatement pstmt=null;
            String sql="update shareboard set content=? where num=?";
            conn=my.getConnection();
            try {
               pstmt=conn.prepareStatement(sql);
               pstmt.setString(1, content);
               pstmt.setString(2, num);
               pstmt.execute();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }finally {
               my.dbClose(conn, pstmt);
            }
         }
        
      //main에서 일부 페이지 보기  
        public List<ShareBoardDto> getMainList()
        {

           String sql="SELECT * FROM shareboard where not subject = 'no' ORDER BY num DESC limit 0,5";
           List<ShareBoardDto> list=new ArrayList<ShareBoardDto>();
           Connection conn=null;
           PreparedStatement pstmt=null;
           ResultSet rs=null;

           conn=my.getConnection();
           try {
              pstmt=conn.prepareStatement(sql);
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
                     dto.setRegroup(rs.getInt("regroup"));
                     dto.setRelevel(rs.getInt("relevel"));
                     dto.setRestep(rs.getInt("restep")); 
                 
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
}

      
