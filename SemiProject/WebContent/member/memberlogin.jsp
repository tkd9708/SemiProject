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
<link rel="stylesheet" type="text/css" href="<%=url%>/member/memberlogin.css">
<meta charset="UTF-8">
<title>맨도롱 또똣 :: 제주한달살기</title>
<script type="text/javascript">
	$(function(){
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
			
			$.ajax({
				type: "get",
				url:"member/emailcheckxml.jsp",
				dataType:"xml",
				data:{"email":email},
				success:function(data){
					//alert($(data).text());
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
		});
		
	});//function close
	
	function formChk(){
		try{
			var pass1V=document.getElementById("pass").value;
			var pass2V=document.getElementById("cfpass").value;
			
			var pass2=document.getElementById("cfpass");
			
			if (pass1V != pass2V) {
				var passChk = document.getElementById("passChk");
				passChk.innerHTML="비밀번호가 맞지 않습니다";
				pass2.focus();
				return false;
			}			
		}catch(e){
			console.log(e);
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
<div class="regWrap">
	<form action="member/insertaction.jsp" method="post"
		class="regForm" name="memberform" id="myfrm"
		onsubmit="return formChk(this);">
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
							placeholder="영문, 숫자, 특수문자 조합하여 8자이상"
							class="inputText vPlaceholder"
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
							class="inputText vPlaceholder"
							autocomplete="new-password"
							spellcheck="false" required="required"
							name="cfpass" id="cfpass">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
  								<path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg>
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
							<button type="button" class="btn">
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
					<th>이메일</th>
					<td>
						<div class="formHolder email">
							<input type="text" placeholder="이메일 주소 입력 (예, ddoddot@naver.com)"
							class="inputText vPlaceholder"
							required="required" name="email" id="email">
							<b class="emailChk"></b>
						</div>
					</td>
				</tr>
				<tr>
					<td class="regMemberBtn">
						<button type="submit" class="btnbigpink">
						회원가입</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>