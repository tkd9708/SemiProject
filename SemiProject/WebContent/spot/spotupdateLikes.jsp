<%@page import="data.dao.SpotlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageNum = request.getParameter("pageNum");
	String contentsid = request.getParameter("contentsid");
	String area = request.getParameter("area");
	String search = request.getParameter("search");
	String selSearch = request.getParameter("selSearch");
	String select = request.getParameter("select");
	if(selSearch == null){
		selSearch = "no";
	}
	SpotlistDao dao = new SpotlistDao();
	dao.updateLikes(contentsid);
	
	if(area.equals("no")){
		response.sendRedirect("../index.jsp?main=spot/spotsearch.jsp?search=" + search + "&selSearch=" + selSearch+ "&pageNum=" + pageNum);
	}
	else if(search.equals("no")){
		response.sendRedirect("../index.jsp?main=spot/spotlist.jsp?area=" + area + "&pageNum=" + pageNum + "&select" + select);
	}
	
%>