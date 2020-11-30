package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.MemberDto;
import data.dto.ZipcodeDto;
import mysql.db.MysqlConnect;

public class MemberDao {
	MysqlConnect db=new MysqlConnect();
	
	//아이디가 있으면 true반환,없으면 false반환
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
			//바인딩
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
	
	//이메일이 있으면 true반환,없으면 false반환
	public boolean isEmailSearch(String email)
	{
		boolean find=false;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="SELECT * FROM member WHERE email='"+email+"'";
		
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
	
	//insert
	public void insertMember(MemberDto dto)
	{
		/*
		 * String sql="insert into member values (seq_mini.nextval,"
		 * +"?,?,?,?,?,?,?,sysdate)";
		 */
		
		String sql="insert into member (id,pass,name,address,addrdetail,email,hp) VALUES ('"+dto.getId()+"','"+dto.getPass()+"','"+dto.getName()+"','"+dto.getAddress()+"', '"+dto.getAddrdetail()+"', '"+dto.getEmail()+"', '"+dto.getHp()+"')";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		Statement stmt=null;
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			
			stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//db.dbClose(conn, pstmt);
			db.dbClose(conn, stmt);
		}
	}
	
	//전체 회원 목록
	public List<MemberDto> getAllMembers()
	{
		List<MemberDto> list=new ArrayList<MemberDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from member order by id asc";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setAddrdetail(rs.getString("addrdetail"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
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
	
	//아이디가 해당하는 비번이 맞으면 true반환,틀리면 false반환
	public boolean isIdPassCheck(String id,String pass)
	{
		boolean find=false;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="SELECT * FROM member WHERE id='"+id+"' and pass='"+pass+"'";
		
		conn=db.getConnection();
		
		try {
			stmt=conn.createStatement();
			
			rs=stmt.executeQuery(sql);
			
			if(rs.next())
				find=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return find;
	}
	
	//로그인시 필요한 메서드
	//아이디가 DB 명단에 없을경우 1반환
	//아이디는 있는데 비번이 안맞는경우 2반환
	//아이디와 비번 모두 맞는경우 3 반환
	public int loginProcess(String id,String pass)
	{
		int ans=0;
		if(this.isIdSearch(id))
		{
			//아이디가 존재하는 경우
			//비번이 맞는지 체크하기
			if(this.isIdPassCheck(id, pass))
			{
				//비번이 맞는경우
				ans=3;
			}
			else
			{
				//비번이 틀린경우
				ans=2;
			}
		}
		else
		{//아이디가 아예 존재하지 않는경우
			ans=1;
		}
		
		return ans;
	}
	
	public String getName(String id)
	{
		String name="";
		Connection conn=null;
		Statement stmt=null;
		
		ResultSet rs=null;
		String sql="select name from member where id='"+id+"'";
		
		
		conn=db.getConnection();
		
		try {
			//pstmt=conn.prepareStatement(sql);
			//바인딩
//			pstmt.setString(1, id);
//			rs=pstmt.executeQuery();
//			if(rs.next())
//				name=rs.getString("name");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				name=rs.getString("name");				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, stmt, rs);
		}	
		return name;
	}
	
	//동에 해당하는 주소 반환하는 메서드
	public List<ZipcodeDto> getSearchDong(String dong)
	{
		List<ZipcodeDto> list=new Vector<ZipcodeDto>();
		String sql="select zipcode,sido,gugun,dong, IFNULL(ri,' ') as ri, "
				+ "IFNULL(bunji,' ') as bunji from zipcode "
				+ "where dong like ?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, "%"+dong+"%");
			//실행
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				ZipcodeDto dto=new ZipcodeDto();
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setRi(rs.getString("ri"));
				dto.setBunji(rs.getString("bunji"));
				//리스트에 추가
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
}
