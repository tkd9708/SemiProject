<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if((String)session.getAttribute("loginok")=="success")
	{
		response.sendRedirect("../index.jsp?main=member/mypage.jsp");
	}
	else
	{%>
		<script type="text/javascript">
			alert("로그인을 해야 볼수 있습니다. 로그인을 해주세요.");
			history.back();
		</script>
	<%}%>
%>