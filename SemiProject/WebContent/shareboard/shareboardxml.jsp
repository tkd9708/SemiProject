<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ShareBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //String regroup = request.getParameter("regroup");
   String num=request.getParameter("num");
    ShareBoardDao dao=new ShareBoardDao();
    List<ShareBoardDto> list=dao.getReviewList(num);
    SimpleDateFormat sdf = new SimpleDateFormat();
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
         <writeday><%=sdf.format(dto.getWriteday())%></writeday>
      </dto>
   

       <%
    }
    
%>
</list>