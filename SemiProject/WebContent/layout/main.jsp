<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 슬라이드 관련 link이므로 건들이지말아주세요! -->
<!--Import materialize.css-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css">
<!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<script type="text/javascript">
$(function(){
	$(document).ready(function(){
	  $(".slider").slider({
		  full_width: true,
	      height : 700, 
	      interval: 4000,
	      indicators: false
	  });
	});
  });
</script>
</head>
<%
	// 프로젝트 경로 구하기
	String url = request.getContextPath();
%>
<body>

   <!-- 상단 슬라이드 부분(script는 css 관련이기에 건들면 안됩니다!) -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
   
	<div class="slider">
		<ul class="slides">
			<li><img src="image/udo1.jpg">
				<div class="caption right-align">
					<h1>맨도롱 또똣</h1>
					<h5 class="indigo-text text-lighten-1">
					기분좋게 따뜻한</h5>
				</div></li>
			<li><img src="image/jeju2.jpg">
				<div class="caption left-align">
					<h1>올레</h1>
					<h5 class="light grey-text text-lighten-3">
					집 앞까지 이어지는 작은 골목길</h5>
				</div></li>
		    <li><img src="image/jeju1.jpg">
				<div class="caption center-align">
					<h1 style="color: #84c3ec;">인사리</h1>
					<h5 class="light grey-text text-lighten-3">
					외로움의 벗이 되는 것</h5>
				</div></li>
		 </ul>
	</div>
   <!-- 상단 슬라이드 부분 close -->
   
<button id="btn_go_jeju" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주'">제주시</button>
<button id="btn_go_jocheon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=조천'">조천읍</button>
<button id="btn_go_gujwa" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=구좌'">구좌읍</button>
<button id="btn_go_sungsan" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=성산'">성산읍</button>
<button id="btn_go_pyoseon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=표선'">표선면</button>
<button id="btn_go_namwon" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=남원'">남원읍</button>
<button id="btn_go_seogwipo" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=서귀포'">서귀포시</button>
<button id="btn_go_andeok" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=안덕'">안덕면</button>
<button id="btn_go_daejung" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=대정'">대정읍</button>
<button id="btn_go_hangyeong" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한경'">한경면</button>
<button id="btn_go_hanrim" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한림'">한림읍</button>
<button id="btn_go_aewol" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=애월'">애월읍</button>
<button id="btn_go_aewol" onclick="location.href='<%=url%>/index.jsp?main=spot/spotlist.jsp?area=우도'">우도</button>
<button id="btn_go_shareboard" onclick="location.href='<%=url%>/index.jsp?main=shareboard/shareboardlist.jsp'">공유게시판</button>
<div>
	<img src="image/jejuisland_dark_cut.png" style="max-width: 100%;height: auto;">
</div>
</body>
</html>