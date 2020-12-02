<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="data.dao.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//num
String num = request.getParameter("num");
//dao
WishlistDao dao = new WishlistDao();
dao.deleteContent(num);
//response.sendRedirect("mypage.jsp");//@@@@@@@@@@경로수정
%>
<script type="text/javascript">
history.back();
</script>