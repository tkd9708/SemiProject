<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../image/favicon.ico">
<%
String url=request.getContextPath();
/* System.out.println(url); */
%>
<link rel="stylesheet" type="text/css" href="<%=url%>/member/css/memberlogin.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/member/js/memberlogin.js"></script>
<meta charset="UTF-8">
<title>맨도롱 또똣 :: 제주한달살기</title>
</head>
<body>
<div class="regWrap">
	<form action="member/insertaction.jsp" method="post"
		class="regForm" name="memberform" id="myRegfrm">
		<table class="tType">
			<caption><h3>회원 가입</h3></caption>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<div class="formHolder id">
							<input type="text" title="아이디" name="id" id="id" 
							autofocus="autofocus" required="required"
							placeholder="아이디를 입력해 주세요."
							class="inputText vPlaceholder" autocomplete="username">
							<b class="idcheck"></b>
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<div class="formHolder password">
							<input type="password" title="비밀번호"
							placeholder="영문숫자기호 합해 8자이상"
							class="pwText vPlaceholder"
							autocomplete="new-password" spellcheck="false"
							id="pass" name="pass" required="required">
							<span class="passChk" id="passChk"></span>
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<div class="formHolder cfpassword">
							<input type="password" title="비번확인"
							placeholder="비밀번호 한번 더 입력"
							class="cfpwText vPlaceholder"
							autocomplete="new-password"
							spellcheck="false" required="required"
							name="cfpass" id="cfpass">
							<span class="putBieye" id="putBieye">
							<svg width="1em" height="1em" 
							viewBox="0 0 16 16" class="bi bi-eye" 
							fill="currentColor" 
							xmlns="http://www.w3.org/2000/svg"
							id="bieye">
  								<path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
  								<path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
							<svg width="1em" height="1em" 
							viewBox="0 0 16 16" 
							class="bi bi-eye-slash" 
							fill="currentColor" 
							xmlns="http://www.w3.org/2000/svg"
							id="bieyeslash">
							  <path d="M13.359 11.238C15.06 9.72 16 8 16 8s-3-5.5-8-5.5a7.028 7.028 0 0 0-2.79.588l.77.771A5.944 5.944 0 0 1 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.134 13.134 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755-.165.165-.337.328-.517.486l.708.709z"/>
							  <path d="M11.297 9.176a3.5 3.5 0 0 0-4.474-4.474l.823.823a2.5 2.5 0 0 1 2.829 2.829l.822.822zm-2.943 1.299l.822.822a3.5 3.5 0 0 1-4.474-4.474l.823.823a2.5 2.5 0 0 0 2.829 2.829z"/>
							  <path d="M3.35 5.47c-.18.16-.353.322-.518.487A13.134 13.134 0 0 0 1.172 8l.195.288c.335.48.83 1.12 1.465 1.755C4.121 11.332 5.881 12.5 8 12.5c.716 0 1.39-.133 2.02-.36l.77.772A7.029 7.029 0 0 1 8 13.5C3 13.5 0 8 0 8s.939-1.721 2.641-3.238l.708.709z"/>
							  <path fill-rule="evenodd" d="M13.646 14.354l-12-12 .708-.708 12 12-.708.708z"/>
							</svg>
								<div class="toolTip">
									<p id="pS">비밀번호 보이기</p>
									<p id="pH">비밀번호 안보기</p>
								</div>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<div class="formHolder name">
							<input type="text" title="이름"
							placeholder="이름을 입력해 주세요."
							class="inputText vPlaceholder" required="required" name="name">
						</div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<div class="formHolder email">
							<input type="text" placeholder="이메일입력(a@naver.com)"
							class="inputText vPlaceholder"
							required="required" name="email" id="email">
							<b class="emailChk"></b>
						</div>
					</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>
						<div class="formHolder hp">
							<input type="text" title="핸드폰"
							placeholder="핸드폰을 입력해 주세요."
							class="inputText vPlaceholder" name="hp">
						</div>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<div class="formHolder address">
							<input type="text" title="주소1"
							class="inputText vPlaceholder"
							readonly="readonly"
							required="required" name="address">
							<button type="button" class="SearchPost" id="SearchPost">
								주소검색
							</button>
							<br><br><br>
							<input type="text" title="주소2"
							placeholder="상세주소를 입력해 주세요."
							class="inputText vPlaceholder" name="addrdetail">
						</div>
					</td>
				</tr>
				<tr>
					<td class="regMemberBtn">
						<button type="button" class="btnbigpink"
						id="btnSubmit">
						회원가입</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<script type="text/javascript">
