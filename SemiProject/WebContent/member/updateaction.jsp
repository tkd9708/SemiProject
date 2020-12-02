<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.MemberDao"/>
<jsp:useBean id="dto" class="data.dto.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	//isIdPassCheck 호출
	boolean find=dao.isIdPassCheck(dto.getId(), dto.getPass());
	//find가 true면 수정메서드호출후 memberlist 즉 목록이 나오도록 하고
	//만약 false 면 script 코드로 alert 경고후 이전페이지로 가기
	if(find)
	{
		dao.updateMember(dto);
		response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
	}
	else
	{%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			history.back();	
		</script>
	<%}
%>