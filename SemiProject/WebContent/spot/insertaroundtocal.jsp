<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dao.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String space = request.getParameter("space");
	String addr = request.getParameter("addr");
	String wishday = request.getParameter("wishday");
	String aroundId = request.getParameter("aroundId");
	String content = space + "," + addr;
	
	MemberDao mdao = new MemberDao();
	String memNum = mdao.getMemNum(aroundId);
	
	WishlistDao dao = new WishlistDao();
	WishlistDto dto = new WishlistDto();
	dto.setAroundId(aroundId);
	dto.setContent(content);
	dto.setWishday(wishday);
	dto.setMemNum(memNum);
	
	dao.insertAround(dto);
%>