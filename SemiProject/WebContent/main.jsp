<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="layout">
   <!-- 타이틀 부분 -->
   <div class="title">
      <jsp:include page="layout/title.jsp"/>
   </div>
   <!-- 로그인 부분 -->
   <div class="login">
      <jsp:include page="layout/login.jsp"/>
   </div>
   <!-- 제주도 지도 부분 -->
   <div class="jejuisland">
      <jsp:include page="layout/jejuisland.jsp"/> 
   </div>
</div>
</body>
</html>