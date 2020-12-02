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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<style type="text/css">
body {
	/*background-color: #7eb9e3;*/
	margin: 0;
	height: 100%;
	
}

.jejuisland {
    left:267px;
    padding-top: 50px;
    transition: transform 0.7s, opacity 1s;
    opacity: 0;
    position: relative;
    z-index: -9;
    display: block;
}

div.btn_go {
    padding-top: 50px;
    transition: transform 0.7s, opacity 1s;
    opacity: 0;
    font-family: 'Jua';
} 

/*조천*/
#btn_go_jocheon{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_jocheon.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.jocheon a {
    top: 220px; 
    font-size:30px;
    left: 870px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*서귀포*/
#btn_go_seogwipo{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_seogwipo.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.seogwipo a{
    top: 470px; 
    font-size:30px;
    left: 640px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*제주*/
#btn_go_jeju{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_jeju.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.jeju a{
    top: 260px; 
    font-size:30px;
    left: 710px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*구좌*/
#btn_go_gujwa{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_gujwa.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.gujwa a{
    top: 180px; 
    font-size:30px;
    left: 1000px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*성산*/
#btn_go_sungsan{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_sungsan.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.sungsan a{
    top: 320px; 
    font-size:30px;
    left: 1070px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*표선*/
#btn_go_pyoseon{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_pyoseon.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.pyoseon a{
    top: 370px; 
    font-size:30px;
    left: 975px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*남원*/
#btn_go_namwon{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_namwon.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.namwon a{
    top: 400px; 
    font-size:30px;
    left: 820px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*안덕*/
#btn_go_andeok{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_andeok.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.andeok a{
    top: 500px; 
    font-size:30px;
    left: 480px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*대정*/
#btn_go_daejung{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_daejung.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.daejung a{
    top: 510px; 
    font-size:30px;
    left: 390px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*한경*/
#btn_go_hangyeong{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_hangyeong.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.hangyeong a{
    top: 430px; 
    font-size:30px;
    left: 370px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*한림*/
#btn_go_hanrim{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_hanrim.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.hanrim a{
    top: 370px; 
    font-size:30px;
    left: 430px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*애월*/
#btn_go_aewol{
    top: 93px; 
    left: 260px;
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_aewol.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.aewol a{
    top: 350px; 
    font-size:30px;
    left: 530px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*우도*/
#btn_go_udo{
    top: 95px; 
    left: 262px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_udo.hover{
    top: 95px; 
    left: 262px; 
=======
=======

>>>>>>> branch 'feature/1' of https://github.com/tkd9708/SemiProject.git
.jejuisland {
    left:267px;
    padding-top: 50px;
    transition: transform 0.7s, opacity 1s;
    opacity: 0;
    position: relative;
    z-index: -9;
    display: block;
}

div.btn_go {
    padding-top: 50px;
    transition: transform 0.7s, opacity 1s;
    opacity: 0;
    font-weight: bold;
    font-size: 25px;
} 

/*조천*/
#btn_go_jocheon{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_jocheon.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.jocheon a {
    top: 220px; 
    left: 870px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*서귀포*/
#btn_go_seogwipo{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_seogwipo.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.seogwipo a{
    top: 470px; 
    left: 640px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*제주*/
#btn_go_jeju{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_jeju.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.jeju a{
    top: 260px; 
    left: 710px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*구좌*/
#btn_go_gujwa{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_gujwa.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.gujwa a{
    top: 180px; 
    left: 1000px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*성산*/
#btn_go_sungsan{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_sungsan.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.sungsan a{
    top: 320px; 
    left: 1070px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*표선*/
#btn_go_pyoseon{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_pyoseon.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.pyoseon a{
    top: 370px; 
    left: 975px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*남원*/
#btn_go_namwon{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_namwon.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.namwon a{
    top: 400px; 
    left: 820px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*안덕*/
#btn_go_andeok{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_andeok.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.andeok a{
    top: 500px; 
    left: 480px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*대정*/
#btn_go_daejung{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_daejung.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.daejung a{
    top: 510px; 
    left: 390px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*한경*/
#btn_go_hangyeong{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_hangyeong.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.hangyeong a{
    top: 430px; 
    left: 370px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*한림*/
#btn_go_hanrim{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_hanrim.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.hanrim a{
    top: 370px; 
    left: 430px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*애월*/
#btn_go_aewol{
    top: 93px; 
    left: 260px;
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_aewol.hover{
    top: 93px; 
    left: 260px; 
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.aewol a{
    top: 350px; 
    left: 530px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

/*우도*/
#btn_go_udo{
    top: 95px; 
    left: 262px; 
    position: absolute;
    z-index: 2; 
    visibility: hidden; 
}

#btn_go_udo.hover{
<<<<<<< HEAD
    top: 100px; 
    left: 267px; 
>>>>>>> branch 'Develop' of https://github.com/tkd9708/SemiProject.git
=======
    top: 95px; 
    left: 262px; 
>>>>>>> branch 'feature/1' of https://github.com/tkd9708/SemiProject.git
    position: absolute;
    z-index: 2; 
    visibility: visible; 
}

.udo a{
    top: 200px; 
    left: 1230px; 
    z-index: 3;
    position: absolute;
    text-decoration: none;
    color: #fff;
}

.notice {
    position: relative;
}

.shareboard {
    position: relative;
}

div.container{
    position: relative;
    top: 100px;
    width: max-content;
    margin: auto;
    transition: transform 0.7s, opacity 1s;
    opacity: 0;
    padding-top: 100px;
    margin-left: 400px;
    margin-bottom: 100px;
}

#custom-search-input{
    padding: 3px;
    border: solid 3px #ffa400;
    border-radius: 6px;
    background-color: #fff;
    display: inline-block;
    float: right;
    height: 55px;
}

#custom-search-input input{
    border: 0;
    box-shadow: none;
    display: inline-block;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}

