<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/updateform.css">
<title>Insert title here</title>
<%
	//num 읽기
	String num=request.getParameter("num");

	//db로부터 getData 호출후 폼안에 값 넣어주기
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getDataByNum(num);
%>
<script type="text/javascript">
	$(function(){
		//주소검색파일 오픈
		$(".postSearch").click(function() {
			window.open("member/postsearch.jsp","","left=100px,top=100px,width=500px,height=600px");
		});
	});
</script>
</head>
<body>
	<form action="member/updateaction.jsp" method="post"
		class="frmUpdate" name="memberform" id="myfrm">
		
		<div class="updateWrite">
			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  				<path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
			</svg>
			<h3>회원정보수정</h3>
			<div class="gridContainer">
				<div class="item">
					<!-- hidden -->
					<input type="hidden" name="num" value="<%=dto.getNum()%>">
					<input type="hidden" name="id" value="<%=dto.getId()%>">
					<b>아이디 : </b>
					<b><%=dto.getId()%></b><br>
				</div>
				<div class="item">
				<b>이 름 : </b>
					<input type="text" name="name" class="txtName"
					required="required" value="<%=dto.getName()%>"><br>
				</div>
				<div class="item">
					<b>핸드폰 : </b>
					<input type="text" name="hp" id="hp" 
					class="txtHp"
					required="required" 
					value="<%=dto.getHp()%>"><br>
				</div>
				<div class="item">			
					<b>주소 : </b>
					<input type="text" name="address"
					class="txtAddress"
					<%-- readonly="readonly" --%>
					required="required" value="<%=dto.getAddress()%>"><br>
					<button type="button" class="postSearch" id="btnpost">주소검색</button>
					<br>
					<input type="text" name="addrdetail"
					class="txtAddrdetail" value="<%=dto.getAddrdetail()%>" required="required"><br>
				</div>
				<div class="item">
					<b>이메일 : </b>
					<input type="text" name="email" id="email"
					class="txtEmail" required="required" value="<%=dto.getEmail()%>" 
					autocomplete="email"><br>
				</div>
				<div class="item">
					<b>비밀번호확인 : </b>
					<input type="password" name="pass" class="txtPass"
					<%-- pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
		 	 		title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" --%>
		  			required="required" autocomplete="new-password"><br>
	  			</div>
	  			<div class="item">
					<button type="submit" class="btnMemUpdate">
					회원정보수정</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>