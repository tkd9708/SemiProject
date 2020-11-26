<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
		    type:"get",
		    dataType:"html",
		    url:"http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=1",
		    success:function(data){
		       var s ="<h1>관광지 상세</h1>";
		       s += "<table><tr>";
		       s += "<th style='width: 50px;'>관광지</th>";
		       s += "<th style='width: 80px;'>지역</th>";
		       s += "<th style='width: 200px;'>주소</th>";
		       s += "<th style='width: 100px;'>태그</th>";
		       s += "<th style='width: 200px;'>설명</th>";
		       s += "<th style='width: 100px;'>위도, 경도</th>";
		       s += "<th style='width: 100px;'>썸네일 이미지</th>";
		       s += "</tr>";
		       
		       $.each(JSON.parse(data).items, function(i,item){
		      
		      	 s += "<tr>";
		      	 s += "<td>" + item.title + "</td>";
		       	 s += "<td>" + item.region1cd.label + "</td>";
		       	 s += "<td>" + item.address + "</td>";
		       	 s += "<td>" + item.alltag + "</td>";
		       	 s += "<td>" + item.introduction + "</td>";
		       	 s += "<td>위도 : " + item.latitude + "<br>경도 : " + item.longitude + "</td>";
		       	 if(item.repPhoto != null){

			       	 s += "<td><img style='width:100px'src=" + item.repPhoto.photoid.thumbnailpath + "></td>";
		       	 } else {
		       		 s += "<td></td>";
		       	 }
		       	 s += "</tr>";
		       
		       });
		       s += "</table>";
				
				$("#out").html(s);
			}
		});
	});
</script>
<%
	String area = request.getParameter("area");
%>
<body>
	<div id="out">
		<%=area %>
	</div>
</body>
</html>