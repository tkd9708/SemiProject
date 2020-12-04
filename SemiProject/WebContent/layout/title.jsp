<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style type="text/css">
  html, body{
      margin: 0;
      width: 100%;
      height: 100%;
  }

  #navbar{
      position: fixed;
      top: -200px;
      width: 100vw;  
      transition: top 0.5s;
      background-color: #FFF;
      border-radius: 0;
      
  } 
  div.header{
      position:relative;
      width: 100vw;  
  }

  div.navbar img, div.header img{
      width: 200px;
      padding-top: 10px;
      padding-bottom:10px;
      padding-left: 30px;
  }
  div.header a.main_login, div.header a.main_mypage{
      float: right;
  }
  a.main_login, a.main_mypage{
      float: right;
  }
  
  a.main_logout{
      float: right;
  }
  
  li.list {
      padding-right: 50px;
      font-family: 'Do Hyeon';
      
  }
  li.list a {
      color: #2b2b2b;
      
  }
  
  .menu{
      border: none;
      border: 0px;
      margin: 0px;
      padding: 0px;
      font-size: 15px;
  }
  .menu ul{
      height: 100px;
      list-style: none;
      margin: 0;
      padding: 0;
  }
  .menu li.logo{
      float: left;
  }
  .header .menu li.list{
      float: right;
      padding-top: 0px;
      padding-bottom: 10px;
      line-height: 70px;
      list-style: none;
  }
   .navbar .menu li.list{
      float: right;
      padding-top: 10px;
      line-height: 62px;
      list-style: none;
  }
  .navbar .menu li.list ul{
      float: right;
      line-height: 40px;
      list-style: none;
  }
  .header .menu li.list ul{
      float: right;
      line-height: 40px;
      list-style: none;
  }
  .menu li li a{
      color:#fff;
      display:block;
      margin:0px;
      text-align:center;
      text-decoration:none;
   }
   .menu li a{
      display: inline;
   }

   .menu li a:hover, .menu ul li:hover a{
      color:#FFFFFF;
      text-decoration:none;
      cursor: pointer;
   }

    .menu li ul{
      background: #9b9b9b;
      display:none; 
      height:40px;
      border:0px;
      position:absolute;
      width:100px;
      z-index:200;
      list-style: none;
      opacity: 0.9;
      /*top:1em;
      /*left:0;*/
    }

    .menu li:hover ul{
      display:block;
    }

    .menu li li {
      background: #3f423e;
      display:block;
      float:none;
      margin:0px;
      padding:0px;
      width:100px;
      list-style: none;
    }

    .menu li:hover li a{
      background:none;
    }

    .menu li ul a{
      display:block;
      height:40px;
      font-size:15px;
      margin:0px;
      padding:0px 10px 0px 15px;
      text-align:left;
      
    }

    .menu li ul a:hover, .menu li ul li:hover a{
      background: rgb(171,171,171);
      border:0px;
      color:black;
      text-decoration:none;
    }

    .menu p{
      clear:left;
    }
  
</style>
<script type="text/javascript">
$(function(){
	$("li.list").on('mouseover',function(){
	    $("li.list a").css('color','black');	
	});
});
</script>
</head>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
	String loginok = (String)session.getAttribute("loginok");
	String myid = (String)session.getAttribute("myid");

%>
<body>
<!-- box_header -->
      <div class="header_color"></div>
      <div class="header" id="header">
        <ul class="menu">
          <li class="logo">
            <a href="index.jsp" class="link">
              <s_if_var_logoImage>
                <img src="<%=url %>/image/logo.png" class="img_logo">
              </s_if_var_logoImage>
            </a>
           </li>
           <%
           if(loginok!=null){
        	   %>
        	   <li class="list" id="list"><a class="main_logout">LOGOUT</a></li>
           		<li class="list" id="list"><a class="main_mypage">Mypage</a></li>
        	   <%
           }
           else {
				%>
        	   <li class="list" id="list"><a class="main_login">LOGIN</a></li>
        	   <%
           }
           %>
           <li class="list" id="list"><a href="<%=url%>/index.jsp?main=shareboard/shareboardlist.jsp">공유게시판</a></li>
           <li class="list" id="list">관광명소
             <ul>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주">제주시</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한경">한경면</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한림">한림읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=애월">애월읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=조천">조천읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=구좌">구좌읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=서귀포">서귀포시</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=대정">대정읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=안덕">안덕면</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=남원">남원읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=표선">표선면 </a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=성산">성산읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=우도">우도</a></li>
             </ul>
           </li>
           <li class="list"><a href="<%=url%>/index.jsp?main=notice/noticelist.jsp">공지사항</a></li>
        </ul>
      </div>
<!-- // box_header -->

	<!-- 복사한 box_header -->
	<div class="navbar" id="navbar">
       <ul class="menu">
          <li class="logo">
            <a href="index.jsp" class="link">
              <s_if_var_logoImage>
                <img src="<%=url %>/image/logo.png" class="img_logo">
              </s_if_var_logoImage>
            </a>
           </li>
           <%
           if(loginok!=null){
        	   %>
        	   <li class="list" id="list"><a class="main_logout">LOGOUT</a></li>
           		<li class="list"><a class="main_mypage">Mypage</a></li>
        	   <%
           }
           else {
				%>
        	   <li class="list" id="list"><a class="main_login">LOGIN</a></li>
        	   <%
           }
           %>
           <li class="list"><a href="<%=url%>/index.jsp?main=shareboard/shareboardlist.jsp">공유게시판</a></li>
           <li class="list">관광명소
             <ul>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=제주">제주시</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한경">한경면</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=한림">한림읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=애월">애월읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=조천">조천읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=구좌">구좌읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=서귀포">서귀포시</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=대정">대정읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=안덕">안덕면</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=남원">남원읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=표선">표선면 </a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=성산">성산읍</a></li>
             <li><a href="<%=url%>/index.jsp?main=spot/spotlist.jsp?area=우도">우도</a></li>
             </ul>
           </li>
           <li class="list"><a href="<%=url%>/index.jsp?main=notice/noticelist.jsp">공지사항</a></li>
         </ul>
      </div>         
<!-- // box_header -->
      
<!-- 상단바 script -->      
<script type="text/javascript">
  $("a.main_login").click(function(e){
	  e.preventDefault();
	  location.href="<%=url%>/index.jsp?main=member/reallogin.jsp";
  });
  
  $("a.main_logout").click(function(e){
	  e.preventDefault();
	  /* location.href="<%=url%>/index.jsp?main=member/logoutform.jsp"; */
	  var a = confirm("정말 로그아웃 하시겠습니까?");
	  if(a){ 
		  $.ajax({
			 type: "get",
			 dataType: "html",
			 url: "member/logoutaction.jsp",
			 success: function(data){
				 location.href="index.jsp?main=layout/main.jsp";
			 }
		  });
	  }
  });

  $("a.main_mypage").click(function(e){
	  e.preventDefault();
	  location.href="<%=url%>/index.jsp?main=mypage/mypage.jsp";
  });
  
  window.onscroll = function () {
	  scrollFunction(); 
};
	  
function scrollFunction(){
	  if(document.body.scrollTop >400 || document.documentElement.scrollTop > 400)
		  {
		  document.getElementById("navbar").style.top = "0";
		  }else{
		  document.getElementById("navbar").style.top = "-200px";  
		  }
  }
  
</script>

</body>
</html>