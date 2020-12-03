<%@page import="data.dao.WishlistDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.Date"%>
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
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
   .thumbnail {
      width: 500px;
      height: 500px;
      margin-left: 200px;
      margin-top: 150px;
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
   
   /* 명소 리스트 */
   .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

a.info {
   text-decoration: none;
   color: #333;
}
div.modal-backdrop{
z-index:0;}
div.modal-content{
margin-top:200px;
z-index:1111;
}


/* 하트 */
.sd_heart {
    position: absolute;
    margin: auto;
    /* top: 0; */
    right: 30px;
    bottom: 30px;
    /* left: 0; */
    background-color: #babbbc;
    height: 30px;
    width: 30px;
    transform: rotate(-45deg);
  }
  .sd_heart:after {
    background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
    width: 35px;
    height: 30px;
    top: 0;
    left: 15px;
  }
  .sd_heart:before {
    background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
    width: 30px;
    height: 35px;
    top: -20px;
    left: 0;
  }
  
  .sd_heartlist {
    position: absolute;
    margin: auto;
    top: 0; 
    right: 0;
    bottom: 0;
    left: 0;
    background-color: #babbbc;
    height: 20px;
    width: 20px;
    transform: rotate(-45deg);
  }
  .sd_heartlist:after {
    background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
    width: 25px;
    height: 20px;
    top: 0;
    left: 8px;
  }
  .sd_heartlist:before {
    background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
    width: 20px;
    height: 25px;
    top: -13px;
    left: 0;
  }

  @keyframes beat {
    50% {
      transform: scale(1.6) rotate(-45deg);
    }
    100% {
      transform: scale(1) rotate(-45deg);
      }
    }
    .color
    {
      background-color: #e63d38;
      animation-name: beat;
      animation-duration: 1s;
      anianimation-play-state: running;
    }
    
    .color:before
    {
      background-color: #e63d38;
    }
    
    .color:after
    {
      background-color: #e63d38;
    }
    

</style>
<%
   String contentsid = request.getParameter("contentsid");
   SpotlistDao dao = new SpotlistDao();
   SpotlistDto dto = dao.getData(contentsid);
   
   SpotReviewDao rdao = new SpotReviewDao();
   List<SpotReviewDto> list = rdao.getList(contentsid);
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   
   String myid = (String)session.getAttribute("myid");
   String loginok = (String)session.getAttribute("loginok");
   String today = sdf.format(new Date());
   
   MemberDao mdao = new MemberDao();
   String memNum = mdao.getMemNum(myid);
   
   WishlistDao wdao = new WishlistDao();
   boolean spotSearch = wdao.isSpotSearch(contentsid);
   
%>
<script type="text/javascript">
   $(function(){
      if(<%=spotSearch%>){
         $(".sd_heart").addClass('color');
      } 
      
      //searchPlaces(); return false;
      
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
         //alert(idx);
         $("#spotReviewStar").val(idx);   
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
      
      /* $("div.sd_heart").click(function(){
         $(".sd_heart:eq(0)").addClass('color');
      }); */
      
      $("#spotHeart").click(function(){
         $("#spotModal").modal();
         
      });
      
      $("#spotGoCal").click(function(){
         if("<%=loginok%>" == "success"){ 
            $.ajax({
               type: "post",
               dataType: "html",
               url: "spot/insertspottocal.jsp",
               data: {"wishday":$("#sd_spotwishday").val(), "spotId":"<%=contentsid%>", "myId":"<%=myid%>"},
               success: function(data){
                  $(".sd_heart").addClass('color');
                  var a = confirm("Mypage로 이동하시겠습니까?");
                  if(a){
                     location.href="index.jsp?main=mypage/mypage.jsp";
                  } 
                  $("#spotModal").modal("hide");
               
               }
            });
         }
         else {
            alert("로그인이 필요한 서비스입니다.");
         }
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
   <div class="thumbnailDetail" style="position: relative;">
      <span style="color: #F0CD58; font-size: 30px;">
         <%
              for(int i=1; i<=5; i++){
                 if(i<=dto.getStar()){
                    %><span class="glyphicon glyphicon-star"></span><%
                 }
                 else {
                    %><span class="glyphicon glyphicon-star-empty"></span><%
                 }
              }
           %>
      </span>
      <br><br>
      <b style="font-size: 20pt;"><%=dto.getTitle() %></b>
      <br><br>
      <span style="color: #ccc; font-size: 13px;">&nbsp;&nbsp;&nbsp;>&nbsp;<%=dto.getTag() %></span><br>
      <hr>
      <span class="glyphicon glyphicon-grain"></span>&nbsp;&nbsp;&nbsp;<b style="color: gray;"><%=dto.getIntroduction() %></b>
      <br><br>
      <%
      if(dto.getRoadaddr()!=null){
         %>
         <span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;&nbsp;<b><%=dto.getRoadaddr() %></b>
         <%
      }
      else {
         %>
         <span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;&nbsp;<b><%=dto.getAddr() %></b>
         <%
      }
      
      %>
      <br>
      <!-- <div style="color: red; font-size: 50pt; position: absolute; bottom:20px; right: 20px; cursor: pointer;">
         <span class="glyphicon glyphicon-heart-empty"></span> 
      </div> -->
      <div class="sd_heart" style="cursor:pointer;" id="spotHeart"></div>
   </div>
   <hr>
   <br><br>
   
   <br><br>
   
   
   <!-- 명소 주변 맛집 -->
   <div style="margin-left: 200px; margin-right: 200px;">
      <h2>명소 주변</h2><br>
      <div class="map_wrap" style="text-align: center;">
    <div id="map" style="width:80%;height:100%; position:relative;overflow:hidden; margin-left: 100px;"></div>
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
    <input type="hidden" value="<%=dto.getTitle() %>" id="keyword" size="15">
   </div>
   <br><br>
    <ul id="placesList"></ul>
    <div id="pagination"></div>
   </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00e1b2682405c666548115f5a38b8163&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다~~~~~~~~~~~~~~~~~~~~~~~~

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(<%=dto.getLatitude()%>, <%=dto.getLongitude()%>), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map);  

//지도에 마커를 표시합니다 ~~~~~~~~~~~~~~~~~~~~~~~~~~`
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
<%--'         <div class="body">' + 
'            <div class="img">' +
'                <img src="<%=dto.getThumbnail()%>" width="73" height="70">' +
'           </div>' + 
'            <div class="desc">' + 
'                <div class="ellipsis"><%=dto.getRoadaddr().substring(0,12)%></div>' + 
'                <div class="jibun ellipsis"><%=dto.getRoadaddr().substring(12)%></div>' + 
'                <div  style="color: #F0CD58; font-size: 18px;">★★★★★</div>' + 
'            </div>' + 
'        </div>' +  --%>
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

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
//searchPlaces();


//~~~~~~~~~~~~~~~~~~~~~
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



//~~~~~~~~~~~~~~~~~~~~~~


// 키워드 검색을 요청하는 함수입니다
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
        
     // 페이지 번호를 표출합니다
        displayPagination(pagination);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

   // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
 // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, place) {
            /* kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, place);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            }); */

            kakao.maps.event.addListener(marker, 'click', function() {
               displayInfowindow(marker, place);
            });
            
            
            
            /* itemEl.onmouseover =  function () {
                //displayInfowindow(marker, title);
            displayPlaceInfo(place);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            }; */
        })(marker, places[i]);

        fragment.appendChild(itemEl);

    }
   

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    
    var el = document.createElement('li'),
    itemStr = '<div style="display: flex; margin-left: 100px;"><span class="markerbg marker_' + (index+1) + '"></span>' +
                '<a class="info" style="float:left; width: 70%; cursor:pointer;" href="' + places.place_url + '" target="_blank" title="' + places.place_name + '">' +
                '   <h5 class="placeName">' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
    itemStr += '  <span class="tel">' + places.phone  + '</span>' + '</a>';  
    itemStr += '<div style="display: inline-block; width: 30%; font-size: 30pt; color:red; '
             +   'text-align: center; line-height: 150px; margin-right: 100px; position: relative;">' 
             //+ ' space="' + places.place_name + '" addr="' + places.road_address_name + '">♡</div></div>';
             + '<div class="sd_heartlist aroundHeart" idx="' + index + '" style="cursor:pointer;" space="' + places.place_name + '" addr="' + places.road_address_name + '" category="' + currCategory + '"></div></div></div>';
             

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
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

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, place) {
    //var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    
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
                
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 

//각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
 var category = document.getElementById('category'),
     children = category.children;

 for (var i=0; i<children.length; i++) {
     children[i].onclick = onClickCategory;
 }
}