window.onload=function() {
	var shPw = document.getElementById("bieye");
	var hidePw = document.getElementById("bieyeslash");
	var pass1 = document.getElementById("pass");
	var pass2 = document.getElementById("cfpass");
	var spanImg = document.getElementById("putBieye");
	var pS = document.getElementById("pS");
	var pH = document.getElementById("pH");
	/*console.log(shPw+hidePw+pass1+pass2+spanImg+pS+pH);*/
	pH.style.display= "none";
	
	hidePw.style.display = "none";
	
	//shPw 객체에 onclick 이벤트 속성을 연결
	spanImg.onclick = function() {
	
		pass1.getAttribute("type")=="password"?pass1.setAttribute("type", "text"):pass1.setAttribute("type", "password");
		pass2.getAttribute("type")=="password"?pass2.setAttribute("type", "text"):pass2.setAttribute("type", "password");
			
		/* console.log(this.getAttribute("id")); */
	
		if(hidePw.style.display == "none"){
		 	hidePw.style.display="inline-block";
		 	shPw.style.display="none";
		 	pS.style.display="none";
		 	pH.style.display="block";
		}
		else{
			hidePw.style.display="none";
			shPw.style.display="inline-block";
		 	pS.style.display="block";
		 	pH.style.display="none";
		}
	};	
	
	//아이디 입력시 메세지 지우기
	$("#id").keydown(function(){
		$("b.idcheck").html("");
	});
	
	//아이디 입력후 포커스가 벗어날때 아이디 체크하기
	$("#id").blur(function(){
		var id=$(this).val();//앞뒤공백제거
		if(id.trim().length==0){
			//alert("공백제거");
			$(this).val('');
			return;
		}
		$.ajax({
			type: "get",
			url:"member/idcheckxml.jsp",
			dataType:"xml",
			data:{"id":id},
			success:function(data){
				//alert($(data).text());
				if($(data).text()=='yes'){
					$("b.idcheck").html("이미 등록된 아이디입니다");
					$("b.idcheck").css({
						"color":"red",
						"font-size":"14px"
					});
					$("#id").val("");
				}
				else{
					$("b.idcheck").html("사용가능한 아이디입니다");
					$("b.idcheck").css({
						"color":"green",
						"font-size":"14px"
					});
				}
			}
		});
	});
	
	//이메일 입력시 메세지 지우기
	$("#email").keydown(function(){
		$("b.emailChk").html("");
	});
	
	//이메일 입력후 포커스가 벗어날때 이메일 체크하기
	$("#email").blur(function(){
		var email=$(this).val();
		if(email.length!=0){
			$.ajax({
				type: "get",
				url:"member/emailcheckxml.jsp",
				dataType:"xml",
				data:{"email":email},
				success:function(data){
					/*alert($(data).text());*/
					if($(data).text()=='yes'){
						$("b.emailChk").html("이미 등록된 이메일입니다");
						$("b.emailChk").css({
							"color":"red",
							"font-size":"14px"
						});
						$("#email").val("");
					}
					else{
						$("b.emailChk").html("사용가능한 이메일입니다");
						$("b.emailChk").css({
							"color":"green",
							"font-size":"14px"
						});
					}
				}
			});
		}
	});
	
	//비밀번호 입력시 메세지 지우기
	$("#cfpass").keydown(function(){
		$(".passChk").html("");
	});
	
	$("#btnSubmit").click(function(e) {
		//submit 버튼이 아니라서 자동입력체크를 못한다
		//코드로 입력체크 추가
		var pass1V=$(".pwText").val();
		var pass2V=$(".cfpwText").val();
		alert(pass1V+"VS"+pass2V);
		
		var rtn = false;
		
		$.ajax({
			type: "post",
			url: "member/chkvalid.jsp",
			dataType: "xml",
			data: {"pass1V":pass1V,"pass1":pass1V,"pass2":pass2V},
			async: false,
			success: function(data){
				if($(data).find("validpw").text()=="no"){
					$("span.passChk").html("8자이상의 영문/숫자/특수문자 조합으로 입력하세요.");
					$("span.passChk").css({
						"color":"orange",
						"font-size":"12px",
						"letter-spacing":"-1px"
					});
					$("#pass").val("");
					$("#pass").focus();
				}
				else if($(data).find("samepw").text()=="no"){
					/* alert($(data).find("samepw").text()); */
					$(".passChk").html("비밀번호가 같지 않습니다");
					$(".passChk").css({
						"color":"#ff5500",
						"font-size":"12px",
						"letter-spacing":"-1px"
					});
					$("#cfpass").val("");
					$("#cfpass").focus();
				}
				else{
					$("#myRegfrm").submit();
				}
			}
		});
		
		return rtn;
	});
	
	$(".SearchPost").click(function() {
		window.open("member/postsearch.jsp","","left=100px,top=100px,width=500px,height=600px");
	});
}//window onload function close
</script>
</body>
</html>