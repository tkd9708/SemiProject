<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
	String loginok=(String)session.getAttribute("loginok");
	System.out.println(loginok);
	System.out.println(idcf);
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getData(idcf);
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		<%
		if((String)session.getAttribute("loginok")!="success")
		{%>
			alert("로그인을 해야 볼 수 있습니다. 로그인해주세요");
			location.href="index.jsp";
		<%}
		%>
		$("#ambList").hide();
		if("<%=idcf%>"=="admin") {
			console.log("<%=idcf%>");
			$("#ambList").show();
		}		
	});
</script>
</head>
<body>
	<div class="showPage" id="showPage">
		<nav>
			<ul class="firstUl">
				<li>
					<a href="index.jsp?main=member/memberlist.jsp" class="ambList">회원 명단</a>
				</li>
				<li>
					<a href="#">내 정보 관리</a>
					<ul>
						<li>
							<a class="menust subMenu1" id="subMenu1"
							href="index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>">
							개인정보 수정</a>
						</li>
						<li>
							<a class="menust subMenu2" id="subMenu2"
							href="index.jsp?main=member/deletepassform.jsp?id=<%=dto.getId()%>">
							회원탈퇴</a>
						</li>
					</ul>
				</li>
			</ul>
		</nav>
		<div id="container">
			<div id="content">
				<div class="myPage">
					<jsp:include page="../member/info.jsp"/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>