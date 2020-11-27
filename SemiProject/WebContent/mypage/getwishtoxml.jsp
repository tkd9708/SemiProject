<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysql.db.MysqlConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=urf-8"
    pageEncoding="utf-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	MysqlConnect db = new MysqlConnect();

	String sql = "select * from wishlist where mem_id=?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	conn = db.getConnection();
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,mem_id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			%>
			<wishlist>
				<num><%=rs.getString("num") %></num>
				<mem_id><%=rs.getString("mem_id") %></mem_id>
				<spot_id><%=rs.getString("spot_id") %></spot_id>
				<share_num><%=rs.getString("share_num") %></share_num>
				<content><%=rs.getString("content") %></content>
				<wishday><%=rs.getString("wishday") %></wishday>
			</wishlist>
	<%
		}
	
	}catch(SQLException e){
		e.printStackTrace();
	}finally {
		db.dbClose(conn, pstmt, rs);
	}
	
%>
			