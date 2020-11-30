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
	
	/* 명소 지도  */
	/* .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
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
    
    /* 명소 주변 맛집  */
    .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
   .map_wrap {position:relative;width:100%;height:350px;}
   #category {position:absolute;top:10px;left:220px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2}
   #category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
   #category li.on {background: #eee;}
   #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
   #category li:last-child{margin-right:0;border-right:0;}
   #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
   #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
   #category li .restaurant {background-position: -10px 0;}
   #category li .cafe {background-position: -10px -36px;}
   #category li .hotel {background-position: -10px -72px;}
   #category li.on .category_bg {background-position-x:-46px;}
   .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
   .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
   .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
   .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
   .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
   .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
   .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
   .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 15px center;
   }
   .placeinfo .tel {color:#0f7833;}
   .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
   
</style>
<%
	String contentsid = request.getParameter("contentsid");
	SpotlistDao dao = new SpotlistDao();
	SpotlistDto dto = dao.getData(contentsid);
	
	SpotReviewDao rdao = new SpotReviewDao();
	List<SpotReviewDto> list = rdao.getList(contentsid);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String myid = (String)session.getAttribute("myid");
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
		<%-- <span class="glyphicon glyphicon-map-marker" style="margin-right: 10px;"></span>
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
		</div> --%>
	</div>
	<hr>
	<br><br>
	
	<br><br>
	
	
	<!-- 명소 주변 맛집 -->
		<div id="Foodspot">
      
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3e5d36ebdbe678f839591abd28e09be7&libraries=services"></script>

<div class="map_wrap">
    <div id="map" style="width:75%;height:550px;position:relative;left:200px;overflow:hidden;"></div>
    <ul id="category">
        <li id="FD6" data-order="0"> 
            <span class="category_bg restaurant"></span>
            음식점
        </li>  
        <li id="CE7" data-order="1"> 
            <span class="category_bg cafe"></span>
            카페
        </li>
        <li id="AD5" data-order="2"> 
            <span class="category_bg hotel"></span>
            숙박
        </li>     
     </ul>   
</div>

<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(<%=dto.getLatitude()%>, <%=dto.getLongitude()%>), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
    
   

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

//지도에 마커를 표시합니다 
var marker = new kakao.maps.Marker({
map: map, 
position: new kakao.maps.LatLng(<%=dto.getLatitude()%>,<%=dto.getLongitude()%>)
}); 

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
// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
                        
    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';
                
    System.out.println(place.place_name + place.address_name);

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 



</script>

</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<hr>
	<br>
	<!-- 명소 리뷰 -->
	<div id="spotReview">
		<h2>Review</h2>
		<form id="newSpotReview" action="spot/insertspotreview.jsp">
			<br>
			<b>작성자 : <%=myid %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
		
		
		<!-- 명소 리뷰 리스트 -->
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