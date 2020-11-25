<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var si = "서귀포시";
	$.ajax({
		type:"get",
		dataType:"html",
		url:"http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=1",
		success:function(data){
			var s ="<h1>관광지 상세</h1><br>"
			
			$.each(JSON.parse(data).items,function(i,item){
			var ss=item.region1cd.label;
			if(ss == si){
			s+="<b>"+ss+ " : "
			s += "<b>"+item.title+"</b><br>";
			s+="<img style='width:100px'src="+item.repPhoto.photoid.thumbnailpath+"><br>"
			}
			});
			$("#out").html(s);
		}
		
		
	});
});

</script>

<body>
<div id = "out">

</div>
</body>
</html>