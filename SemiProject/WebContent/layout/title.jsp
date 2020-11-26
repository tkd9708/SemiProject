<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    a.home{
       cursor: pointer;
    }
</style>
</head>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
%>
<body>
<a class="home">
  <img src="<%=url %>/image/title.png">
</a>
<script type="text/javascript">
  $("a.home").click(function(e){
	  e.preventDefault();
	  location.href="index.jsp";
  });
</script>
</body>
</html>