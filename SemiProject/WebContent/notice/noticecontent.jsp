
<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@page import="java.io.File"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
   #cl-dashboard{display: none;}
   
  div.contentform{
     margin: 0 auto;
     margin-top: 200px;
     margin-left: 550px;
   }
   
   /*버튼 css*/

html, body {
  height: 100%;
}

.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  width: 100px;
  height: 40px;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: #000;
  background-color: #ffc34d;
  border: none;
  border-radius: 45px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  
 }
 
 div.point{
  position: relative;
  top: -30px;
  right: -830px;
 }
  


.button:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}

#btn{
  color: white;
}
   
</style>
</head>
<body>
<%
   String num=request.getParameter("num");   
   String pageNum=request.getParameter("pageNum");
   String key=request.getParameter("key");
   
   //key 값이 널값이 아니면서 'list' 일경우 
   //(이유:수정후에도 content.jsp 로 오기때문에 목록에서
    //         올 경우에만 증가함)
   //조회수 증가
   NoticeDao db=new NoticeDao();
   if(key!=null && key.equals("list"))
      db.updateReadcount(num);
   
   //번호에 해당하는 dto 가져오기
   NoticeDto dto=db.getData(num);
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>   
<div class="contentform">
<table class="table table-striped" style="width: 800px;">
   <tr>
      <td width="350">
         <b>제목: <%=dto.getSubject()%></b>
      </td>
      <td>
         <span style="font-size: 9pt;float: right;" >
         <%=dto.getWriteday()%></span>
      </td>
   </tr>
   <tr height="350">
      <td colspan="2" valign="top">
         <b>관리자:&nbsp;<%=dto.getId()%></b>
         <br><br>         
         <span><%=dto.getContent()%></span>   
      </td>
   </tr>
   <tr>
      <td colspan="2">
         <span style="color: black;font-size: 9pt;">
         조회수&nbsp; <%=dto.getReadcount() %>
         </span>         
      </td>
   </tr>
   <tr>
      <td colspan="2" align="right" >
         <input type="button" class="button"
           value="댓글" style="width: 60px;color: white;"
           onclick="location.href='index.jsp?main=notice/noticeform.jsp'">
         <input type="button" class="button"
           value="목록" style="width: 60px;color: white;"
           onclick="location.href='index.jsp?main=notice/noticelist.jsp?pageNum=<%=pageNum%>'">         
      </td>
   </tr>   
</table>
</div>
</body>
</html>