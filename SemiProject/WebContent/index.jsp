<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 또똣 :: 제주여행의모든것</title>
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
    -ms-overflow-style: none; 
} 
::-webkit-scrollbar {
    display: none; 
}

div.layout div.title {
    position: absolute;
    top: 0px;
    z-index: 3;
}
div.layout div.main {
    position: relative;
    z-index: 1;
}
 
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
		<div class="main">
			<jsp:include page="<%=mainPage%>" />
		</div>
	</div>
</body>
</html>