<%@page import="data.dao.SpotlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	String contentsid = request.getParameter("contentsid");
	String area = request.getParameter("area");
	SpotlistDao dao = new SpotlistDao();
	dao.updateLikes(contentsid);
	
	response.sendRedirect("../index.jsp?main=spot/spotlist.jsp?area=a" + area + "&pageNum=" + pageNum);
%>