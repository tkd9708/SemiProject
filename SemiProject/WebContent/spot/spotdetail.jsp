<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SpotReviewDao"%>
<%@page import="data.dto.SpotReviewDto"%>
<%@page import="data.dao.SpotlistDao"%>
<%@page import="data.dto.SpotlistDto"%>
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
<style type="text/css">
	.thumbnail {
		width: 500px;
		height: 500px;
		margin-left: 200px;
		margin-top: 80px;
		display: inline-block;
	
	}
	
	div.thumbnailDetail {
		display: inline-block;
		margin-left: 100px;
		width: 520px;
		height: 500px;
		vertical-align: bottom;
	}
	
	div#spotReview {
		margin-left: 200px;
		margin-right: 200px;
		height: 1000px;
	}
	
	span.star {
		font-size: 20pt; 
		color: #F0CD58;
		cursor: pointer;
	}
	
</style>
<%
	String contentsid = request.getParameter("contentsid");
	SpotlistDao dao = new SpotlistDao();
	SpotlistDto dto = dao.getData(contentsid);
	
	SpotReviewDao rdao = new SpotReviewDao();
	List<SpotReviewDto> list = rdao.getList(contentsid);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<script type="text/javascript">
	$(function(){
		
		$("#srstarBox span").on("click",function(){
			var idx = $(this).index()+1;
			$(".star").removeClass("glyphicon glyphicon-star-empty");
			
			for(var i=0; i<=idx; i++){
			   	$(".star").eq(i).addClass("glyphicon glyphicon-star");
			}
			for(var i=idx; i<=5; i++){
			   	$(".star").eq(i).addClass("glyphicon glyphicon-star-empty");
			}
			$("#spotReviewStar").val(idx);	
		});
		
		$("#btnInsertReview").click(function(){
			$.ajax({
				type: "post",
				dataType: "html",
				data: {"contentsid":"<%=contentsid%>", "memNum":$("#srMemNum").val(), "star":$("#spotReviewStar").val(),
						"content":$("#srContent").val()},
				url: "spot/insertspotreview.jsp",
				success: function(data){
					location.reload();
				}
			});
		});
		
	});
</script>
<body>
	<%
	if(dto.getThumbnail() != null){
		%>
		<img class="thumbnail" src="<%=dto.getThumbnail()%>">
		<%
	}
	else {
		%>
		<div class="thumbnail">썸네일 없음</div>
		<%
	}
	%>
	<div class="thumbnailDetail">
		<b style="font-size: 20pt;"><%=dto.getTitle() %></b>
		<span style="color: red; float: right; font-size: 30pt;" class="glyphicon glyphicon-heart-empty"></span>
		<br><br>
		<span style="color: #ccc; font-size: 13px;">&nbsp;&nbsp;&nbsp;<%=dto.getTag() %></span><br>
		<hr>
		<b style="color: gray;"><%=dto.getIntroduction() %></b>
		<br><br>
		<span style="color: #F0CD58; font-size: 18px;">
			<%
        		for(int i=1; i<=5; i++){
        			if(i<=dto.getStar()){
        				%>★<%
        			}
        			else {
        				%>☆<%
        			}
        		}
        	%>
		</span><br><br>
		<span class="glyphicon glyphicon-map-marker" style="margin-right: 10px;"></span>
		<%=dto.getRoadaddr() %>
		<br>
	</div>
	<hr>
	<br><br>
	<div id="spotReview">
		<h2>Review</h2>
		<form id="newSpotReview" action="spot/insertspotreview.jsp">
			<br>
			<b>작성자 : 로그인한 ID</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="hidden" name="memNum" id="srMemNum" value="0">
			<div id="srstarBox" style="display: inline-block;">
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
			</div>
			<input type="hidden" name="star" id="spotReviewStar" value="0">
			<br><br>
			<textarea name="content" id="srContent" style="width: 500px; height: 100px; float: left;" class="form-control"></textarea>
			<button type="button" id="btnInsertReview" style="height: 100px; width: 80px; margin-left: 10px;">작성</button>
		</form>
		<br><br><br>
		
		<div id="spotReviewList">
			<table class="table">
				<tr style="text-align: center; vertical-align: middle" bgcolor="#efefef">
					<td width="15%"><b>작성자</b></td>
					<td width="50%"><b>review</b></td>
					<td width="15%"><b>별점</b></td>
					<td width="20%"><b>작성일</b></td>
				</tr>
				<%
				if(rdao.getTotalCount(contentsid) == 0){
					%>
					<tr style="text-align: center;"><td colspan="4">등록된 review가 없습니다.</td></tr>
					<%
				}
				else{
					int total = 0;
					for(SpotReviewDto rdto : list){
					
						total += rdto.getStar();
					%>
						<tr>
							<td style="text-align: center; vertical-align: middle">
								<b><%=rdto.getMemNum() %></b><br>
							</td>
							<td style=" vertical-align: middle">
							<%=rdto.getContent().replace("\n", "<br>") %>
							</td>
							<td style="text-align: center; vertical-align: middle">
								<span style="color: #F0CD58; font-size: 18px;">
									<%
	        						for(int i=1; i<=5; i++){
	        							if(i<=rdto.getStar()){
	        								%>★<%
	        							}
	        							else {
	        								%>☆<%
	        							}
	        						}
	        						%>
								</span>
							</td>
							<td style="text-align: center; vertical-align: middle">
								<%=sdf.format(rdto.getWriteday())%>
							</td>
						</tr>
					<%
					}
					if(total > 0){
						dao.updateStar(contentsid, total/rdao.getTotalCount(contentsid));
					}
				
				}
				%>
			
			</table>
		</div>
		
	</div>
</body>
</html>