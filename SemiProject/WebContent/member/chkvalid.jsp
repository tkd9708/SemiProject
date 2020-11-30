<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");

	String pass1=request.getParameter("pass1");
	String pass2=request.getParameter("pass2");
	/* System.out.println(pass1+" vs "+pass2); */
	boolean samePw = false;
	samePw = !(pass1.equals(pass2)) ? false : true;
	/* System.out.println(samePw); */
	
	String pass1V=request.getParameter("pass1V");
	MemberDto dto=new MemberDto();
	boolean validPw = dto.isPwVal(pass1V);
%>
<data>
	<samepw><%=samePw?"yes":"no"%></samepw>
	<validpw><%=validPw?"yes":"no"%></validpw>
</data>