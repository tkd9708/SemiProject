<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="font/SCDream5.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
    height: 100%;
     overflow: -moz-scrollbars-vertical; 
} 
::-webkit-scrollbar {
    display: none; 
}

div.layout div.title {
    position: absolute;
    top: 0px;
    z-index: 3;
    font-family: SCDream5;
}
div.layout div.main {
    position: relative;
    z-index: 1;
    height: 100%;
    font-family: SCDream5;
}
div.layout div.footer {
    position: inherit;
    z-index: 1;
    bottom: 0;
    padding: 30px 0;
    font-family: SCDream5;

a {
	cursor:pointer;
}
</style>

</head>
<%
	// 메인페이지에 들어갈 파일 읽기
	String mainPage = "layout/main.jsp";
	if(request.getParameter("main") != null){
		mainPage = request.getParameter("main");
	}
	//System.out.println((String)session.getAttribute("myid"));
%>
<body>

	<div class="layout">
		<!-- 타이틀 부분 -->
		<div class="title">
			<jsp:include page="layout/title.jsp" />
		</div>
		<!-- 제주도 지도부분 -->
		<div class="main" id="main">
			<jsp:include page="<%=mainPage%>" />
		</div>
	    <!-- footer부분 -->
		<footer>
		     <jsp:include page="layout/footer.jsp" />
		</footer>
	</div>
		
</body>
</html>