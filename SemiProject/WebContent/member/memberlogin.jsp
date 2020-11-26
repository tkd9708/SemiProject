<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	});
</script>
</head>
<body>
<div class="regWrap">
	<form action="member/insertaction.jsp" method="post"
		class="regForm" name="memberform" id="myfrm">
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
							class="inputText vPlaceholder">
							<b class="idcheck"></b>
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<div class="formHolder password">
							<input type="text" title="비밀번호"
							placeholder="비밀번호를 입력해 주세요."
							class="inputText vPlaceholder">
						</div>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<div class="formHolder name">
							<input type="text" title="이름"
							placeholder="이름을 입력해 주세요."
							class="inputText vPlaceholder">
						</div>
					</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>
						<div class="formHolder hp">
							<input type="text" title="핸드폰"
							placeholder="핸드폰을 입력해 주세요."
							class="inputText vPlaceholder">
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
							required="required">
							<button type="button" class="btn">
								주소검색
							</button>
							<br><br><br>
							<input type="text" title="주소2"
							placeholder="주소를 입력해 주세요."
							class="inputText vPlaceholder">
						</div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<div class="formHolder">
							<input type="text" placeholder="이메일 주소를 입력해 주세요. (예, ddoddot@naver.com)"
							class="inputText vPlaceholder">
						</div>
					</td>
				</tr>
				<tr>
					<td class="regMemberBtn">
						<button type="submit" class="btn big pink">
						회원가입</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>