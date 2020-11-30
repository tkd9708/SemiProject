<%@page import="data.dao.NoticeAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//idx 읽기
    String idx=request.getParameter("idx");
    //dao선언
    NoticeAnswerDao adao=new NoticeAnswerDao();
    //삭제
    adao.deleteAnswer(idx);
%>
