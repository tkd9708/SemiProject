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
  <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0"/>
 
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Open+Sans");
body {
	background-color: #7eb9e3;
	height: 2000px;
	margin: 0;
	
}
.jejuisland {
    left:267px;
    padding-top: 50px;
    transition: transform 0.7s, opacity 1s;
    opacity: 0;
    position: absolute;
    z-index: -9;
}

div.btn_go {
    padding-top: 50px;
    transition: transform 0.7s, opacity 1s;
    opacity: 0;
} 

/*조천*/
#btn_go_jocheon{
    top: 100px;
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_jocheon.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.jocheon a {
    top: 220px; 
    font-size:25px;
    left: 870px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*서귀포*/
#btn_go_seogwipo{
    top: 100px;; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_seogwipo.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.seogwipo a{
    top: 470px; 
    font-size:25px;
    left: 640px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*제주*/
#btn_go_jeju{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_jeju.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.jeju a{
    top: 260px; 
    font-size:25px;
    left: 710px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*구좌*/
#btn_go_gujwa{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_gujwa.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.gujwa a{
    top: 180px; 
    font-size:25px;
    left: 1000px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*성산*/
#btn_go_sungsan{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_sungsan.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.sungsan a{
    top: 320px; 
    font-size:25px;
    left: 1070px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*표선*/
#btn_go_pyoseon{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_pyoseon.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.pyoseon a{
    top: 370px; 
    font-size:25px;
    left: 975px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*남원*/
#btn_go_namwon{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_namwon.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.namwon a{
    top: 400px; 
    font-size:25px;
    left: 820px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*안덕*/
#btn_go_andeok{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_andeok.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.andeok a{
    top: 500px; 
    font-size:25px;
    left: 480px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*대정*/
#btn_go_daejung{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_daejung.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.daejung a{
    top: 510px; 
    font-size:25px;
    left: 390px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*한경*/
#btn_go_hangyeong{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_hangyeong.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.hangyeong a{
    top: 430px; 
    font-size:25px;
    left: 370px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*한림*/
#btn_go_hanrim{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_hanrim.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.hanrim a{
    top: 370px; 
    font-size:25px;
    left: 430px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*애월*/
#btn_go_aewol{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_aewol.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.aewol a{
    top: 350px; 
    font-size:25px;
    left: 530px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*우도*/
#btn_go_udo{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_udo.hover{
    top: 100px; 
    left: 267px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.udo a{
    top: 200px; 
    font-size:25px;
    left: 1230px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

.notice {
    position: relative;
    top: 800px;
}

.shareboard {
    position: relative;
    top: 800px;
}

.search {
  width: 100%;
  position: relative;
  display: flex;
}

.searchTerm {
  width: 100%;
  border: 3px solid #00B4CC;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #00B4CC;
  background: #00B4CC;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 30%;
  position: absolute;
  top: 850px;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
<script type="text/javascript">
$(function(){
	$(document).ready(function(){
	  $(".slider").slider({
		  full_width: true,
	      height : 800, 
	      interval: 4000,
	      indicators: false
	  });
	});
	//제주도 버튼 움직이는 함수들
	//조천
	$("div.jocheon").hover(function(){
	    $("#btn_go_jocheon").addClass("hover");
	},function(){
		$("#btn_go_jocheon").removeClass("hover");
	});
	
	//서귀포
	$("div.seogwipo").hover(function(){
	    $("#btn_go_seogwipo").addClass("hover");
	},function(){
		$("#btn_go_seogwipo").removeClass("hover");
	});
	
	//제주
	$("div.jeju").hover(function(){
	    $("#btn_go_jeju").addClass("hover");
	},function(){
		$("#btn_go_jeju").removeClass("hover");
	});
	
	//구좌
	$("div.gujwa").hover(function(){
	    $("#btn_go_gujwa").addClass("hover");
	},function(){
		$("#btn_go_gujwa").removeClass("hover");
	});
	
	//성산
	$("div.sungsan").hover(function(){
	    $("#btn_go_sungsan").addClass("hover");
	},function(){
		$("#btn_go_sungsan").removeClass("hover");
	});
	
	//표선
	$("div.pyoseon").hover(function(){
	    $("#btn_go_pyoseon").addClass("hover");
	},function(){
		$("#btn_go_pyoseon").removeClass("hover");
	});
	
	//남원
	$("div.namwon").hover(function(){
	    $("#btn_go_namwon").addClass("hover");
	},function(){
		$("#btn_go_namwon").removeClass("hover");
	});
	
	//안덕
	$("div.andeok").hover(function(){
	    $("#btn_go_andeok").addClass("hover");
	},function(){
		$("#btn_go_andeok").removeClass("hover");
	});
	
	//대정
	$("div.daejung").hover(function(){
	    $("#btn_go_daejung").addClass("hover");
	},function(){
		$("#btn_go_daejung").removeClass("hover");
	});
	
	//대정
	$("div.daejung").hover(function(){
	    $("#btn_go_daejung").addClass("hover");
	},function(){
		$("#btn_go_daejung").removeClass("hover");
	});
	
	//한경
	$("div.hangyeong").hover(function(){
	    $("#btn_go_hangyeong").addClass("hover");
	},function(){
		$("#btn_go_hangyeong").removeClass("hover");
	});
	
	//한림
	$("div.hanrim").hover(function(){
	    $("#btn_go_hanrim").addClass("hover");
	},function(){
		$("#btn_go_hanrim").removeClass("hover");
	});
	
	//애월
	$("div.aewol").hover(function(){
	    $("#btn_go_aewol").addClass("hover");
	},function(){
		$("#btn_go_aewol").removeClass("hover");
	});
	
	//우도
	$("div.udo").hover(function(){
	    $("#btn_go_udo").addClass("hover");
	},function(){
		$("#btn_go_udo").removeClass("hover");
	});
	
  });//function close
  
  function isElementUnderBottom(elem, triggerDiff) {
	  const { top } = elem.getBoundingClientRect();
	  const { innerHeight } = window;
	  return top > innerHeight + (triggerDiff || 0);
	};

	function handleScroll() {
	  const elems = document.querySelectorAll('.jejuisland,.btn_go,.wrap');
	  elems.forEach(elem => {
	    if (isElementUnderBottom(elem, -300)) {
	      elem.style.opacity = "0";
	      elem.style.transform = 'translateY(100px)';
	    } else {
	      elem.style.opacity = "1";
	      elem.style.transform = 'translateY(0px)';
	    }
	  });
	};

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
   <div class="wrap">
   <div class="search">
      <input type="text" class="searchTerm" placeholder="What are you looking for?">
      <button type="submit" class="searchButton">
        <i class="fa fa-search"></i>
     </button>
   </div>
</div>
<div class="btn_go">
  
<div class="jeju">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주">제주시</a>
</div>
<img id="btn_go_jeju" src="<%=url %>/image/land/jeju.png">

<div class="jocheon">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=조천">조천읍</a>
</div>
<img id="btn_go_jocheon" src="<%=url %>/image/land/jocheon.png">

<div class="gujwa">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=구좌">구좌읍</a>
</div>
<img id="btn_go_gujwa" src="<%=url %>/image/land/gujwa.png">

<div class="sungsan">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=성산">성산읍</a>
</div>
<img id="btn_go_sungsan" src="<%=url %>/image/land/sungsan.png">

<div class="pyoseon">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=표선">표선면</a>
</div>
<img id="btn_go_pyoseon" src="<%=url %>/image/land/pyoseon.png">

<div class="namwon">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=남원">남원읍</a>
</div>
<img id="btn_go_namwon" src="<%=url %>/image/land/namwon.png">

<div class="seogwipo">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=서귀포">서귀포시</a>
</div>
<img id="btn_go_seogwipo" src="<%=url %>/image/land/seogwipo.png">

<div class="andeok">
<a  href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=안덕">안덕면</a>
</div>
<img id="btn_go_andeok" src="<%=url %>/image/land/andeok.png">

<div class="daejung">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=대정">대정읍</a>
</div>
<img id="btn_go_daejung" src="<%=url %>/image/land/daejung.png">

<div class="hangyeong">
<a .href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한경">한경면</a>
</div>
<img id="btn_go_hangyeong" src="<%=url %>/image/land/hangyeong.png">

<div class="hanrim">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한림">한림읍</a>
</div>
<img id="btn_go_hanrim" src="<%=url %>/image/land/hanrim.png">

<div class="aewol">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=애월">애월읍</a>
</div>
<img id="btn_go_aewol" src="<%=url %>/image/land/aewol.png">

<div class="udo">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=우도">우도</a>
</div>
<img id="btn_go_udo" src="<%=url %>/image/land/udo.png">
</div>


<!-- 제주도 땅부분 -->

<script type="text/javascript">
window.addEventListener('scroll', handleScroll);
</script>
<img class="jejuisland" src="image/jejuisland_d.png" style="max-width: 100%;height: auto;">

<!-- 땅부분 종료 -->

<div class="notice">
<button id="btn_go_notice" onclick="location.href='<%=url%>/index.jsp?main=notice/noticelist.jsp'">공지사항</button>
</div>
<div class="shareboard">
<button id="btn_go_shareboard" onclick="location.href='<%=url%>/index.jsp?main=shareboard/shareboardlist.jsp'">공유게시판</button>
</div>
</body>
</html>