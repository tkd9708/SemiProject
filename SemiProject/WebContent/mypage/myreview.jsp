<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.SpotlistDao"%>
<%@page import="data.dto.SpotReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.WishlistDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.myreview_main{
margin-top: 200px;
}
div.myreview{
margin-left: 150px;
margin-right: 150px;
}
a { text-decoration:none; color: black}
a:hover { text-decoration:none }

</style>
</head>
<body>
<div class="myreview_main">

	<div class="myreview">
	<h1>리뷰 목록</h1>
		<br>
	
		<%
			String sessionId = (String)session.getAttribute("myid");
			MemberDao mdao = new MemberDao();
			String memNum = mdao.getMemNum(sessionId);
			WishlistDao wdao = new WishlistDao();
			List<SpotReviewDto> srlist = wdao.getMyreviews(memNum);
			SpotlistDao sddao = new SpotlistDao();
			%>
			<table class="myreview table table-striped" >
					<tr>	
						<th style="font-weight:bold;text-align: center">관광지</th>
						<th style="font-weight:bold;text-align: center">리뷰</th>
						<th style="font-weight:bold;text-align: center">별점</th>
						<th style="font-weight:bold;text-align: center">작성자</th>
						<th style="font-weight:bold;text-align: center">작성일</th>
					</tr>
		<%
		for(SpotReviewDto srdto: srlist){
			String contentsid = srdto.getContentsid();
			//System.out.println(contentsid);
			String title = wdao.getSpottitle(contentsid);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-hh");
			
		%>	
			<tr>
				<td style="text-align:center;width:250px">
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid%>">
					<span class="title"><%=title%></span>
					</a>
				</td>
				<td style="text-align:left;width:600px">
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid %>#spotReview">
					<span class="reviewcontent"><%=srdto.getContent() %></span>
					</a>
				</td>
				<td style="text-align:center">
					<span class="reviewstar" style="color: #F0CD58">
					<% for(int i=1; i<=5; i++){
                                if(i<=srdto.getStar()){
                                   %>★<%
                                }
                                else {
                                   %>☆<%
                                }
                             }
				%>
				</span>
				</td>
				<td style="text-align:center">
					<span>
						<%=sessionId%>
					</span>
				</td>
				<td style="text-align:center">
					<span>
						<%=sdf.format(srdto.getWriteday())%>
					</span>
				</td>
			</tr>
	<%} %>
	
		</table>
	</div>



</div>
</body>
</html>