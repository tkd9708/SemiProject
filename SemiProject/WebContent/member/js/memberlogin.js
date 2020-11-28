/**
 * 
 */

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
