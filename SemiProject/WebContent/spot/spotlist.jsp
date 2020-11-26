<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	String area = request.getParameter("area");
	String url = request.getContextPath();
%>
<style type="text/css">
	#areaTitle {
		margin-left: 20px;
		margin-bottom: 50px;
	}
	
	div.spotList {
		float: left;
		padding: 40px;
		width: 300px;
		height: 400px;
		
	}
	div.gotodetail{
		cursor:pointer;
	}
	#spotlist_banner{
		position: absolute;
		border: 4px solid black;
		top: 120px;
		width: 150px;
		height: 300px;
		right: 0%;
	}
</style>
<!-- 배너에 사용함 -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
		    type:"get",
		    dataType:"html",
		    url:"http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=13",
		    success:function(data){
		    	var area = "<%=area.substring(0, area.length()-1)%>";
		        var s = "<h2 id='areaTitle'><%=area%>의 명소</h2>";
		        
		        $.each(JSON.parse(data).items, function(i,item){
		        
		        	var addr = item.region2cd.label;
		        	
		        	if(addr != null){
		        		if(addr.indexOf(area) != -1){
		        			s += "<div class='spotList'>";
		        			
		        			if(item.repPhoto != null){
		        				s += "<div class ='gotodetail' contentsid="+item.contentsid+">"		
						       	 s += "<img style='width: 230px; height: 230px;' src = " + item.repPhoto.photoid.thumbnailpath + "><br>";
					       		s+="</div>" 
		        			} 
				        	else {
					       		 s += "<div style='width: 230px; height: 230px; float: left; text-align: center;'>썸네일 없음</div>";
					       	 }
		        			s += "<div style='width: 230px; margin-top: 20px;'><b>" + item.title + "</b><br>";
		   
		        			
					        s += "</div></div>";
		        		}
		        		
		        	}

		        	
		        });
		        
				
				$("#out").html(s);
			}
		});
		
		//사진클릭하면 디테일로 값보내기
		$(document).on("click","div.gotodetail",function(){
			var contentsid=$(this).attr("contentsid"); 
			location.href="index.jsp?main=spot/spotdetail.jsp?contentsid="+contentsid;
		});
		
		//다른 지역메뉴로 가는 배너
		$(window).scroll(function(){
			var position = $(window).scrollTop()+35;
			$("#spotlist_banner").stop().animate({top:position+"px"},800);
		});
		

		
		
		
		
	}); //function 끝
</script>
</head>
<body>
	<div id="out">
	</div>
	
		<div id="spotlist_banner">
			<table>
			<tr><td>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">제주시</a><br>
			
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">조천읍</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">구좌읍</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">성산읍</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">표선면</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">남원읍</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">서귀포시</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">안덕면</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">대청읍</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">한경면</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">한림읍</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">애월읍</a><br>
			<a href="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주시'">우도</a><br>
			</table>
		</div>
</body>
</html>