<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="data.dao.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//num
String num = request.getParameter("num");

String wishday = request.getParameter("wishday");
//dao
WishlistDao dao = new WishlistDao();
dao.deleteContent(num);
//response.sendRedirect("mypage.jsp");//@@@@@@@@@@경로수정
String year = wishday.substring(0, 4);
String month = wishday.substring(4,6);
session.setAttribute("year", year);
session.setAttribute("month", month);

//response.sendRedirect("../index.jsp?main=mypage/mypage.jsp");
%>
 <script type="text/javascript">
history.back();
</script>