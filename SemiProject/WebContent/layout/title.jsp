<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
      width: 150px;
  }
  div.header a.main_login, div.header a.main_mypage{
      float: right;
  }
  a.main_login, a.main_mypage{
      float: right;
  }
  a.main_login {
      padding-right: 50px;
      padding-top: 31px;
  }
  a.main_mypage{
      padding-right:30px;
      padding-top: 31px; 
  }
</style>
</head>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
%>
<body>
<!-- box_header -->
      <div class="header" id="header">
          <a href="index.jsp" class="link">
            <s_if_var_logoImage>
              <img src="<%=url %>/image/title_no.png" class="img_logo">
            </s_if_var_logoImage>
          </a>  
        <a class="main_login">login</a>
        <a class="main_mypage">mypage</a>
      </div>
<!-- // box_header -->

<!-- 복사한 box_header -->
      <div class="navbar" id="navbar">
          <a href="index.jsp" class="link">
            <s_if_var_logoImage>
              <img src="<%=url %>/image/title_no.png" class="img_logo">
            </s_if_var_logoImage>
          </a>
        <a class="main_login">login</a>
        <a class="main_mypage">mypage</a>
      </div>
      <!-- // box_header -->
      
<!-- 상단바 script -->      
<script type="text/javascript">
  $("a.main_login").click(function(e){
	  e.preventDefault();
	  location.href="<%=url%>/index.jsp?main=member/loginform.jsp";
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