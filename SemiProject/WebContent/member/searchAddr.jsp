<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.ZipcodeDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String start=request.getParameter("start");
	String end=request.getParameter("end");
	
	String region=request.getParameter("region");
	
	MemberDao dao=new MemberDao();
	
	List<ZipcodeDto> list;
	
	if(start!=null)
	{
		list=dao.getChoslist(start,end);
		//메서드 호출		
	}
	else
	{
		list=dao.getSyllableList(region);
	}
%>
<data>
	<%
	for(ZipcodeDto dto:list)
	{
	%>
	<address>
		<sido><%=dto.getSido()%></sido>
		<gugun><%=dto.getGugun()%></gugun>
		<dong><%=dto.getDong()%></dong>
	</address>
	<%}
	%>
</data>