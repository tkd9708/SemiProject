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
	
	/* span.star {
		font-size: 20pt; 
		color: #F0CD58;
		cursor: pointer;
	} */
	
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
	
	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .mtitle {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 12px;font-weight: bold;}
    .info .close {position: absolute;top: 8px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size: 13px}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;font-size: 13px}
    .info .img {position: absolute;top: 40px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
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
		
		/* $("#srstarBox span").on("click",function(){
			var idx = $(this).index()+1;
			$(".star").removeClass("glyphicon glyphicon-star-empty");
			
			for(var i=0; i<=idx; i++){
			   	$(".star").eq(i).addClass("glyphicon glyphicon-star");
			}
			for(var i=idx; i<=5; i++){
			   	$(".star").eq(i).addClass("glyphicon glyphicon-star-empty");
			}
			$("#spotReviewStar").val(idx);	
		}); */
		
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
			alert(idx);
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
		<br><br>
		<div id="spotMap">
			<div id="map" style="width:500px;;height:250px;"></div>
     		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e5d36ebdbe678f839591abd28e09be7&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도의 중심좌표
			mapOption = { 
    			center: new kakao.maps.LatLng(<%=dto.getLatitude()%>, <%=dto.getLongitude()%>), // 지도의 중심좌표
    			level: 3 // 지도의 확대 레벨
			}; 

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			//지도에 마커를 표시합니다 
			var marker = new kakao.maps.Marker({
				map: map, 
				position: new kakao.maps.LatLng(<%=dto.getLatitude()%>,<%=dto.getLongitude()%>)
			});

			//커스텀 오버레이에 표시할 컨텐츠 입니다
			//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에	
			//별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="mtitle">' + 
        '            <%=dto.getTitle()%>' + 
        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="<%=dto.getThumbnail()%>" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="ellipsis"><%=dto.getRoadaddr().substring(0,12)%></div>' + 
        '                <div class="jibun ellipsis"><%=dto.getRoadaddr().substring(12)%></div>' + 
        '                <div  style="color: #F0CD58; font-size: 18px;">★★★★★</div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';

			//마커 위에 커스텀오버레이를 표시합니다
			//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				content: content,
				map: map,
				position: marker.getPosition()       
			});

			//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				overlay.setMap(map);
			});

			//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
				overlay.setMap(null);     
			}

			</script>
		</div>
	</div>
	<hr>
	<br><br>
	
	
	
	
	<br><br>
	<div id="spotReview">
		<h2>Review</h2>
		<form id="newSpotReview" action="spot/insertspotreview.jsp">
			<br>
			<b>작성자 : 로그인한 ID</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="hidden" name="memNum" id="srMemNum" value="0">
			<br><br>
			<!-- <div id="srstarBox" style="display: inline-block;">
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
				<span class="glyphicon glyphicon-star-empty star"></span>
			</div> -->
			
			                         
                                 
           <!-- 별점 -->
     <div class="stars">
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