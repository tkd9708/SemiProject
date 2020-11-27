<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  #navbar{
      position: fixed;
      top: -200px;
      width: 100%;
      transition: top 0.5s;
      background-color: #FFF;
  } 
  header.header{
      background-color: #FFF;
      width: 100%;
  }
  div.navbar img, header.header img{
      width: 150px;
  }
  div.main_lm {
      text-align: right;
  }

</style>
</head>
<%
    //프로젝트의 경로 구하기
    String url=request.getContextPath();
%>
<body>
<!-- box_header -->
      <header class="header">
          <a href="index.jsp" class="link">
            <s_if_var_logoImage>
              <img src="<%=url %>/image/title_no.png" class="img_logo">
            </s_if_var_logoImage>
          </a>
      <div class="main_lm">    
        <a class="main_login">login</a>
        <a class="main_mypage">mypage</a>
      </div>
      </header>
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
	  if(document.body.scrollTop >350 || document.documentElement.scrollTop > 350)
		  {
		  document.getElementById("navbar").style.top = "0";
		  }else{
		  document.getElementById("navbar").style.top = "-200px";  
		  }
  }
</script>
</body>
</html>