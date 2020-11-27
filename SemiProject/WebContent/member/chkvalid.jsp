<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");

	String pass1=request.getParameter("pass1");
	String pass2=request.getParameter("pass2");
	boolean samePw = false;
	samePw = (pass1 != pass2) ? false : true;
%>
<data>
	<samepw><%=samePw?"yes":"no"%></samepw>
</data>