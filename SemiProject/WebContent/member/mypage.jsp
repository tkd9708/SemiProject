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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="showPage" id="showPage">
		<nav>
			<ul>
				<li>
					<div class="mbList" id="mbList">
						<a href="index.jsp?main=member/memberlist.jsp" class="ambList">회원 명단</a>
					</div>				
				</li>
				<li>
					<div class="myMenu1" id="myMenu1">
						<a href="#">메뉴1</a>
					</div>
				</li>
			</ul>
		</nav>
		<div>
			<jsp:include page="../member/info.jsp"/>
		</div>
	</div>
<script type="text/javascript">
	window.onlaod = function(){
		if("<%=(String)session.getAttribute("loginok")%>" != "success"){
			var showPage = document.getElementById("showPage");
			showPage.setAttribute("hidden", "hidden");
			if(confirm("로그인이 필요한 페이지입니다. 로그인하시겠습니까?") == true){	//확인
				location.href="index.jsp?main=member/reallogin.jsp";
			}
			else{	//취소
				location.href="index.jsp";
			}
		}
		
		var mbList=document.getElementById("mbList");
		mbList.setAttribute("hidden", "hidden");	
		if("<%=idcf%>"=="admin") {
			console.log("<%=idcf%>");
			mbList.removeAttribute("hidden");
		}		
	});
</script>
</body>
</html>