<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 또똣 :: 제주여행의모든것</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
<style type="text/css">
	div.layout div.title {
		height: 130px;
		line-height: 130px;
		margin-bottom: 30px;
	}
	
	div.layout div.login {
		position: absolute;
		left: 1200px;
		top: 160px;		
	}
	
	div.layout div.main {
<<<<<<< HEAD
		position: absolute;
		left: 100px;
		top: 200px;
		margin-bottom: 150px;
		margin-right: 100px;
=======
		max-width: 100%;
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
	}
</style>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
</head>
<%
	// 메인페이지에 들어갈 파일 읽기
	String mainPage = "layout/main.jsp";
	if(request.getParameter("main") != null){
		mainPage = request.getParameter("main");
	}
%>
<body>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
<div class="layout">
   <!-- 타이틀 부분 -->
   <div class="title">
      <jsp:include page="layout/title.jsp"/>
   </div>
   <!-- 로그인 부분 -->
   <div class="login">
      <jsp:include page="layout/login.jsp"/>
   </div>
<<<<<<< HEAD
   <!-- 제주도 지도 부분 -->
=======
   <!-- 제주도 지도부분 -->
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
   <div class="main">
      <jsp:include page="<%=mainPage %>"/> 
   </div>
</div>
</body>
</html>