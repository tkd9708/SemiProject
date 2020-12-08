<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/reallogin.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/bootstrap.min.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/member/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/member/js/popper.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/member/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	//로그인버튼이 td태그이므로 이벤트를 따로 준다
	$("div.loginBtn").click(function(){
		//로그인이 submit 버튼이 아니라서 자동입력체크를 못한다
		//코드로 입력체크 추가
		if($("#myid").val().length==0){
			alert("아이디를 입력해주세요");
			return;
		}
		if($("#mypass").val().length==0){
			alert("비밀번호를 입력해주세요");
			return;
		}
		$("#frm").submit();
	});
});
</script>
</head>
<%
	//session 에 saveid 가 있을경우(아이디저장체크한경우)
	//세션에서 myid를 얻는다
	String saveid=(String)session.getAttribute("saveid");
	String id="";
	if(saveid!=null){
		id=(String)session.getAttribute("idforsavebtn");
	}
%>
<body>
	<div class="loginform">
		<form action="member/loginaction.jsp" method="post" id="frm"
		name="frm" class="loginfrm" autocomplete="off">
			<h1 class="h1Login">로그인</h1>
			<div class="txtGroup">
				<div class="divId">
					<input type="text" maxlength="100" id="myid"
					name="id" placeholder="아이디" tabindex="1"
					class="clsId" value="<%=id%>">
				</div>
				<div class="divPass">
					<input type="password" maxlength="1000"
					id="mypass" placeholder="비밀번호"
					name="pass" tabindex="2" class="clsPass"
					autocomplete="new-password">
				</div>
			</div>
			<div class="keepLogin">
				<div class="saveId">
					<div class="custom-control custom-switch">
						<input type="checkbox" name="saveid"
						<%=saveid==null?"":"checked"%>
						tabindex="3" 
						class="chkBox custom-control-input"
						id="customSwitch1">
						<label class="custom-control-label"
						for="customSwitch1">
						아이디저장
						</label>
					</div>
				</div>
			</div>
			<div class="btnarea">
				<div class="loginBtn">
					<span class="btnTxt">
						로그인
					</span>
				</div>
				<div class="regGo">
					<span class="btnTxt">
					<a href="index.jsp?main=member/memberlogin.jsp"
					class="aregGo">
					회원가입</a>
					</span>
				</div>
			</div>	
		</form>
	</div>
</body>
</html>
