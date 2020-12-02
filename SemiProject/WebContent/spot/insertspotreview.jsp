<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="data.dao.SpotReviewDao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.SpotReviewDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	dao.spotReviewInsert(dto);
	response.sendRedirect("../index.jsp?main=spot/spotdetail.jsp?contentsid=" + dto.getContentsid());
%>