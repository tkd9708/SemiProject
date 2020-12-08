<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
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
<link rel="stylesheet" type="text/css" href="layout/css/main.css">
<%
   // 프로젝트 경로 구하기
   String url = request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	$(".btn_search").click(function(){
		var selSearch = $("#selSearch option:selected").val();
		var search = $("#main_search").val();
		
		if(search.trim() == ""){
			alert("검색할 단어를 입력해주세요.");
		}
		else {
			location.href = "<%=url%>/index.jsp?main=spot/spotsearch.jsp?search=" + search + "&selSearch=" + selSearch;
		}
		//alert($("#selSearch option:selected").val());
	});
	
	
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
     const elems = document.querySelectorAll('.jejuisland');
     elems.forEach(elem => {
       if (isElementUnderBottom(elem, -200)) {
         elem.style.opacity = "0";
         elem.style.transform = 'translate(-50%, 100px)';
       } else {
         elem.style.opacity = "1";
         elem.style.transform = 'translate(-50%, 0px)';
       }
     });
   };
   
   function handleScroll2() {
	     const elems = document.querySelectorAll('.container');
	     elems.forEach(elem => {
	       if (isElementUnderBottom(elem, -50)) {
	         elem.style.opacity = "0";
	         elem.style.transform = 'translateY(100px)';
	       } else {
	         elem.style.opacity = "1";
	         elem.style.transform = 'translateY(0px)';
	       }
	     });
	   };
	   
	   function handleScroll3() {
		     const elems = document.querySelectorAll('.btn_go');
		     elems.forEach(elem => {
		       if (isElementUnderBottom(elem, -200)) {
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
<body>
   <!-- 상단 슬라이드 부분(script는 css 관련이기에 건들면 안됩니다!) -->
 
   
   <div class="slider">
      <ul class="slides">
         <li><img src="image/udo1.jpg">
            <div class="caption right-align">
               <h1 style="color: #5c538a;">맨도롱하다</h1>
               <h5 style="color: #463e68;">
               기분좋게 따뜻하다</h5>
            </div></li>
         <li><img src="image/jeju1.jpg">
            <div class="caption left-align">
               <h1 style="color: #3a6b79;">인사리</h1>
               <h5 style="color: #214651;">
               외로움의 벗이 되는 것</h5>
            </div></li>
          <li><img src="image/jeju2.jpg">
            <div class="caption center-align">
               <h1 style="color: #c1451c;">올레</h1>
               <h5 style="color: #923614;">
               집 앞까지 이어지는 작은 골목길</h5>
               
            </div></li>
       </ul>
   </div>
   <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
   <!-- 상단 슬라이드 부분 close -->

<div class="container">
 <div class="combo">
            <select class="combobox" id="selSearch">
                <option value="all" selected="selected">전  체</option>
                <option value="land">지  역</option>
                <option value="spot">지역명소</option>
                <option value="tag">태그</option>
             </select>
         </div>
   <div class="row">
        <div class="col-md-6">
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" id="main_search" placeholder="검색할 단어를 입력해주세요" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg btn_search" type="button">
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
window.addEventListener('scroll', handleScroll2);
window.addEventListener('scroll', handleScroll3);
</script>
<img class="jejuisland" src="image/jejuisland_d.png" style="max-width: 100%;">

<!-- 땅부분 종료 -->
<div class="nslist">
<!-- 공지사항 -->
<div class="notice">
<h5>공지사항</h5>
   <button id="btn_go_notice" onclick="location.href='<%=url%>/index.jsp?main=notice/noticelist.jsp'"><img src="<%=url %>/image/plus.png"></button>
   <%
   //최신글 4개 가져오기
   NoticeDao ndao=new NoticeDao();
   List<NoticeDto> nlist=ndao.getMainList();
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   %>
   <table class="ntable">
      <tr>
             <th>제   목</th>
             <th>작성일</th>
        </tr>
        <%
        for(NoticeDto dto:nlist)
          {%>
        <tr>
             <td>
                <a href="index.jsp?main=notice/noticelist.jsp?num=<%=dto.getNum() %>&pageNum=1&key=a">
                <span class="msubject"><%=dto.getSubject() %></span>
                </a>            
             </td>
             <td style="text-align: center;"><%=sdf.format(dto.getWriteday())%></td>
        </tr>
        <%}
        %>
   </table>
</div>
<!-- 공유게시판-->
<div class="shareboard">
<h5>공유게시판</h5>
<button id="btn_go_shareboard" onclick="location.href='<%=url%>/index.jsp?main=shareboard/shareboardlist.jsp'"><img src="<%=url %>/image/plus.png"></button>
<!-- shareboard list 자리 -->
</div>
</div>

</body>
</html>