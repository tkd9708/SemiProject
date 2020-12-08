<%@page import="java.io.File"%>
<%@page import="data.dao.SpotlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String contentsid=request.getParameter("contentsid");
   SpotlistDao dao = new SpotlistDao();
   
   
   String realFolder = getServletContext().getRealPath("/addspotsave");
   String fileName = dao.getData(contentsid).getImg();
   File file = new File(realFolder+"\\"+fileName);
   file.delete();

   fileName = dao.getData(contentsid).getThumbnail();
   File file2 = new File(realFolder+"\\"+fileName);
   file2.delete();
   
   dao.spotdelete(contentsid);

%>