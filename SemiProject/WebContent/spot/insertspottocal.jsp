<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.SpotlistDto"%>
<%@page import="data.dao.SpotlistDao"%>
<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dao.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String wishday = request.getParameter("wishday");
	String spotId = request.getParameter("spotId");
	String myId = request.getParameter("myId");
	String content = "no";
	
	SpotlistDao sdao = new SpotlistDao();
	SpotlistDto sdto = sdao.getData(spotId);
	
	MemberDao mdao = new MemberDao();
	String memNum = mdao.getMemNum(myId);
	
	WishlistDao dao = new WishlistDao();
	WishlistDto dto = new WishlistDto();
	dto.setSpotId(spotId);
	dto.setContent(content);
	dto.setWishday(wishday);
	dto.setMemNum(memNum);
	
	dao.insertSpot(dto);
%>