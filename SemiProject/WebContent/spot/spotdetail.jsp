<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<<<<<<< HEAD
<<<<<<< HEAD
=======
<style type="text/css">
<!--확인용 주석 -->
	.thumbnail {
		width: 500px;
		height: 500px;
		margin-left: 100px;
		margin-top: 80px;
		display: inline-block;
	
	}
	
	div.thumbnailDetail {
		display: inline-block;
		margin-left: 80px;
		width: 520px;
		height: 500px;
		vertical-align: bottom;
	}
	
	div#spot_review {
		height: 1000px;
	}
</style>
<%
	String contentsid = request.getParameter("contentsid");
%>
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
<script type="text/javascript">
	$(function(){
		<%System.out.println(contentsid);%>
		
		$.ajax({
		    type:"get",
		    dataType:"html",
		    url:"http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=4",
		    success:function(data){
		  
		       var s ="";
		       
		       $.each(JSON.parse(data).items, function(i,item){
		    	    if("<%=contentsid%>" == item.contentsid){
		      	 		/* s += "<tr>";
		      	 		s += "<td>" + item.title + "</td>";
		       	 		s += "<td>" + item.region1cd.label + "</td>";
		       	 		s += "<td>" + item.address + "</td>";
		       	 		s += "<td>" + item.alltag + "</td>";
		       	 		s += "<td>" + item.introduction + "</td>";
		       	 		s += "<td>위도 : " + item.latitude + "<br>경도 : " + item.longitude + "</td>"; */
		       	 		if(item.repPhoto !== null){
			       			s += "<img class='thumbnail' src=" + item.repPhoto.photoid.imgpath + ">";
		       	 		} 
		       	 		else {
		       		 		s += "<div class='thumbnail'></div>";
		       	 		}
		       	 		
		       	 		s += "<div class='thumbnailDetail'>";
		       	 		s += "<b style='font-size: 20pt;'>" + item.title + "</b>";
		       	 		s += "<span style='color: red; float: right; font-size: 30pt;' class='glyphicon glyphicon-heart-empty'></span><br><br>";
		       	 		s += "<span style='color: #ccc; font-size: 13px;'> >&nbsp;&nbsp;&nbsp;" + item.alltag + "</span><br>";
		       	 		s += "<hr>";
		       	 		s += "<b style='color: gray;'>" + item.introduction + "</b><br><br>";
		       	 		s += "<span style='color: #F0CD58; font-size: 18px;'>★★★★★</span><br><br>";
		       	 		s += "<span class='glyphicon glyphicon-map-marker' style='margin-right: 10px;'></span>" + item.address + "<br>";
		       	 		
		       	 		s += "</div>";
		    	    }
		       	});
				
				$("#out").html(s);
<<<<<<< HEAD
			}
=======
<%
		String contentsid = request.getParameter("contentsid");
		%>
<script type="text/javascript">
	$(function(){
		<%System.out.println(contentsid);%>
		
		$.ajax({
		    type:"get",
		    dataType:"html",
		    url:"http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=13",
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
		    	   if("<%=contentsid%>" == item.contentsid){
		      	 s += "<tr>";
		      	 s += "<td>" + item.title + "</td>";
		       	 s += "<td>" + item.region1cd.label + "</td>";
		       	 s += "<td>" + item.address + "</td>";
		       	 s += "<td>" + item.alltag + "</td>";
		       	 s += "<td>" + item.introduction + "</td>";
		       	 s += "<td>위도 : " + item.latitude + "<br>경도 : " + item.longitude + "</td>";
		       	 if(item.repPhoto !== null){

			       	 s += "<td><img style='width:100px'src=" + item.repPhoto.photoid.thumbnailpath + "></td>";
		       	 } else {
		       		 s += "<td></td>";
		       	 }
		       	 s += "</tr>";
		    	   }
		       });
		       s += "</table>";
				
				$("#out").html(s);
=======
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
		    
		    }
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
		});
	});
</script>
<body>
	<div id="out">
	</div>
	<hr>
	<div id="spot_review"></div>
</body>
</html>