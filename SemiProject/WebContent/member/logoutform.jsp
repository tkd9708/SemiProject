<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		$("div.cart").click(function(){
			location.href='index.jsp?main=shop/mycart.jsp';
		});
	});
</script>
</head>
<%
	//세션에서 id 얻기
	String id=(String)session.getAttribute("myid");
	//dao 선언	
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	String name=dao.getName(id);
	
	//System.out.println(name);
%>
<body>
<b><%=name%> 님</b>
<div class="cart">
<%
	//ShopDao 선언
	//ShopDao sdao=new ShopDao();
	//카트갯수 얻어오기
	//int cartSize=sdao.getCartList(id).size();
%>
	<span class="carticon glyphicon glyphicon-shopping-cart"></span>
	<%-- <div class="count"><%=cartSize%></div> --%>
</div>
<br><br>
<%-- <h3><b><%=name%>님</b></h3><br> --%>
<button type="button" class="btn btn-success"
onclick="location.href='login/logoutaction.jsp'"
style="margin-left: 30px;width: 100px;">로그아웃</button>
<!-- <script type="text/javascript">
	$("span.carticon").click(function(){
		location.href="index.jsp?main=shop/mycart.jsp";
	});
</script> -->
</body>
</html>