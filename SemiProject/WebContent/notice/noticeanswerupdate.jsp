<%@page import="data.dao.NoticeAnswerDao"%>
<%@page import="data.dto.NoticedAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
   String idx=request.getParameter("idx");
   String memo=request.getParameter("memo");
   
   NoticeAnswerDao dao=new NoticeAnswerDao();
   dao.updateAnswer(idx, memo);
%>