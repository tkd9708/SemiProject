
<%@page import="data.dto.ShareBoardDto"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@page import="java.util.Enumeration"%>
>
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
	ShareBoardDao db=new ShareBoardDao();
	
	MultipartRequest multi=null;
	String realFolder=getServletContext().getRealPath("/shareboardsave");
	int uploadSize=1024*1024*2;
	
	try{
		multi=new MultipartRequest(request,realFolder,
		uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String addr=multi.getParameter("addr");
		String photo=multi.getFilesystemName("photo");
		String star=multi.getParameter("stars");
		
		
	    System.out.print(star);
	
	
		
		ShareBoardDto dto=new ShareBoardDto();
		dto.setSubject(subject);
        dto.setContent(content);
		dto.setPhoto(photo==null?"no":photo);
		dto.setAddr(addr);
		dto.setStar(star);
		
		db.insertShare(dto);
		
		//최근 추가된 num 구하기
		int num=db.getMaxNum();
		
		String path="../index.jsp?main=shareboard/shareboardlist.jsp?num="+num+"&pageNum=1";
		response.sendRedirect(path);
	}catch(Exception e){
		out.write("파일 업로드 오류:"+e.getMessage());
	}
%>
<body>
</body>
</html>





