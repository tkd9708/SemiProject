
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String myid = request.getParameter("myid");
%>
<!-- useBean dto, dao 선언 -->
<jsp:useBean id="dao" class="data.dao.WishlistDao"/>
<jsp:useBean id="dto" class="data.dto.WishlistDto"/>

<!-- dto에 데이터 넣어서 읽기, setProperty -->
<jsp:setProperty property="*" name="dto"/>
<%
//insert 메소드 호출
dao.insertContent(dto);
response.sendRedirect("../index.jsp?main=mypage/mypage.jsp");
%>