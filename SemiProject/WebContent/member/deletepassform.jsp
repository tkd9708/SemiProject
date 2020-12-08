<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/deletepassform.css">
</head>
<%
	String id=request.getParameter("id");
%>
<body>
<div class="alert alert-info">
	<form action="member/deletepassaction.jsp" method="post">
		<!-- hidden -->
		<input type="hidden" name="id" value="<%=id%>">
		<b>가입시 입력한 비밀번호를 넣어주세요</b><br><br>
		<input type="password" name="pass"
		required="required" autofocus="autofocus" class="passInput">
		
		<button type="submit" class="btnOut">회원탈퇴</button>
	</form>
</div>
</body>
</html>