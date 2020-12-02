<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/login.css">
<script type="text/javascript">
function MyAlert(){
    this.make = function(modal){
        var winW = window.innerWidth;
        var winH = window.innerHeight;
        var modaloverlay = document.getElementById('modaloverlay');
		      
        var modalbox = document.getElementById('modalbox');
        modaloverlay.style.display = "block";
        modaloverlay.style.height = winH+"px";
        modalbox.style.left = (winW/2) - (500 * .5)+"px";
        modalbox.style.top = "100px";
        modalbox.style.display = "block";
        document.getElementById('modalboxhead').innerHTML = "경고창";
        document.getElementById('modalboxbody').innerHTML = modal;
        document.getElementById('modalboxfoot').innerHTML = '<button id="modalBtn" onclick="Alert.ok()">예</button>';
    }
	this.ok = function(){
		document.getElementById('modalbox').style.display = "none";
		document.getElementById('modaloverlay').style.display = "none";
	}
}

var Alert = new MyAlert();

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
		
		$("a.main_mypage").click(function(e) {
			<%
			if(loginok=="success")
			{	
			%>
				location.href="index.jsp?main=member/mypage.jsp";
			<%}
			else
			{
			%>
			Alert.make('로그인을 해야 볼 수 있습니다. 로그인을 해주세요.');
			<%}
			%>
		});
	});
</script> 
<title>Insert title here</title>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
	/* System.out.println((String)session.getAttribute("loginok")); */
%>
</head>
<body>
<a class="main_login" id="mainLogin">Login</a>
<a class="main_mypage">mypage</a>

<div id="modaloverlay"></div>
<div id="modalbox">
  <div id="positionBox">
    <div id="modalboxhead"></div>
    <div id="modalboxbody"></div>
    <div id="modalboxfoot"></div>
  </div>
</div>
</body>
</html>