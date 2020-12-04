<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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