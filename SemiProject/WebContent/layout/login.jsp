<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/login.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		<%
		if((String)session.getAttribute("loginok")=="success"){
		%>
		$("a.main_login").text("Logout");
		<%}
		else
		{%>
			$("a.main_login").text("Login");	
		<%}
		%>
	});
</script>
</head>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
	/* System.out.println((String)session.getAttribute("loginok")); */
%>
<body>
<a class="main_login" id="mainLogin">Login</a>
<a class="main_mypage" href="index.jsp?main=member/mypage.jsp">mypage</a>
<script type="text/javascript">
  $("a.main_login").click(function(e){
	  e.preventDefault();
	  <%
	  if((String)session.getAttribute("loginok")=="success")
	  {%>
	  	location.href="member/logoutaction.jsp";
	  <%}
	  else
	  {
	  %>
	  location.href="index.jsp?main=member/loginform.jsp";
	  <%-- location.href="<%=url%>/index.jsp?main=member/loginform.jsp"; --%>
	  <%}
	  %>
  });
</script>
</body>
</html>