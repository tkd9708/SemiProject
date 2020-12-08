<%@page import="data.dto.SpotlistDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.SpotlistDao"%>
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
	SpotlistDao db = new SpotlistDao();	
	MultipartRequest multi = null;
	String realFolder = getServletContext().getRealPath("/addspotsave");
	int uploadSize = 2048*2048*2;
	
	try{
		multi = new MultipartRequest(request,realFolder,uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String contentsid = multi.getParameter("contentsid");
		String title = multi.getParameter("title");
		String label1 = multi.getParameter("label1");
		String label2 = multi.getParameter("label2");
		String addr = multi.getParameter("addr");
		String detailaddr = multi.getParameter("detailaddr");
	
		detailaddr=detailaddr.trim();
		String roadaddr = addr+" "+detailaddr;

	String lat = multi.getParameter("latitude");
	String lon = multi.getParameter("longitude");
	if(lat==null) lat = "0";
	if(lon==null) lon ="0";
		//String addr = multi.getParameter("addr");
		Double latitude = Double.parseDouble(lat);
		Double longitude = Double.parseDouble(lon);
		String tag = multi.getParameter("tag");
		String introduction = multi.getParameter("introduction");
		String img = multi.getFilesystemName("img");
		String thumbnail = multi.getFilesystemName("thumbnail");
		
		SpotlistDto dto = new SpotlistDto();
		dto.setContentsid(contentsid);
		dto.setTitle(title);
		dto.setLabel1(label1);
		dto.setLabel2(label2);
		dto.setRoadaddr(roadaddr);
		//dto.setAddr(addr);
		dto.setLatitude(latitude);
		dto.setLongitude(longitude);
		dto.setTag(tag);
		dto.setIntroduction(introduction);
		dto.setImg(img);
		dto.setThumbnail(thumbnail);
		
		db.addSpot(dto);
		
		String path = "../index.jsp?main=spot/spotlist.jsp?area="+label2;
		response.sendRedirect(path);
	}catch(Exception e){
		e.printStackTrace();
		out.write("파일 업로드 오류: "+e.getMessage());
		}

%>
<body>

</body>
</html>