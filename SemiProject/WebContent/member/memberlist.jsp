<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberDao dao=new MemberDao();
	
	List<MemberDto> list=dao.getAllMembers();
%>
<body>
	<h3><b>회원 명단</b></h3>
	<div class="infos">
		<%
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(MemberDto dto:list)
		{%>
		<div class="info">
			<span>
				<b>아이디 : </b> <%=dto.getId()%> <br>
				<b>이  름 : </b> <%=dto.getName()%> <br>
				<button type="button" class="btnUpdate">정보수정</button><br>
				<button type="button" class="btnOut">회원탈퇴</button><br>
				<b>핸드폰 : </b> <%=dto.getHp()%> <br>
				<b>주  소 : </b> <%=dto.getAddress()%> <br>
				<b>이메일 : </b> <%=dto.getEmail()%> <br>
				<b>가입일 : </b> <%=dto.getGaipday()%> <br>
			</span>
		</div>
		<%}
		%>
	</div>
</body>
</html>