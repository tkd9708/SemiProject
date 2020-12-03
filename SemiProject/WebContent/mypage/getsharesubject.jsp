<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysql.db.MysqlConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>

<sharelist>
<%
	//String memId = request.getParameter("memId");
	String num = request.getParameter("shareNum");
	MysqlConnect db = new MysqlConnect();
	//System.out.println(contentsid);
	String sql = "select * from shareboard where num = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	conn = db.getConnection();
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,num);
		rs = pstmt.executeQuery();
		while(rs.next()){
			%>
			<share>
				<subject><%=rs.getString("subject") %></subject>
				<num><%=rs.getString("num") %></num>
			</share>
	<%
		}
	
	}catch(SQLException e){
		e.printStackTrace();
	}finally {
		
		db.dbClose(conn, pstmt, rs);
	}
	
%>
</sharelist>		