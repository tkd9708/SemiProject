<%@page import="data.dao.ShareBoardDao"%>
<%@page import="data.dto.ShareBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("utf-8");   
   String num=request.getParameter("num");
   String id=request.getParameter("id");
   String content=request.getParameter("content");
   ShareBoardDto dto = new ShareBoardDto();
   dto.setNum(num);
   dto.setId(id);
   dto.setSubject("no");
   dto.setStar("0");
   dto.setAddr("no");
   dto.setContent(content==null?"no":content);
   
   dto.setPhoto("no");
   ShareBoardDao dao = new ShareBoardDao();
   //System.out.println(dto.getNum());
   dao.insertBoard(dto);
   
   
%>