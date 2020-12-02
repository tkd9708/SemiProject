<?xml version="1.0" encoding="UTF-8"?>
<%@page import="data.dao.NoticeAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx=request.getParameter("idx");
NoticeAnswerDao dao=new NoticeAnswerDao();
String memo=dao.getMemo(idx);
%>

<memo><%=memo%></memo>

