<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Libre+Barcode+128+Text&display=swap');
	span.barcode{
		font-family: 'Libre Barcode 128 Text';
		font-size: 30px;
		font-weight: bold;
	}
</style>
<%
	MemberDao dao=new MemberDao();
%>
</head>
<body>
<span class="barcode">121345217378</span><br><br>
<span class="glyphicon glyphicon-user"></span>
<b style="marin-left: 10px;"><%=dao.getName((String)session.getAttribute("myid"))%></b><br>
<span class="glyphicon glyphicon-home"></span>
<b style="marin-left: 10px;">주소</b><br>
<span class="glyphicon glyphicon-phone-alt"></span>
<b style="marin-left: 10px;">핸드폰</b><br>
</body>
</html>