<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //한글 엔코딩
   request.setCharacterEncoding("utf-8");
   
   
   //pageNum 읽기
   String pageNum=request.getParameter("pageNum");


%>
<!-- useBean dto,dao 선언 -->
  <jsp:useBean id="dto" class="data.dto.NoticedAnswerDto"/>
  <jsp:useBean id="dao" class="data.dao.NoticeAnswerDao"/>

<!-- dto에 데이터 읽어서 넣기 : setProperty -->
   <jsp:setProperty property="*" name="dto"/>
<%

   //insert 메서드 호출
   dao.insertShareAnswer(dto);
   
   
   
   //보던 페이지로 이동해야한다
   String go="../index.jsp?main=notice/noticelist.jsp?pageNum="+pageNum;
   response.sendRedirect(go);
   
   
%>