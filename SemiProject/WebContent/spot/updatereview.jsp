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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="font/SCDream5.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
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
	String up = request.getParameter("up");
	
	SpotReviewDao rdao = new SpotReviewDao();
	List<SpotReviewDto> list = rdao.getList(contentsid);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String myid = (String)session.getAttribute("myid");
	String loginok = (String)session.getAttribute("loginok");
	
	MemberDao mdao = new MemberDao();
	String memNum = mdao.getMemNum(myid);
	
	SpotReviewDto dto = rdao.getData(up);
	
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
			$("#up_spotReviewStar").val(idx);	
			var offset = $("#spotReview").offset();
	        $('html, body').animate({scrollTop : offset.top}, 1);
		});
		
		
		$("#btnDeleteReview").click(function(){
			var a = confirm("정말 삭제하시겠습니까?");
			if(a){
				$.ajax({
					type: "get",
					dataType: "html",
					url: "spot/deleteReview.jsp",
					data: {"num": "<%=up%>"},
					success: function(data){

						location.href="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid%>#spotReview";
					}
				});
			}
		});
		
	});
</script>
</head>
<body>
<h2><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Review 수정</h2>
		<br><br>
		<form id="upSpotReview" action="spot/updatereviewaction.jsp">
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%;">
						<b style="margin-left: 60px;">작성자 : <%=myid %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<br><br>
                                 
           				<!-- 별점 -->
    	<div class="stars" style="margin-left: 50px;">
        <input class="stars__checkbox" type="radio" id="up_sd_first-star" name="star">
        <label class="stars__star" for="up_sd_first-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="up_sd_second-star" name="star">
        <label class="stars__star" for="up_sd_second-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="up_sd_third-star" name="star">
        <label class="stars__star" for="up_sd_third-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="up_sd_fourth-star" name="star">
        <label class="stars__star" for="up_sd_fourth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="up_sd_fifth-star" name="star">
        <label class="stars__star" for="up_sd_fifth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        </div>
					</td>
					<td style="width: 80%;">
						<input type="hidden" name="contentsid" value="<%=contentsid %>">
						<input type="hidden" name="num" value="<%=up %>">
						<input type="hidden" name="stars" id="up_spotReviewStar" value="<%=dto.getStar()%>">
						<textarea name="content" id="up_srContent" style="height: 150px; resize: none;" class="form-control"><%=dto.getContent() %></textarea>
			
					</td>
				</tr>
			</table>
			
			<br>
			<button type="submit" class="btn btn-warning" style="float: right; margin-top: 10px;">수정</button>
			<button type="button" class="btn btn-warning" id="btnDeleteReview" style="float: right; margin-top: 10px; margin-right: 10px;">삭제</button>

			
		</form>

			
</body>
</html>