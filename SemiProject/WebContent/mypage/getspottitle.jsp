<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysql.db.MysqlConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>

<spotlist>
<%
	//String memId = request.getParameter("memId");
	String contentsid = request.getParameter("spotId");
	MysqlConnect db = new MysqlConnect();
	//System.out.println(contentsid);
	String sql = "select * from spotlist where contentsid = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	conn = db.getConnection();
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,contentsid);
		rs = pstmt.executeQuery();
		while(rs.next()){
			%>
			<spot>
				<title><%=rs.getString("title") %></title>
				<contentsid><%=rs.getString("contentsid") %></contentsid>
				<latitude><%=rs.getString("latitude") %></latitude>
				<longitude><%=rs.getString("longitude") %></longitude>
				<thumbnail><%=rs.getString("thumbnail") %></thumbnail>
			</spot>
	<%
		}
	
	}catch(SQLException e){
		e.printStackTrace();
	}finally {
		
		db.dbClose(conn, pstmt, rs);
	}
	
%>
</spotlist>		