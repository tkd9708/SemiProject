<%@page import="data.dao.SpotlistDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SpotReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SpotReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	  /*별점 css*/
 

.stars{
    display: flex;
    flex-wrap: wrap;

    flex-direction: row-reverse;
    justify-content: flex-end;

}

.stars__star-icon{
    stroke:#EFCE4A;
    stroke-width: 2px;
    fill: transparent;
    transition: .1s all;
}

.stars__star{
    width: 20px;
    height: 20px;
    position: relative;
    cursor: pointer;
    margin: 5px;
}

.stars__checkbox{
    position: absolute;
    top: -9999px;
    opacity: 0;
    width: 0;
    height: 0;
}

.stars__star:hover > .stars__star-icon{
    fill: #EFCE4A;
}

.stars__star:hover ~ .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}

.stars__checkbox:checked + .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}

.stars__checkbox:checked ~ .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}
</style>
<%
	request.setCharacterEncoding("utf-8");
	String contentsid = request.getParameter("contentsid");
	
	SpotReviewDao rdao = new SpotReviewDao();
	//List<SpotReviewDto> list = rdao.getList(contentsid);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String myid = (String)session.getAttribute("myid");
	String loginok = (String)session.getAttribute("loginok");
	
	MemberDao mdao = new MemberDao();
	String memNum = mdao.getMemNum(myid);
	SpotlistDao dao = new SpotlistDao();
	
	// 총 갯수 구하기
	   int totalCount = rdao.getTotalCount(contentsid);
	   int perPage = 5; // 한페이지당 보여질 글의 갯수
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
	   
	   List<SpotReviewDto> list = rdao.getReviewList(start, perPage, contentsid);
	
%>
<script type="text/javascript">
	$(function(){

		$(".stars__checkbox").on("click", function(){
			var idx = $(this).index()/2;
			switch (idx) {
			case 0:
				idx=5;
				break;
			case 1:
				idx=4;
				break;
			case 2:
				idx=3;
				break;
			case 3:
				idx=2;
				break;
			case 4:
				idx=1;
				break;
			default:
				break;
			}
			//alert(idx);
			$("#spotReviewStar").val(idx);	
			var offset = $("#spotReview").offset();
	        $('html, body').animate({scrollTop : offset.top}, 1);
		});
		
		$("#btnInsertReview").click(function(){
			$.ajax({
				type: "post",
				dataType: "html",
				data: {"contentsid":"<%=contentsid%>", "memNum":"<%=memNum%>", "star":$("#spotReviewStar").val(),
						"content":$("#srContent").val()},
				url: "spot/insertspotreview.jsp",
				success: function(data){
					location.reload();
				}
			});
		});
		
		$(".review_likes").click(function(){
			//alert($(this).attr("num"));
			$.ajax({
				type: "get",
				dataType: "html",
				url: "spot/updatelikes.jsp",
				data: {"num": $(this).attr("num")},
				success: function(data){

					location.reload();
				}
			});
		});
		
	});
</script>
</head>
<body>
<h2><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Review</h2>
		<br><br>
		<form id="newSpotReview" action="spot/insertspotreview.jsp">
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%;">
						<b style="margin-left: 60px;">작성자 : <%=myid %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<br><br>
			<!-- <div id="srstarBox" style="display: inline-block;">
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
			</div> -->
			
                                 
           <!-- 별점 -->
     <div class="stars" style="margin-left: 50px;">
        <input class="stars__checkbox" type="radio" id="sd_first-star" name="star">
        <label class="stars__star" for="sd_first-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="sd_second-star" name="star">
        <label class="stars__star" for="sd_second-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="sd_third-star" name="star">
        <label class="stars__star" for="sd_third-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="sd_fourth-star" name="star">
        <label class="stars__star" for="sd_fourth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="sd_fifth-star" name="star">
        <label class="stars__star" for="sd_fifth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        </div>
					</td>
					<td style="width: 70%;">
						<input type="hidden" name="star" id="spotReviewStar" value="0">
						<textarea name="content" id="srContent" style="height: 150px;" class="form-control"></textarea>
			
					</td>
					<td style="width: 10%; padding-left: 10px;">
						<button type="button" class="btn btn-warning" id="btnInsertReview" style="height:150px; width: 100%"><b>작&nbsp;성</b></button>
					</td>
				</tr>
			</table>
			
			<br>
			

			
		</form>
		<br><br>
		
	<%
			if(rdao.getTotalCount(contentsid) == 0){
				%>
				<div style="text-align: center;">
					<h2>😢 등록된 review가 없습니다.</h2>
				</div>
				<%
			}
			else{
				int total = 0;
				for(SpotReviewDto rdto : list){
					total += rdto.getStar();
					%>
					<br><br>
					<hr>
					<div style="margin-left: 100px; margin-right: 100px;">
						<table style="width: 100%">
							<tr>
								<td valign="top" style="width:10%">
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
								<td style="padding-left: 50px; width:80%">
									<b style="font-size: 15pt;"><%=rdto.getContent().replace("\n", "<br>") %></b>
									
								</td>
								<td valign="top" style="width:10%;">
									<%
									if(myid.equals(mdao.getDataByNum(rdto.getMemNum()).getId())){
										%>
										<span style="float:right; cursor: pointer; font-size: 15pt;" class="glyphicon glyphicon-pencil upReview"
											num="<%=rdto.getNum()%>"></span>
										<%
									}
									%>
									
								</td>
							</tr>
						</table>
						
						
						<br><br>
						<div style="float: right;">
							<b><%=mdao.getDataByNum(rdto.getMemNum()).getId() %></b> | <%=sdf.format(rdto.getWriteday())%>
							  | <span style="cursor:pointer;" num="<%=rdto.getNum()%>" class="review_likes">&nbsp;<span class="glyphicon glyphicon-thumbs-up"></span>추천&nbsp;<%=rdto.getLikes() %></span>
						</div>
					</div>
					
					<%
				}
				%>
				<br><br>
				<hr>
				<%
				if(total > 0){
					dao.updateStar(contentsid, total/rdao.getTotalCount(contentsid));
				}
			}
			%>
			
			<div class="footer">
		<ul class="pagination">
		<%
			if(startPage > 1){
				%>
				<li><a style="color:green;" href="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid %>&pageNum=<%=startPage - 1%>#spotReview">◀</a></li>
				<%
			}	
		
			for(int i=startPage; i<=endPage; i++){
				// 이동할 페이지 추가
				String url = "index.jsp?main=spot/spotdetail.jsp?contentsid=" + contentsid + "&pageNum=" + i +"#spotReview";
				
				%>
				<li><a style="color:<%=currentPage==i?"orange":"green"%>" href="<%=url%>"><%=i %></a></li>
				<%
				
			}
		
			// 다음 버튼
			if(endPage < totalPage){
				%>
				<li><a style="color:green;" href="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid %>&pageNum=<%=endPage + 1%>#spotReview">▶</a></li>
				<%
			}
			%>
			</ul>
	</div>
			
</body>
</html>