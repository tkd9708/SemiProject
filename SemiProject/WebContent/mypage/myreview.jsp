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
</style>
</head>
<body>
<div class="myreview_main">
<h1>리뷰 목록</h1>
	<div class="myreview">
		<br><br>
	
		<%
			String sessionId = (String)session.getAttribute("myid");
			MemberDao mdao = new MemberDao();
			String memNum = mdao.getMemNum(sessionId);
			WishlistDao wdao = new WishlistDao();
			List<SpotReviewDto> srlist = wdao.getMyreviews(memNum);
			SpotlistDao sddao = new SpotlistDao();
			%>
			<table class="myreview table table-condensed" >
					<tr>	
						<th>관광지</th>
						<th>리뷰</th>
						<th>별점</th>
						<th>작성일</th>
					</tr>
		<%
		for(SpotReviewDto srdto: srlist){
			String contentsid = srdto.getContentsid();
			//System.out.println(contentsid);
			String title = wdao.getSpottitle(contentsid);
			SimpleDateFormat sdf = new SimpleDateFormat()
			
		%>	
			<tr>
				<td style="text-align:left">
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid%>">
					<span class="title"><%=title%></span>
					</a>
				</td>
				<td>
					<a href ="index.jsp?main=spot/spotdetail.jsp?contentsid=<%=contentsid %>#spotReview">
					<span class="reviewcontent"><%=srdto.getContent() %></span>
					</a>
				</td>
				<td>
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
				<td>
					<span>
						<%=srdto.getWriteday() %>
					</span>
				</td>
			</tr>
	<%} %>
	
		</table>
	</div>



</div>
</body>
</html>