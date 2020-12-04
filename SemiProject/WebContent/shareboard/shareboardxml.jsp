<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.ShareBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String regroup = request.getParameter("regroup");
    ShareBoardDao dao=new ShareBoardDao();
    List<ShareBoardDto> list=dao.getReviewList(Integer.parseInt(regroup));
    %>
    <list>
    <%
    for(ShareBoardDto  dto:list)
    {
    	%>
   		<dto num="<%=dto.getNum() %>">
   		   <id><%=dto.getId() %></id>
		   <content><%=dto.getContent()%></content>
		   <star><%=dto.getStar()%></star>
		   <writeday><%=dto.getWriteday()%></writeday>
		</dto>
	

    	<%
    }
    
%>
</list>
