<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String addrdetail=request.getParameter("addrdetail");
	String email=request.getParameter("email");
	String hp=request.getParameter("hp");
%>
<%-- <jsp:useBean id="dao" class="data.dao.MemberDao"/>new 로 생성하는 것과 같다
<jsp:useBean id="dto" class="data.dto.MemberDto"/>new 로 생성하는 것과 같다 --%>
<!-- 전체 데이타 읽어서 dto 에 넣기 -->
<%-- <jsp:setProperty property="*" name="dto"/> --%>
<%
	MemberDao dao=new MemberDao();
	MemberDto dto=new MemberDto();
	
	dto.setId(id);
	dto.setPass(pass);
	dto.setName(name);
	if(address=="null")
		address="";
	dto.setAddress(address);
	
	if(addrdetail=="null")
		addrdetail="";
	dto.setAddrdetail(addrdetail);
	
	dto.setEmail(email);
	
	if(hp=="null")
		hp="";
	dto.setHp(hp);
	
	//메서드 호출
	dao.insertMember(dto);
	//successpage 페이지 이동
	response.sendRedirect("../index.jsp?main=member/successpage.jsp");
%>