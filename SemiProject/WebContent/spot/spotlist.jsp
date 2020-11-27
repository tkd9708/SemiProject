<%@page import="data.dto.SpotlistDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SpotlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#areaTitle {
		margin-left: 20px;
		margin-bottom: 50px;
	}
	
	div#spotList {
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
<%
	request.setCharacterEncoding("utf-8");
	String area = request.getParameter("area");
	SpotlistDao dao = new SpotlistDao();
	List<SpotlistDto> list = dao.getList(area);
%>
<script type="text/javascript">
	$(function(){
		
		//사진클릭하면 디테일로 값보내기
		$(document).on("click","div.gotodetail",function(){
			var contentsid=$(this).attr("contentsid"); 
			location.href="index.jsp?main=spot/spotdetail.jsp?contentsid="+contentsid;
		})
		
	}); //function 끝
</script>
</head>
<body>
	<div id="spotList">
		<h2><%=area %>의 명소 </h2>
		<%
        for (SpotlistDto dto : list){
        	%>
        	<div class ="gotodetail" contentsid="<%=dto.getContentsid()%>">
        		<%
        		if(dto.getThumbnail() == null){
        		%>
        			<div style="width: 350px; height: 250px; float: left; text-align: center;">썸네일 없음</div>
        		<%
        		}
        		else {
        		%>
        			<img style="width: 350px; height: 250px;" src = "<%=dto.getThumbnail()%>"><br>
        		<%
        		}
        		%>
        		<div style="width: 350px; margin-top: 20px;">
        			<b style="font-size: 13pt;"><%=dto.getTitle() %></b>
        		</div>
        		<br>
        		<div style="color: #F0CD58; font-size: 18px;">
        			★★★★★
        		</div>
        		<br>
        		<div style="color: #aaa;">
					<%=dto.getLabel1() %> > <%=dto.getLabel2() %>
				</div>
        		<div style="margin-top: 20px; color:#ff7f00">
        		<b>
        		<%
        		String[] tags = dto.getTag().split(",");
        		for(int i=0; i<tags.length; i++){
        			%>
        			#<%=tags[i] %>&nbsp;&nbsp;
        			<%	
        			if((i+1)%4 == 0){
        				%><br><%
        			}
        			
        		}
        		%>
        		</b>
        		</div>
        	</div>
        	<%
        }
        %>
        	
	</div>
</body>
</html>