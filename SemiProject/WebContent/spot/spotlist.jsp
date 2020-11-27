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
%>
<style type="text/css">
	#areaTitle {
		margin-left: 20px;
		margin-bottom: 50px;
	}
	
	div.spotList {
		margin-left: 150px;
		margin-right: 150px;
		
	}
	div.gotodetail{
		cursor:pointer;
		float: left;
		width: 300px;
		height: 400px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$.ajax({
		    type:"get",
		    dataType:"html",
		    url:"http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=3vvg2yzxxd2edm7h&locale=kr&category=c1&page=13",
		    success:function(data){
		    	var area = "<%=area%>";
		        var s ="<h2 id='areaTitle'>" + area + "의 명소</h2>";

    			s += "<div class='spotList'>";
		        $.each(JSON.parse(data).items, function(i,item){
		        	
		        	var addr = item.region2cd.label;
		        	if(addr != null){
		        		if(addr.indexOf(area) != -1){
		        			s += "<div class ='gotodetail' contentsid="+item.contentsid+">"
		        			if(item.repPhoto != null){
						       	 s += "<img style='width: 280px; height: 230px;' src = " + item.repPhoto.photoid.thumbnailpath + "><br>";
		        			} 
				        	else {
					       		 s += "<div style='width: 230px; height: 230px; float: left; text-align: center;'>썸네일 없음</div>";
					       	 }
<<<<<<< HEAD

		        			//s += "<div style='width: 230px; margin-top: 20px;'><b>" + item.title + "</b>";
		        			//s+="<b>"+addr+"</b>"

<<<<<<< HEAD
=======
		        			s += "<div style='width: 230px; margin-top: 20px;'><b>" + item.title + "</b>";
		        			s+="<b>"+addr+"</b>"
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
		        			s+="</div>" 
		        			s += "<div style='width: 230px; margin-top: 20px;'><b style='font-size: 13pt;'>" + item.title + "</b><br>";
=======
		        			//s+="</div>" 
		        			s += "<div style='width: 230px; margin-top: 20px;'><b style='font-size: 13pt;'>" + item.title + "</b></div><br>";
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
		        			s += "<div style='color: #aaa; margin: 5px;'>" + item.introduction + "</div>";
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/tkd9708/SemiProject.git
		        			
					        s += "</div>";
		        		}
		        		
		        	}
		        	
		        });
		        
				s += "</div>";
				$("#out").html(s);
			}
		});
		
		//사진클릭하면 디테일로 값보내기
		$(document).on("click","div.gotodetail",function(){
			var contentsid=$(this).attr("contentsid"); 
			location.href="index.jsp?main=spot/spotdetail.jsp?contentsid="+contentsid;
		})
		
	}); //function 끝
</script>
</head>
<body>
	<div id="out">
	
	</div>
</body>
</html>
