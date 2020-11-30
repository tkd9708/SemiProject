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
	
	div.detail {
		cursor:pointer;
		float: left;
		width: 330px;
		height: 540px;
		text-align: center;
		margin-bottom: 50px;
		margin-right: 70px;
		box-shadow: 2px 2px 2px 2px #ddd;
	}
	
	div#spotList {
		overflow: hidden;
		margin-left: 200px;
		margin-top: 200px;
	}
	
	div.footer {
    	text-align: center;
	}
	
	
</style>
<%
	request.setCharacterEncoding("utf-8");
	String area = request.getParameter("area");
	SpotlistDao dao = new SpotlistDao();
	//List<SpotlistDto> list = dao.getList(area);
	
	// 총 갯수 구하기
	int totalCount = dao.getTotalCount(area);
	int perPage = 9; // 한페이지당 보여질 글의 갯수
	int perBlock = 5; // 한블럭당 출력할 페이지의 갯수
	int totalPage; // 총 페이지의 갯수
	int startPage; // 각 블럭당 시작 페이지 번호
	int endPage; // 각 블럭당 끝페이지 번호
	int start; // 각 블럭당 불러올 글의 시작번호
	int end; // 각 블럭당 글의 끝번호
	int currentPage; // 현재 보여질 페이지 번호
		
	// 현재 페이지 번호 구하기
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null)
		currentPage = 1; // 페이지 번호가 없을경우 무조건 1페이지로 간다.
	else
		currentPage = Integer.parseInt(pageNum);
		
	// 총 페이지 구하기 
	// 나머지가 있을 경우에는 1페이지 더 추가 (예 : 총글수가 9이고 한페이지당 2개씩 볼 경우)
	totalPage = totalCount/perPage + (totalCount % perPage > 0 ? 1 : 0);
	
	// 시작페이지와 끝페이지 구하기
	// 예 : 한페이지당 3개만 볼 경우 현재 페이지가 2라면 startPage: 1, endPage: 3
	// 현재 페이지가 7이라면 startPage: 7, endPage: 9
	startPage = (currentPage - 1) / perBlock * perBlock + 1;
	endPage = startPage + perBlock - 1;
	// 마지막 블럭은 endPage를 totalPage로 해놔야 한다.
	if(endPage > totalPage)
		endPage = totalPage;
	
	// mysql은 첫 글이 0번이므로 +1 안해도됨 (오라클은 1번)
	start = (currentPage-1) * perPage;
		
	// 각 페이지에서 출력할 시작번호
	// 총 50개일경우 1페이지는 50, 2페이지는 40
	int no = totalCount-(currentPage - 1) * perPage;
	
	List<SpotlistDto> list = dao.getList(start, perPage, area);
%>
<script type="text/javascript">
	$(function(){
		
		//사진클릭하면 디테일로 값보내기
		$(document).on("click","div.gotodetail",function(){
			var contentsid=$(this).attr("contentsid"); 
			location.href="index.jsp?main=spot/spotdetail.jsp?contentsid="+contentsid;
		});
		
		// 좋아요 클릭
		$(document).on("click", ".likesTD", function(){
			var contentsid=$(this).attr("contentsid"); 
			$.ajax({
				type: "get",
				url: "spot/spotupdateLikes.jsp",
				dataType: "html",
				data: {"contentsid" : contentsid, "pageNum" : <%=currentPage%>, "area" : "<%=area%>"},
				success: function(data){
					location.reload();
				}
			});
		});
	}); //function 끝
</script>
</head>
<body>
	<div id="spotList">
		<h2><%=area %>의 명소 </h2>
		<%
        for (SpotlistDto dto : list){
        	%>
        	<div class="detail">
        	<div class ="gotodetail" contentsid="<%=dto.getContentsid()%>">
        		<%
        		if(dto.getThumbnail() == null){
        		%>
        			<div style="width: 330px; height: 250px; float: left; text-align: center;">썸네일 없음</div>
        		<%
        		}
        		else {
        		%>
        			<img style="width: 330px; height: 250px;" src = "<%=dto.getThumbnail()%>"><br>
        		<%
        		}
        		%>
        		<div style="width: 330px; margin-top: 20px;">
        			<b style="font-size: 13pt;"><%=dto.getTitle() %></b>
        		</div>
        		<br>
        		<div style="color: #F0CD58; font-size: 18px;">
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
        		</div>
        		<br>
        		<div style="color: #aaa;">
					<%=dto.getLabel1() %> > <%=dto.getLabel2() %>
				</div>
        		<div style="margin-top: 20px; color:#ff7f00; height: 30px;">
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
        		</div><!-- gotodetail 끝 -->
        		<br><br>
        		<table class="table table-bordered" style="table-layout: fixed">
        			<tr height="70px;">
        				<td style="vertical-align: middle;" class="likesTD" contentsid="<%=dto.getContentsid()%>">
        					<span class="glyphicon glyphicon-thumbs-up"></span><br>
        					<%=dto.getLikes() %>
        				</td>
        				<td style="vertical-align: middle;" class="likesTD">
        					<span class="glyphicon glyphicon-heart-empty" style="font-size: 20pt;"></span>
        				</td>
        			</tr>
        		</table>
        	</div> 
        	<%
        }
        %>
        	
	</div> <!-- spotList 끝 -->
	<div class="footer">
		<ul class="pagination">
		<%
			if(startPage > 1){
				%>
				<li><a href="index.jsp?main=spot/spotlist.jsp?area=<%=area %>&pageNum=<%=startPage - 1%>">이전</a></li>
				<%
			}	
		
			for(int i=startPage; i<=endPage; i++){
				// 이동할 페이지 추가
				String url = "index.jsp?main=spot/spotlist.jsp?area=" + area + "&pageNum=" + i;
				
				if(i==currentPage){
					%>
					<li class="active"><a href="<%=url%>"><%=i %></a></li>
					<%
				}
				else {
					%>
					<li><a href="<%=url%>"><%=i %></a></li>
					<%
				}
				
			}
		
			// 다음 버튼
			if(endPage < totalPage){
				%>
				<li><a href="index.jsp?main=spot/spotlist.jsp?area=<%=area %>&pageNum=<%=endPage + 1%>">다음</a></li>
				<%
			}
			%>
			</ul>
	</div>
</body>
</html>