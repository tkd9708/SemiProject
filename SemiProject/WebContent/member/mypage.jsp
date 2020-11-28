<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String url=request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=url%>/member/css/mypage.css">
<%
	//session 에 saveid 가 있을경우(아이디저장체크한경우)
	//세션에서 myid를 얻는다
	String saveid=(String)session.getAttribute("saveid");
	String id="";
	if(saveid!=null){
		id=(String)session.getAttribute("myid");
	}
	String idcf=(String)session.getAttribute("myid");
%>
<script type="text/javascript">
	window.onload = function() {
		var mbList=document.getElementById("mbList");
		mbList.setAttribute("hidden", "hidden");	
		if("<%=idcf%>"=="admin") {
			console.log("<%=idcf%>");
			mbList.removeAttribute("hidden");
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<ul>
			<li>
				<div class="mbList" id="mbList">
					<a href="index.jsp?main=member/memberlist.jsp" class="ambList">회원 명단</a>
				</div>				
			</li>
		</ul>
	</nav>
</body>
</html>