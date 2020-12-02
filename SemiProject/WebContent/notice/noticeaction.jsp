
<%@page import="java.util.Enumeration"%>
<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>


</head>
<%
	NoticeDao db=new NoticeDao();
	
	MultipartRequest multi=null;
	String realFolder=getServletContext().getRealPath("/noticesave");
	int uploadSize=1024*1024*2;
	
	try{
		multi=new MultipartRequest(request,realFolder,
		uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String subject=multi.getParameter("subject");
		String id=multi.getParameter("id");
		String content=multi.getParameter("content");
		
		String files="";
		   //파일은 파일타입의 name들을 먼저 얻은후 반복하여 파일명을 얻는다
		   Enumeration en=multi.getFileNames();
		   while(en.hasMoreElements())
		   {
			
				   //파일선택을 안한경우는 null이므로 빼고 처리
				   String tagName=en.nextElement().toString();
				   //실제 업로드된 파일명
				   String fileName=multi.getFilesystemName(tagName);
				   if(fileName!=null){
					   files+=fileName+",";
			   
					   
				   }
			   }
		   //마지막 컴마 제거
		   if(files.length()>0)
			   files=files.substring(0,files.length()-1);
		   else
			  
			      files="no";//파일을 업로드안한경우
		
		NoticeDto dto=new NoticeDto();
		dto.setContent(content);
		dto.setId(id);
		dto.setSubject(subject);
		dto.setFiles(files);
		
		db.insertNotice(dto);
		
		//최근 추가된 num 구하기
		
		int num=db.getMaxNum();
		
		String path="../index.jsp?main=notice/noticecontent.jsp?num="+num+"&pageNum=1";
		response.sendRedirect(path);
	}catch(Exception e){
		out.write("파일 업로드 오류:"+e.getMessage());
	}
%>
<body>
</body>
</html>





