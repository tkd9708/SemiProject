<%@page import="data.dao.WishlistDao"%>
<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); 
%>
<!-- useBean dto, dao 선언 -->
<jsp:useBean id="dao" class="data.dao.WishlistDao"/>
<jsp:useBean id="dto" class="data.dto.WishlistDto"/>

<!-- dto에 데이터 넣어서 읽기, setProperty -->
<jsp:setProperty property="*" name="dto"/>
<%
//insert 메소드 호출
dao.insertContent(dto);

String calPage=dto.getWishday();
String []split = calPage.split("-");
session.setAttribute("year", split[0]);
session.setAttribute("month",split[1]);
//System.out.println(calPage);
//response.sendRedirect(request.getHeader("referer"));
response.sendRedirect("../index.jsp?main=mypage/mypage.jsp");
//response.sendRedirect("../index.jsp?main=mypage/mypage.jsp?calPage="+calPage);//@@@@@@@@@@경로수정
%>
