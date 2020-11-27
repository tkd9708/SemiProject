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

  <!--Import materialize.css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
 
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<style type="text/css">
	div.layout div.title {
		height: 130px;
		line-height: 130px;
		margin-bottom: 30px;
	}
	 
	div.layout div.login {
	    text-align:right;
		padding-right: 100px;
		font-size: 20px;
		
	}
	
	div.layout div.main {
		position: absolute;
		left: 100px;
		top: 1200px;
		margin-bottom: 150px;
		margin-right: 100px;
	}
</style>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
	  $(".slider").slider({
		  full_width: true,
	      height : 700, 
	      interval: 4000,
	      indicators: false
	  });
	});
  });
</script>
</head>
<%
	// 메인페이지에 들어갈 파일 읽기
	String mainPage = "layout/main.jsp";
	if(request.getParameter("main") != null){
		mainPage = request.getParameter("main");
	}
%>
<body>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>

<div class="layout">
   <!-- 타이틀 부분 -->
   <div class="title">
      <jsp:include page="layout/title.jsp"/>
   </div>
   <!-- 로그인 부분 -->
   <div class="login">
      <jsp:include page="layout/login.jsp"/>
   </div>

   <!-- 상단 슬라이드 부분 -->
	<div class="slider">
		<ul class="slides">
			<li><img src="image/udo1.jpg">
				<div class="caption right-align">
					<h1>맨도롱 또똣</h1>
					<h5 class="indigo-text text-lighten-1">
					기분좋게 따뜻한</h5>
				</div></li>
			<li><img src="image/jeju2.jpg">
				<div class="caption left-align">
					<h1>올레</h1>
					<h5 class="light grey-text text-lighten-3">
					집 앞까지 이어지는 작은 골목길</h5>
				</div></li>
		    <li><img src="image/jeju1.jpg">
				<div class="caption center-align">
					<h1 style="color: #84c3ec;">인사리</h1>
					<h5 class="light grey-text text-lighten-3">
					외로움의 벗이 되는 것</h5>
				</div></li>
		 </ul>
	</div>
   <!-- 상단 슬라이드 부분 close -->

   <!-- 제주도 지도부분 -->
   <div class="main">
      <jsp:include page="<%=mainPage%>"/> 
   </div>
</div>
</body>
</html>