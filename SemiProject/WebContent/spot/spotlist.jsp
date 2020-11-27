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
		margin-top: 50px;
		margin-left: 150px;
		margin-right: 100px;
		
	}
	div.gotodetail{
		cursor:pointer;
		float: left;
		width: 350px;
		height: 550px;
		text-align: center;
		margin-bottom: 50px;
		margin-right: 70px;
		box-shadow: 2px 2px 2px 2px #ddd;
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

    			var s = "<div class='spotList'>";

		        s += "<h2 id='areaTitle'>" + area + "의 명소</h2>";
		        $.each(JSON.parse(data).items, function(i,item){
		        	
		        	var addr = item.region2cd.label;
		        	if(addr != null){
		        		if(addr.indexOf(area) != -1){
		        			s += "<div class ='gotodetail' contentsid="+item.contentsid+">"
		        			if(item.repPhoto != null){
						       	 s += "<img style='width: 350px; height: 250px;' src = " + item.repPhoto.photoid.thumbnailpath + "><br>";
		        			} 
				        	else {
					       		 s += "<div style='width: 350px; height: 250px; float: left; text-align: center;'>썸네일 없음</div>";
					       	 }

		        			s += "<div style='width: 350px; margin-top: 20px;'><b style='font-size: 13pt;'>" + item.title + "</b></div><br>";
		        			s += "<div style='color: #F0CD58; font-size: 18px;'>★★★★★</div><br>";
		        			s += "<div style='color: #aaa;'>" + item.region1cd.label + " > " + item.region2cd.label + "</div>";
							var tag = item.tag.split(",");
							
							s += "<div style='margin-top: 20px; color:#ff7f00'><b>";
							$.each(tag, function(i, ele){
								s += "#" + tag[i] + "&nbsp;&nbsp;";
								if ((i+1)%4 == 0)
									s += "<br>";
							});
							s += "</b></div>";
		        			
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