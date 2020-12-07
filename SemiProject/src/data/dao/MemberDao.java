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
	
	//삭제하는 메서드
	public void deleteMember(String id)
	{
		String sql="delete from member where id=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

	//id 에 해당하는 dto 반환
	public MemberDto getData(String id)
	{
		MemberDto dto=new MemberDto();
		
		Connection conn=null;
		
		Statement stmt=null;
		
		ResultSet rs=null;
		
		String sql="select * from member where id='"+id+"'";
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				//dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setAddrdetail(rs.getString("addrdetail"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				/*
				 * String email1=rs.getString("email").substring(0, 3); String
				 * email2=rs.getString("email").substring(4,rs.getString("email").length());
				 * dto.setEmail1(email1); dto.setEmail2(email2); String
				 * hp1=rs.getString("hp").substring(0, 3); String
				 * hp2=rs.getString("hp").substring(4,8); String
				 * hp3=rs.getString("hp").substring(9,rs.getString("hp").length());
				 * dto.setHp1(hp1); dto.setHp2(hp2); dto.setHp3(hp3);
				 */

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return dto;
	}
	
	//num 에 해당하는 dto 반환
	public MemberDto getDataByNum(String num)
	{
		MemberDto dto=new MemberDto();
		
		Connection conn=null;
		
		Statement stmt=null;
		
		ResultSet rs=null;
		
		String sql="select * from member where num="+num;
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				//dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setAddrdetail(rs.getString("addrdetail"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				
				
				/*
				 * String email1=rs.getString("email").substring(0, 3); String
				 * email2=rs.getString("email").substring(4,rs.getString("email").length());
				 * dto.setEmail1(email1); dto.setEmail2(email2); String
				 * hp1=rs.getString("hp").substring(0, 3); String
				 * hp2=rs.getString("hp").substring(4,8); String
				 * hp3=rs.getString("hp").substring(9,rs.getString("hp").length());
				 * dto.setHp1(hp1); dto.setHp2(hp2); dto.setHp3(hp3);
				 */

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return dto;
	}
	
	//수정-이름,핸드폰,이메일,주소만 수정
	public void updateMember(MemberDto dto)
	{
//		String sql="update member set name=?,hp=?,email=?,address=?," +
//				"addrdetail=? where num=?";
		String sql="update member set name='"+dto.getName()+"',hp='"+dto.getHp()+"',email='"+dto.getEmail()+"',address='"+dto.getAddress()+"',addrdetail='"+dto.getAddrdetail()+"' where num="+dto.getNum();
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		Statement stmt=null;
		
		conn=db.getConnection();
//			conn=db.getGangsaConnection();
		try {
				stmt=conn.createStatement();
				stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, stmt);
		}
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
	
	public int getTotalCount(String dong)
	{
		int total=0;
		//int n=0;
		
		String sql="select count(*) from zipcode where dong like '%" + dong + "%'";
		
		Connection conn=null;
		Statement stmt=null;
		
		ResultSet rs=null;
		
		conn=db.getConnection();
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next())
			{
				//total=rs.getInt("count(*)");
//				n=rs.getInt(1);
				total=rs.getInt(1);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return total;
	}
	
	public int getFullTotalCount(String sido,String gugun,String dong)
	{
		int total=0;
		
		String sql="select count(*) from zipcode where sido='"+sido+"' AND gugun='"+gugun+"' AND dong like '%"+dong+"%'";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next())
				total=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return total;
	}
	
	//페이징처리한 리스트 목록 반환
	public List<ZipcodeDto> getList(int start,int end,String dong)
	{
		List<ZipcodeDto> list=new ArrayList<ZipcodeDto>();
		String sql="SELECT a.* FROM (SELECT @rownum:=@rownum+1 as RNUM, b.* FROM (SELECT * FROM zipcode WHERE dong like '%"+dong+"%')b, (SELECT @rownum:=0) TMP)a WHERE a.RNUM>="+start+" and a.RNUM<="+end;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				ZipcodeDto dto=new ZipcodeDto();
				dto.setId(rs.getInt("id"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setRi(rs.getString("ri"));
				dto.setBunji(rs.getString("bunji"));
				//list 에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt, rs);
		}
		return list;
	}
	
	public List<ZipcodeDto> getFullslist(int start,int end,String sido,String gugun,String dong)
	{
		List<ZipcodeDto> list=new ArrayList<ZipcodeDto>();
		String sql="SELECT a.* FROM (SELECT @rownum:=@rownum+1 as RNUM, b.* FROM (SELECT * FROM zipcode WHERE sido='"+sido+"' AND gugun='"+gugun+"' AND dong LIKE '%"+dong+"%')b, (SELECT @rownum:=0) TMP)a WHERE a.RNUM>="+start+" and a.RNUM<="+end;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				ZipcodeDto dto=new ZipcodeDto();
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setRi(rs.getString("ri"));
				dto.setBunji(rs.getString("bunji"));
				//list 에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return list;
	}
	
	//사용자가 "ㄱ"를 입력한 경우 DB에서 검색해야 할 범위는 "가"부터 "깋"까지 입니다.
	public List<ZipcodeDto> getChoslist(String start,String end)
	{
		
		List<ZipcodeDto> list=new ArrayList<ZipcodeDto>();
		String sql="SELECT a.* FROM (SELECT DISTINCT sido,gugun,dong FROM zipcode WHERE dong >= '"+start+"' AND dong <= '"+end+"')a " + 
				"WHERE dong regexp '[^0-9](동|면|가|사서함)$' LIMIT 10";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				ZipcodeDto dto=new ZipcodeDto();
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return list;
	}
	
	// 초성 + 중성 + 종성이 입력된 상태
	// 사용자가 "감" 입력한 경우 DB에서 검색해야 할 범위는 "감"으로 시작하는 단어입니다.
	public List<ZipcodeDto> getSyllableList(String region)
	{
		List<ZipcodeDto> list=new ArrayList<ZipcodeDto>();
		String sql="SELECT a.* FROM (SELECT DISTINCT sido,gugun,dong from zipcode where dong LIKE '"+region+"%')a WHERE dong REGEXP '[^0-9](동|면|가|사서함)$' LIMIT 10";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		conn=db.getConnection();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				ZipcodeDto dto=new ZipcodeDto();
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, stmt, rs);
		}
		
		return list;
	}
}
