<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<style type="text/css">
	th,td{
		padding: 6px;
	
	}
	.usersubmit{
		position: relative;
		left: 150px;
		margin-top:50px;
		width: 100px;
		height: 50px;
		border-color: #f8c990;
		background: #ff9933;
		color: white;
	}
	.btn_cancel{
		position: relative;
		left: 200px;
		margin-top:50px;
		width: 100px;
		height: 50px;
		border-color: #e5e5e5;
		background: white;
		
	}
	.on{
		color: #ffcc00;
		
		
		
		
		
		
		
	}
	i{
		cursor: pointer;
		
	}
	
	

</style>
</head>
<script type="text/javascript">
$(function(){
	$(".userstar i" ).click(function(){
		$(this).parent().children('i').removeClass('on');
		$(this).addClass('on').prevAll('i').addClass('on');
		return false;
	});
});

</script>
<body>
<div id="ex7" class="modal">
<fieldset style="width: 800px;">
	<legend style="text-align: center;">공유하기</legend>
	<form action="notice/shareboardaction.jsp" method="post" 
	enctype="multipart/form-data">
	<table class="sharewrite">
		<tbody class="usershare">
			<tr>
				<th><span>맛집이름</span></th>
				<td><input type="text" name="name" required="required"
					placeholder="맛집이름을 적어주세요" style="width: 320px;height: 20px;">
			</tr>
			<tr>
				<th><span>맛집주소</span></th>
				<td><input type="text" name="addr" required="required"
					style="width:320px;height: 20px;"></td>
			</tr>
			<tr>
				<th><span>맛집사진</span></th>
				<td><input type="file" name="photo" style="width: 320px;"></td>
			</tr>
			<tr>
				<th><span>의견</span></th>
				<td><textarea rows="4" cols="50" maxlength="1500" name="comment"></textarea></td>
			</tr>
			<tr>
				<th><span>평가</span></th>
				<td><div class="userstar">
				<i class="star1 far fa-star"></i><i class="star2 far fa-star"></i><i class="star3 far fa-star"></i><i class="star4 far fa-star"></i><i class="star5 far fa-star"></i>
				</div></td>
			</tr>	
		</tbody>
			
	
	</table>	
	</form>
</fieldset>	
</div>
<div class="btnbox">
		<button type="submit" class="usersubmit">등록</button>
		<button type="button" class="btn_cancel" onclick=>취소</button>	
	</div>
	
</body>
</html>