<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/login.css">
<title>Insert title here</title>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
	/* System.out.println((String)session.getAttribute("loginok")); */
%>
<script type="text/javascript">
	$(function(){
		<%String loginok=(String)session.getAttribute("loginok");
			String id=(String)session.getAttribute("myid");
		  System.out.println("현재 로그인한 상태는 " + loginok + "입니다\n 로그인한 아이디는 "+id+" 입니다.");%>
		if("<%=loginok%>" == "success"){
			$(".main_login").text("Logout");
		}
		else{
			$(".main_login").text("Login");
		}
		
		$("a.main_login").click(function(e){
			  e.preventDefault();
			  <%
			  if(loginok=="success")
			  {%>
			  	/* $("a.main_login").text("Logout"); */
			  	location.href="member/logoutaction.jsp";
			  <%}
			  else
			  {
			  %>
			  	/* $("a.main_login").text("Login"); */
			  	location.href="index.jsp?main=member/loginform.jsp";
			  <%-- location.href="<%=url%>/index.jsp?main=member/loginform.jsp"; --%>
			  <%}
			  %>
			  
		  });
	});
	
	
	  
	  <%-- $("button.main_login").click(function(e) {
		  alert("확인");
	  	if($(".RightbtnLogin").text()=="Login"){
	  		$(".RightbtnLogin").text("Logout");
		  	location.href="member/logoutaction.jsp";
	  	}
	  	else{
	  		$(".RightbtnLogin").text("Login");
	  		alert("로그아웃합니다");
		  	location.href="<%=url%>/index.jsp?main=member/loginform.jsp";	  		
	  	}
	  }); --%>
</script>
</head>
<body>
<a class="main_login" id="mainLogin">Login</a>
<!-- <button class="main_login" id="mainLogin"><span class="RightbtnLogin"></span></button> -->
<a class="main_mypage" href="member/beforemypageaction.jsp">mypage</a>
</body>
</html>