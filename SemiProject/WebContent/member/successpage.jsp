<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%--
만약 자바코드로 해야할 상황일경우
response.setHeader("Refresh","3;url=index.jsp");
 --%>
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
<style type="text/css">
.success {  
   text-align: center;
   margin-top: 300px;
   margin-bottom: 200px;
   
}
</style>
</head>
<body>
<div class="success">
<h1>회원가입을 축하드립니다!</h1>
   <h4>이제 멘도롱소랑의 다양한 기능을 이용하실 수 있습니다!</h4>
</div>
<script type="text/javascript">
   function window_onload(){
         setTimeout('go_url()',5000)
      }
      function go_url(){
         location.href="index.jsp?main=layout/main.jsp"
      }
     
   window_onload();
</script>
</body>
</html>