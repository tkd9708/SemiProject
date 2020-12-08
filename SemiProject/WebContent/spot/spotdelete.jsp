<%@page import="data.dao.SpotlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contentsid=request.getParameter("contentsid");
	SpotlistDao dao = new SpotlistDao();
	dao.spotdelete(contentsid);



%>