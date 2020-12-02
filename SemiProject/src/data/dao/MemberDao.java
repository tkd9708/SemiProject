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
	
	//��ü ȸ�� ���
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
	
	//���̵� �ش��ϴ� ����� ������ true��ȯ,Ʋ���� false��ȯ
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
	
	//�α��ν� �ʿ��� �޼���
	//���̵� DB ��ܿ� ������� 1��ȯ
	//���̵�� �ִµ� ����� �ȸ´°�� 2��ȯ
	//���̵�� ��� ��� �´°�� 3 ��ȯ
	public int loginProcess(String id,String pass)
	{
		int ans=0;
		if(this.isIdSearch(id))
		{
			//���̵� �����ϴ� ���
			//����� �´��� üũ�ϱ�
			if(this.isIdPassCheck(id, pass))
			{
				//����� �´°��
				ans=3;
			}
			else
			{
				//����� Ʋ�����
				ans=2;
			}
		}
		else
		{//���̵� �ƿ� �������� �ʴ°��
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
			//���ε�
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
	
	public String getMemNum(String id)
	{
		String num="";
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		ResultSet rs=null;
		String sql="select num from member where id=?";
		
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}	
		return num;
	}
	
	public MemberDto getData(String num)
	{
		MemberDto dto = new MemberDto();
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		ResultSet rs=null;
		String sql="select * from member where num=?";
		
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setAddrdetail(rs.getString("addrdetail"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}	
		return dto;
	}
}
