<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

 
<style>
	th,td{
		padding: 6px;
	
		
	
	}
	.usersubmit{
		position: relative;
		left: 100px;
		margin-top:50px;
		width: 100px;
		height: 50px;
		border-color: #f8c990;
		background: #ff9933;
		color: white;
	}
	.btn_cancel{
		position: relative;
		left: 150px;
		margin-top:50px;
		width: 100px;
		height: 50px;
		border-color: #e5e5e5;
		background: white;
		
	}
	.on{
		color: #ffcc00;
		
	}
	.userstar{
		cursor: pointer;
		
	}


</style>
</head>
<script type="text/javascript">
$(function(){
    $('a[href="#ex7"]').click(function(event) {
      event.preventDefault();
 
      $(this).modal({
        fadeDuration: 350
      });
    });
    
    $(".userstar" ).click(function(){
		$(this).removeClass('on');
		$(this).addClass('on').prevAll('userstar').addClass('on');
		return false;
	});

});

</script>
<body>
<div id="ex7" class="modal" style="max-width:100%;width: auto;">
	
	<fieldset style="width: 800px;">
	<legend>공유하기</legend>
	<form action="notice/shareboardaction.jsp" method="post" 
	enctype="multipart/form-data">
	<table class="sharewrite table table-striped">
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
				☆☆☆☆☆</div></td>
			</tr>	
		</tbody>
			
	
	</table>	
	</form>
</fieldset>

<div class="btnbox">
		<button type="submit" class="usersubmit">등록</button>
		<button type="button" class="btn_cancel" onclick=>취소</button>	
	</div>
</div>	
<button type="button" onclick="location.href='shareboardform.jsp'">공유하기</button>
<p><a class="btn" href="#ex7">도달창띄우기2</a></p>
 
</body>
</html>





