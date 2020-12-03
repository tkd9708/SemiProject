<%@page import="data.dto.ZipcodeDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../image/favicon.ico">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/member/css/postsearch.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/member/js/postsearch.js" ></script> 
<title>멘도롱 또똣 :: 우편번호 보기</title>
</head>
<body>
	<div class="popupPost">
		<div class="popHead">
			<form action="postsearch.jsp" method="get" id="searchForm" class="formSearch">
				<fieldset class="postFld">
					<div class="postSearch">
						<div class="wrapAddress">
							<label class="fs">
								<div class="ipWrapper">
									<input type="text" id="regionName" 
									class="findRegion" name="regionName"
									value="" autocomplete="off" required="required"
									autofocus="autofocus"
									placeholder=" "></input>
									<span class="placeholder show" label-value="예) 서초구 강남대로459 백암빌딩"></span>
								</div>
							</label>
							<input type="hidden" name="key" value="result">
							<button type="submit" class="btnSearch">
								<svg width="1em" height="1em" viewBox="0 0 16 16" 
								class="bi bi-search imgPost" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
								  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
								</svg>
							</button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	<%
	String key=request.getParameter("key");
	if(key==null)
	{
		//검색폼
	%>
		<div class="popBody">
			<div class="Postinfo">
				<!-- <p class="infoWrite">아래와 같이 검색하세요.</p>
				<p class="infoWrite">도로명 + 건물번호</p>
				<span class="txtInfo">예) 강남대로 459,&nbsp;&nbsp;영동대로 220</span>
				<p class="infoWrite2">지역명(동/리) + 번지</p>
				<span class="txtInfo">예) 서초동 269-4,&nbsp;&nbsp;귤현동 234-7</span>
				<p class="infoWrite2">지역명(동/리) + 건물명(아파트명)</p>
				<span class="txtInfo">예) 분당 주공,&nbsp;&nbsp;귤현동 힐타운11차</span>
				<p class="infoWrite2">사서함명 + 번호</p>
				<span class="txtInfo">예) 강릉우체국사서함 1~100</span> -->
			</div>
		</div>
	<%}
	else
	{//결과
		String regionName=request.getParameter("regionName");
		//dao 선언
		MemberDao dao=new MemberDao();
		
		//메서드 호출
		List<ZipcodeDto> list=dao.getSearchDong(regionName);
		
		//출력
	%>
		<div><b>검색결과</b></div>
		<div class="wholeAddr">주소 전체</div>
		<ul class="addrList">
			<%
			for(ZipcodeDto dto:list)
			{
				//보일때는 번지까지
				String addr1="("+dto.getZipcode()+")"
				+dto.getSido()+" "+dto.getGugun()
				+" "+dto.getDong()+" "+dto.getRi()
				+" "+dto.getBunji();
				//실제 적용은 번지 제외
				String addr2="("+dto.getZipcode()+")"
				+dto.getSido()+" "+dto.getGugun()
				+" "+dto.getDong()+" "+dto.getRi();
			%>
			<li class="addrRoll">
				<span class="postCode"><%=dto.getZipcode()%></span>
				<dl class="addrShow">
					<dt class="wrAddr"><span>주소</span></dt>
					<dd class="addrInfo">
						<button class="optAddress" onclick="select('<%=addr2%>')">
							<span class="txtAddr"><%=addr1%></span>
						</button>
					</dd>
				</dl>	
			</li>
			<%}
			%>
		</ul>
		<div class="addrPage"></div>
	<%}
%>
		<div class="popupFoot">
			<span class="innerFooter">
				<strong class="ddoddot">멘도롱 또똣</strong>
			</span>
		</div>
	</div>
</body>
</html>