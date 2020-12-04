<%@page import="data.dto.SpotReviewDto"%>
<%@page import="data.dao.SpotReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String star = request.getParameter("stars");
	String contentsid = request.getParameter("contentsid");
	String content = request.getParameter("content");
	
	SpotReviewDao dao = new SpotReviewDao();
	SpotReviewDto dto = new SpotReviewDto();
	dto.setNum(num);
	dto.setStar(Integer.parseInt(star));
	dto.setContent(content);
	dao.update(dto);
	
	response.sendRedirect("../index.jsp?main=spot/spotdetail.jsp?contentsid=" + contentsid + "#spotReview");
%>