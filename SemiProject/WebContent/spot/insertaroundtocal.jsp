<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dao.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   request.setCharacterEncoding("utf-8");
   String category = request.getParameter("category");
   String addr = request.getParameter("addr");
   String wishday = request.getParameter("wishday");
   String aroundId = request.getParameter("aroundId");
   String myId = request.getParameter("myId");
   if(category.equals("CE7")){
      category = "카페";
   }
   else if(category.equals("FD6")){
      category = "음식점";
   }
   else if(category.equals("AD5")){
      category = "숙박";
   }
   
   String content = category + "," + addr;
   
   
   WishlistDao dao = new WishlistDao();
   WishlistDto dto = new WishlistDto();
   dto.setAroundId(aroundId);
   dto.setContent(content);
   dto.setWishday(wishday);
   dto.setMemId(myId);
   
   dao.insertAround(dto);
%>