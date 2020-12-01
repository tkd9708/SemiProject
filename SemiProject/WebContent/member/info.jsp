<%@page import="data.dao.SpotlistDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	MemberDao dao=new MemberDao();
	
	if((String)session.getAttribute("loginok") != "success")
	{%>
	<script type="text/javascript">
		$(".infoMember").hide();	
	</script>
	<%}
%>
<script type="text/javascript">
	function readUrl(input){
		if(input.files[0]){
			var reader=new FileReader();
			reader.onload=function(e){
				$("#showImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<%
SpotlistDao sdao=new SpotlistDao();
%>
</head>
<body>
<div class="infoMember">
<%if(!((String)session.getAttribute("myid")).equals("admin"))
  {%>
	<div class="photoZone">
		<!-- 이미지 출력할곳 -->
		<div class="pZ">
			<img id="showImg">
		</div>
		<!-- 이미지 출력할곳 -->
		<form action="member/photoaction.jsp" method="post"
		enctype="multipart/form-data">
			<div class="photoShow">
				<b>사진을 선택해주세요(1개만 가능)</b>
				<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-camera" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M15 12V6a1 1 0 0 0-1-1h-1.172a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 9.173 3H6.828a1 1 0 0 0-.707.293l-.828.828A3 3 0 0 1 3.172 5H2a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
					<path fill-rule="evenodd" d="M8 11a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
					<path d="M3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
				</svg>
				<input type="file" name="photo" id="photo" onchange="readUrl(this)">
				<br>
				<button type="submit" class="btnPhoto"></button>
			</div>
		</form>
	</div>
	<div class="nameZone">
		<span><%=(String)session.getAttribute("myid")%></span>
		<span>관심있는 것들</span>
	</div>
	<div class="rankZone">
	
	</div>
	<div class="countZone">
		<div class="countList">
			<dl>
				<dt>나의 여행일정</dt>
				<dd></dd>
			</dl>
			<dl>
				<dt>찜한 즐겨찾기</dt>
				<dd></dd>
			</dl>
			<dl>
				<dt>찜한 여행일정</dt>
				<dd></dd>
			</dl>
			<dl>
				<dt>방문 여행지</dt>
				<dd></dd>
			</dl>
			<dl>
				<dt>찜한 여행지</dt>
				<dd>
				</dd>
			</dl>
			<dl>
				<dt>성향</dt>
				<dd></dd>
			</dl>
		</div>
	</div>
  <%}%>
<div class="basicInfo">	
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-bounding-box" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z"/>
	  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
	</svg>
	<b><%=(String)session.getAttribute("myid")%></b><br>
	<b style="marin-left: 10px;"><%=dao.getName((String)session.getAttribute("myid"))%></b><br>
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
	  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
	</svg>
	<b style="marin-left: 10px;">주소</b><br>
	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-phone" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M11 1H5a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
	  <path fill-rule="evenodd" d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
	</svg>
	<b style="marin-left: 10px;">핸드폰</b><br>
</div>

</div>
</body>
</html>