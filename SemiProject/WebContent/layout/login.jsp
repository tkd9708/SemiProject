<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
%>
<body>
<a class="main_login">login</a>
<a class="main_mypage">mypage</a>
<script type="text/javascript">
	$(function(){
		  $("a.main_login").click(function(e){
			  e.preventDefault();
			  location.href="<%=url%>/index.jsp?main=member/loginform.jsp";
		  });
		  
		  $("a.main_mypage").click(function(e){
			  e.preventDefault();
			  location.href="<%=url%>/index.jsp?main=mypage/mypage.jsp";
		  });
	});
  
</script>
</body>
</html>