//카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
   var id = this.id, className = this.className;

 
 
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

//클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
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
   
   <br><br><br><br><br><br><br><br><br>
   <hr>
   <br>
   <!-- 명소 리뷰 -->
   <div id="spotReview">
      <h2>Review</h2>
      <form id="newSpotReview" action="spot/insertspotreview.jsp">
         <br>
         <b>작성자 : <%=myid %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                        <b><%=mdao.getData(rdto.getMemNum()).getId() %> 님</b><br>
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
   
   <!-- around 일정 추가 modal -->
   <div class="modal fade" id="aroundModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">일정 추가</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="aroundModalInfo"></div>
              <br>
                <span class="glyphicon glyphicon-calendar" style="color: #aaa"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" id="sd_wishday" value="<%=today%>">
           </div>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" id="aroundGoCal">추가</button>
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- spot 일정 추가 modal -->
   <div class="modal fade" id="spotModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">일정 추가</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;&nbsp;&nbsp;<b><%=dto.getTitle() %></b>
              <br><br>
              <span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;&nbsp;&nbsp;<b><%=dto.getRoadaddr() %></b>
              <br><br>
                <span class="glyphicon glyphicon-calendar" style="color: #aaa"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" id="sd_spotwishday" value="<%=today%>">
           </div>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" id="spotGoCal">추가</button>
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 
<script type="text/javascript">

   $(document).on("click", ".aroundHeart", function(){
      $("#aroundModal").modal();
      
      var space = $(this).attr("space");
      var addr = $(this).attr("addr");
      var category = $(this).attr("category");
      var s = "";
      s += "<span class='glyphicon glyphicon-tags'></span>&nbsp;&nbsp;&nbsp;&nbsp;<b>" + space + "</b><br><br>";
      s += "<input type='hidden' id='sd_space' value='"+ space +"'>";
      s += "<input type='hidden' id='sd_addr' value='"+ addr +"'>";
      s += "<input type='hidden' id='sd_category' value='" + category + "'>";
      s += "<input type='hidden' id='sd_heartidx' value='" + $(this).attr("idx") + "'";
      s += "<span class='glyphicon glyphicon-map-marker'></span>&nbsp;&nbsp;&nbsp;&nbsp;<b>" + addr + "</b><br>";
      //s += "</div>";
   
      $("#aroundModalInfo").html(s);   
      
   });
   
   $("#aroundGoCal").click(function(){
      
      if("<%=loginok%>" == "success"){
         $.ajax({
            type: "post",
            dataType: "html",
            url: "spot/insertaroundtocal.jsp",
            data: {"wishday":$("#sd_wishday").val(), "myId":"<%=myid%>", "aroundId":$("#sd_space").val(), "addr":$("#sd_addr").val(), "category":$("#sd_category").val()},
            success: function(data){

               var heartidx = $("#sd_heartidx").val();
               $(".sd_heartlist:eq(" +heartidx+ ")").addClass('color');
               var a = confirm("Mypage로 이동하시겠습니까?");
               if(a){
                  location.href="index.jsp?main=mypage/mypage.jsp";
               } 
               $("#aroundModal").modal("hide");
            }
         });
      }
      else {
         alert("로그인이 필요한 서비스입니다.");
      }
      
   });
</script>


</body>
</html>