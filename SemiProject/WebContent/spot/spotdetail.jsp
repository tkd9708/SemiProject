<%@page import="data.dao.SpotlistDao"%>
<%@page import="data.dto.SpotlistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
	.thumbnail {
		width: 500px;
		height: 500px;
		margin-left: 200px;
		margin-top: 80px;
		display: inline-block;
	
	}
	
	div.thumbnailDetail {
		display: inline-block;
		margin-left: 100px;
		width: 520px;
		height: 500px;
		vertical-align: bottom;
	}
	
	div#spot_review {
		height: 1000px;
	}
</style>
<%
	String contentsid = request.getParameter("contentsid");
	SpotlistDao dao = new SpotlistDao();
	SpotlistDto dto = dao.getData(contentsid);
%>
<body>
	<%
	if(dto.getThumbnail() != null){
		%>
		<img class="thumbnail" src="<%=dto.getThumbnail()%>">
		<%
	}
	else {
		%>
		<div class="thumbnail">썸네일 없음</div>
		<%
	}
	%>
	<div class="thumbnailDetail">
		<b style="font-size: 20pt;"><%=dto.getTitle() %></b>
		<span style="color: red; float: right; font-size: 30pt;" class="glyphicon glyphicon-heart-empty"></span>
		<br><br>
		<span style="color: #ccc; font-size: 13px;">&nbsp;&nbsp;&nbsp;<%=dto.getTag() %></span><br>
		<hr>
		<b style="color: gray;"><%=dto.getIntroduction() %></b>
		<br><br>
		<span style="color: #F0CD58; font-size: 18px;">★★★★★</span><br><br>
		<span class="glyphicon glyphicon-map-marker" style="margin-right: 10px;"></span>
		<%=dto.getRoadaddr() %>
		<br>
	</div>
	<hr>
	<div id="spot_review"></div>
</body>
</html>