select.combobox{
    display: inline-block;
    width: 100px;
    background-color: #fff;
    float: left;
    height: 55px;
    margin-top: 1px;
    border: solid 3px #ffa400; 
    border-radius: 6px;
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
	
	$("div.btn_go").on('mouseover',function(){
	    $(this).css('color','white');	
	});

  });//function close
  
  function isElementUnderBottom(elem, triggerDiff) {
	  const { top } = elem.getBoundingClientRect();
	  const { innerHeight } = window;
	  return top > innerHeight + (triggerDiff || 0);
	};

	function handleScroll() {
	  const elems = document.querySelectorAll('.jejuisland,.btn_go,.container');
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
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
   <!-- 상단 슬라이드 부분 close -->
 
<div class="container">
 <div class="combo">
            <select class="combobox">
                <option value="all" selected="selected">전  체</option>
                <option value="land">지  역</option>
                <option value="spot">지역명소</option>
             </select>
         </div>
	<div class="row">
        <div class="col-md-6">
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="검색할 단어를 입력해주세요" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
	</div>
</div>

<div class="btn_go"> 
<div class="jeju">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주">제주시</a>
</div>
<img id="btn_go_jeju" src="<%=url %>/image/land_s/jeju_s.png">

<div class="jocheon">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=조천">조천읍</a>
</div>
<img id="btn_go_jocheon" src="<%=url %>/image/land_s/jocheon_s.png">

<div class="gujwa">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=구좌">구좌읍</a>
</div>
<img id="btn_go_gujwa" src="<%=url %>/image/land_s/gujwa_s.png">

<div class="sungsan">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=성산">성산읍</a>
</div>
<img id="btn_go_sungsan" src="<%=url %>/image/land_s/sungsan_s.png">

<div class="pyoseon">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=표선">표선면</a>
</div>
<img id="btn_go_pyoseon" src="<%=url %>/image/land_s/pyoseon_s.png">

<div class="namwon">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=남원">남원읍</a>
</div>
<img id="btn_go_namwon" src="<%=url %>/image/land_s/namwon_s.png">

<div class="seogwipo">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=서귀포">서귀포시</a>
</div>
<img id="btn_go_seogwipo" src="<%=url %>/image/land_s/seogwipo_s.png">

<div class="andeok">
<a  href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=안덕">안덕면</a>
</div>
<img id="btn_go_andeok" src="<%=url %>/image/land_s/andeok_s.png">

<div class="daejung">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=대정">대정읍</a>
</div>
<img id="btn_go_daejung" src="<%=url %>/image/land_s/daejung_s.png">

<div class="hangyeong">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한경">한경면</a>
</div>
<img id="btn_go_hangyeong" src="<%=url %>/image/land_s/hangyeong_s.png">

<div class="hanrim">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한림">한림읍</a>
</div>
<img id="btn_go_hanrim" src="<%=url %>/image/land_s/hanrim_s.png">

<div class="aewol">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=애월">애월읍</a>
</div>
<img id="btn_go_aewol" src="<%=url %>/image/land_s/aewol_s.png">

<div class="udo">
<a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=우도">우도</a>
</div>
<img id="btn_go_udo" src="<%=url %>/image/land_s/udo_s.png">
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